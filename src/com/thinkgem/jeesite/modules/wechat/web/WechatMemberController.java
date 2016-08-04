/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wechat.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wechat.entity.WechatMember;
import com.thinkgem.jeesite.modules.wechat.service.WechatMemberService;

/**
 * 微信用户Controller
 * @author zhaojf
 * @version 2016-07-18
 */
@Controller
@RequestMapping(value = "${adminPath}/wechat/wechatMember")
public class WechatMemberController extends BaseController {

	@Autowired
	private WechatMemberService wechatMemberService;
	
	@ModelAttribute
	public WechatMember get(@RequestParam(required=false) String id) {
		WechatMember entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = wechatMemberService.get(id);
		}
		if (entity == null){
			entity = new WechatMember();
		}
		return entity;
	}
	
	@RequiresPermissions("wechat:wechatMember:view")
	@RequestMapping(value = {"list", ""})
	public String list(WechatMember wechatMember, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WechatMember> page = wechatMemberService.findPage(new Page<WechatMember>(request, response), wechatMember); 
		model.addAttribute("page", page);
		return "modules/wechat/wechatMemberList";
	}

	@RequiresPermissions("wechat:wechatMember:view")
	@RequestMapping(value = "form")
	public String form(WechatMember wechatMember, Model model) {
		model.addAttribute("wechatMember", wechatMember);
		return "modules/wechat/wechatMemberForm";
	}

	@RequiresPermissions("wechat:wechatMember:edit")
	@RequestMapping(value = "save")
	public String save(WechatMember wechatMember, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, wechatMember)){
			return form(wechatMember, model);
		}
		wechatMemberService.save(wechatMember);
		addMessage(redirectAttributes, "保存微信用户成功");
		return "redirect:"+Global.getAdminPath()+"/wechat/wechatMember/?repage";
	}
	
	@RequiresPermissions("wechat:wechatMember:edit")
	@RequestMapping(value = "delete")
	public String delete(WechatMember wechatMember, RedirectAttributes redirectAttributes) {
		wechatMemberService.delete(wechatMember);
		addMessage(redirectAttributes, "删除微信用户成功");
		return "redirect:"+Global.getAdminPath()+"/wechat/wechatMember/?repage";
	}

}