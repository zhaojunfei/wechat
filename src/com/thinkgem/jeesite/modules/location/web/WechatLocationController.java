/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.location.web;

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
import com.thinkgem.jeesite.modules.location.entity.WechatLocation;
import com.thinkgem.jeesite.modules.location.service.WechatLocationService;

/**
 * 微信地理位置Controller
 * @author zhaojf
 * @version 2016-07-18
 */
@Controller
@RequestMapping(value = "${adminPath}/location/wechatLocation")
public class WechatLocationController extends BaseController {

	@Autowired
	private WechatLocationService wechatLocationService;
	
	@ModelAttribute
	public WechatLocation get(@RequestParam(required=false) String id) {
		WechatLocation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = wechatLocationService.get(id);
		}
		if (entity == null){
			entity = new WechatLocation();
		}
		return entity;
	}
	
	@RequiresPermissions("location:wechatLocation:view")
	@RequestMapping(value = {"list", ""})
	public String list(WechatLocation wechatLocation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WechatLocation> page = wechatLocationService.findPage(new Page<WechatLocation>(request, response), wechatLocation); 
		model.addAttribute("page", page);
		return "modules/location/wechatLocationList";
	}

	@RequiresPermissions("location:wechatLocation:view")
	@RequestMapping(value = "form")
	public String form(WechatLocation wechatLocation, Model model) {
		model.addAttribute("wechatLocation", wechatLocation);
		return "modules/location/wechatLocationForm";
	}

	@RequiresPermissions("location:wechatLocation:edit")
	@RequestMapping(value = "save")
	public String save(WechatLocation wechatLocation, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, wechatLocation)){
			return form(wechatLocation, model);
		}
		wechatLocationService.save(wechatLocation);
		addMessage(redirectAttributes, "保存微信地理位置成功");
		return "redirect:"+Global.getAdminPath()+"/location/wechatLocation/?repage";
	}
	
	@RequiresPermissions("location:wechatLocation:edit")
	@RequestMapping(value = "delete")
	public String delete(WechatLocation wechatLocation, RedirectAttributes redirectAttributes) {
		wechatLocationService.delete(wechatLocation);
		addMessage(redirectAttributes, "删除微信地理位置成功");
		return "redirect:"+Global.getAdminPath()+"/location/wechatLocation/?repage";
	}

}