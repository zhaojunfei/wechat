package com.thinkgem.jeesite.modules.wechat.web;

import java.io.IOException;

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
import org.sword.wechat4j.user.UserManager;

import com.thinkgem.jeesite.modules.resume.entity.Resume;
import com.thinkgem.jeesite.modules.resume.service.ResumeService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wechat.web.param.UserRegister;



@Controller
@RequestMapping("/wechat")
public class WeChatController {
	private static Logger logger = Logger.getLogger(WeChatController.class);
	@Autowired
	private ResumeService resumeService;
	@RequestMapping
	public void execute(HttpServletRequest request, HttpServletResponse response){
		Wechat wechat = new Wechat(request);
		String result = wechat.execute();
		if(result.indexOf("www.zhaojunfei.com")>0){
			result = "";
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
		String name = userRegister.getTruename();
		String mobile = userRegister.getPhone();
		UserManager userManager = new UserManager();
		String openId = userManager.getOpenId(code);
		Resume resume = resumeService.getResumeByTruenameAndPhone(name, mobile);
		if(null!=resume){
			resume.setOpenId(openId);
			resumeService.save(resume);
		}
		return "wechat/register_success";
	}
	
	
	
}
