/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.resume.web;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.account.service.AccountService;
import com.thinkgem.jeesite.modules.qiandao.service.QiandaoService;
import com.thinkgem.jeesite.modules.resume.entity.Resume;
import com.thinkgem.jeesite.modules.resume.service.ResumeService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 个人基础信息Controller
 * @author zhaojf
 * @version 2016-07-21
 */
@Controller
@RequestMapping(value = "${adminPath}/resume/resume")
public class ResumeController extends BaseController {

	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private  SystemService systemService;
	
	@Autowired
	private QiandaoService qiandaoService;
	@Autowired
	private AccountService accountService;
	@ModelAttribute
	public Resume get(@RequestParam(required=false) String id) {
		Resume entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = resumeService.get(id);
		}
		if (entity == null){
			entity = new Resume();
		}
		return entity;
	}
	
	@RequiresPermissions("resume:resume:view")
	@RequestMapping(value = {"list", ""})
	public String list(Resume resume, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Resume> page = resumeService.findPage(new Page<Resume>(request, response), resume); 
		model.addAttribute("page", page);
		return "modules/resume/resumeList";
	}

	
	@RequestMapping(value = "form")
	public String form(Resume resume, Model model) {
		model.addAttribute("resume", resume);
		return "modules/resume/resumeForm";
	}
	
	
	@RequiresPermissions("resume:resume:edit")
	@RequestMapping(value = "save")
	public String save(Resume resume, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, resume)){
			return form(resume, model);
		}
		
		if(StringUtils.isNotBlank(resume.getStatus())&&resume.getStatus().equals("1")){
			//根据手机号查找用户是否存在
			systemService.insertUser(resume.getMobile(), resume.getIdnumber(), resume.getName(), resume.getEmail());
			//初始化签到信息
			User user = UserUtils.getByLoginName(resume.getMobile());
			qiandaoService.initRegisterQiandao(user);
			//开通虚拟账户
			String accountNo = accountService.openAccount(user.getName(), user.getMobile());
			user.setAccountNo(accountNo);
			systemService.saveUser(user);
		}
		
		resumeService.save(resume);
		addMessage(redirectAttributes, "保存个人基础信息成功");
		return "redirect:"+Global.getAdminPath()+"/resume/resume/?repage";
	}

	

	@RequiresPermissions("resume:resume:edit")
	@RequestMapping(value = "delete")
	public String delete(Resume resume, RedirectAttributes redirectAttributes) {
		resumeService.delete(resume);
		addMessage(redirectAttributes, "删除个人基础信息成功");
		return "redirect:"+Global.getAdminPath()+"/resume/resume/?repage";
	}
	
	

	@RequestMapping(value = "resume")
	public String resume() {
		return "modules/resume/resumeSubmit";
	}

	@RequestMapping(value = "resumeSubmit")
	public String resumeSubmit(Resume resume,HttpServletRequest request,HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		String validateCode = request.getParameter("validateCode");
		String code = (String)session.getAttribute(ValidateCodeServlet.VALIDATE_CODE);
		if (validateCode == null || !validateCode.toUpperCase().equals(code)){
			return "验证码错误";
		}
        MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;  
        MultipartFile pdfFile  =  multipartRequest.getFile("filename");  
        if(pdfFile!=null){
        	 String imgName = pdfFile.getOriginalFilename();
             String suffix = imgName.substring(imgName.lastIndexOf(".")+1,imgName.length());
             String name = IdGen.uuid();
             String headimgurl = Global.USERFILES_BASE_URL + "head" + "/" + name +"."+suffix;
             //本地保存路径
             String fileLocalPath = Global.getUserfilesBaseDir() + headimgurl;
             //创建目录
             File saveDirFile = new File(fileLocalPath);
              if (!saveDirFile.exists()) {
                  saveDirFile.mkdirs();
              }
              resume.setHeadimgurl(headimgurl);
        }
       
		//设置用户状态否
		resume.setStatus("0");
		resumeService.save(resume);
		return "modules/resume/success";
	}


}