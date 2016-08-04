package com.thinkgem.jeesite.modules.scan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sword.wechat4j.user.UserManager;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.qiandao.service.QiandaoService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
@Controller
@RequestMapping(value = "/scan")
public class ScanController extends BaseController{
	private static Logger logger = LoggerFactory.getLogger(ScanController.class);
	@Autowired
	private QiandaoService qiandaoService;
	@RequestMapping(value = "/qiandao")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		UserManager userManager = new UserManager();
		String openId = userManager.getOpenId(code);
		logger.info("操作用户:{}", openId);
		User user = UserUtils.getUserByOpenId(openId);
		logger.info("根据openid查找相关用户信息 user:{}",user);
		if(!StringUtils.isEmpty(user)){
			qiandaoService.getQiandaoByUser(user);
			return "/modules/scan/success";
		}
		return "/modules/scan/error";
	}

}
