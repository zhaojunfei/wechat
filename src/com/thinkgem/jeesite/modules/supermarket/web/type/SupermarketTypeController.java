/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.web.type;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.supermarket.entity.type.SupermarketType;
import com.thinkgem.jeesite.modules.supermarket.service.type.SupermarketTypeService;

/**
 * 超市种类信息表Controller
 * @author 773152
 * @version 2016-09-07
 */
@Controller
@RequestMapping(value = "${adminPath}/supermarket/type/supermarketType")
public class SupermarketTypeController extends BaseController {

	@Autowired
	private SupermarketTypeService supermarketTypeService;
	
	@ModelAttribute
	public SupermarketType get(@RequestParam(required=false) String id) {
		SupermarketType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supermarketTypeService.get(id);
		}
		if (entity == null){
			entity = new SupermarketType();
		}
		return entity;
	}
	
	@RequestMapping(value = {"detail", ""})
	@ResponseBody
	public SupermarketType detail(@RequestParam(required=false) String id) {
		
		return get(id);
	}
	
	@RequiresPermissions("supermarket:type:supermarketType:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupermarketType supermarketType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupermarketType> page = supermarketTypeService.findPage(new Page<SupermarketType>(request, response), supermarketType); 
		model.addAttribute("page", page);
		return "modules/supermarket/type/supermarketTypeList";
	}

	@RequiresPermissions("supermarket:type:supermarketType:view")
	@RequestMapping(value = "form")
	public String form(SupermarketType supermarketType, Model model) {
		model.addAttribute("supermarketType", supermarketType);
		return "modules/supermarket/type/supermarketTypeForm";
	}

	@RequiresPermissions("supermarket:type:supermarketType:edit")
	@RequestMapping(value = "save")
	public String save(SupermarketType supermarketType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supermarketType)){
			return form(supermarketType, model);
		}
		supermarketTypeService.save(supermarketType);
		addMessage(redirectAttributes, "保存超市种类信息表成功");
		return "redirect:"+Global.getAdminPath()+"/supermarket/type/supermarketType/?repage";
	}
	
	@RequiresPermissions("supermarket:type:supermarketType:edit")
	@RequestMapping(value = "delete")
	public String delete(SupermarketType supermarketType, RedirectAttributes redirectAttributes) {
		supermarketTypeService.delete(supermarketType);
		addMessage(redirectAttributes, "删除超市种类信息表成功");
		return "redirect:"+Global.getAdminPath()+"/supermarket/type/supermarketType/?repage";
	}

}