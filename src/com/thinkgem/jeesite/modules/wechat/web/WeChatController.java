package com.thinkgem.jeesite.modules.wechat.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sword.wechat4j.user.UserManager;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.modules.resume.entity.Resume;
import com.thinkgem.jeesite.modules.resume.service.ResumeService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wechat.web.param.UserRegister;



@Controller
@RequestMapping("/wechat")
public class WeChatController {
	private static Logger logger = Logger.getLogger(WeChatController.class);
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private SystemService systemService;
	@RequestMapping
	public void execute(HttpServletRequest request, HttpServletResponse response){
		Wechat wechat = new Wechat(request);
		String result = wechat.execute();
		if(result.indexOf("www.zhaojunfei.com")>0){
			//result = "";
		}
		logger.info("response result message:" + result);
		try {
			ServletOutputStream os = response.getOutputStream();
			os.write(result.getBytes("UTF-8"));
			os.flush();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/register")
	public String register(HttpServletRequest request, HttpServletResponse response,Model model){
		String code = request.getParameter("code");
		model.addAttribute("code",code);
		UserManager userManager = new UserManager();
		String openId = userManager.getOpenId(code);
		User user = UserUtils.getUserByOpenId(openId);
		if(!StringUtils.isEmpty(user)){
			return "wechat/register_success";
			
		}
		return "wechat/register";
	}

	/**
	 * 验证验证码
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/checkCode")
	public String checkCode(UserRegister userRegister,HttpServletRequest request, HttpServletResponse response,HttpSession httpSession,Model model){
		String code = userRegister.getCode();
		if(StringUtils.isEmpty(code)){
			return "wechat/register_error";
		}
		UserManager userManager = new UserManager();
		String openId = userManager.getOpenId(code);
		
		String name = userRegister.getTruename();
		String mobile = userRegister.getPhone();
		String idnumber = userRegister.getIdnumber();
		User user = UserUtils.getUserByIdnumberAndPhoneAndName(idnumber,mobile,name);
		if(!StringUtils.isEmpty(user)){
			if(StringUtils.isEmpty(user)){
				user.setOpenId(openId);
				systemService.saveUser(user);
			}
		}else{
			Resume resume = resumeService.getResumeByIdnumberAndPhoneAndName(idnumber,mobile,name);
			if(StringUtils.isEmpty(resume)){
				return "redirect:/a/resume/resume/resume";
			}
			if(null!=resume){
				resume.setOpenId(openId);
				resumeService.save(resume);
			}
		}
		
		return "wechat/register_success";
	}

	
	
}
