/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.web.stop;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.supermarket.entity.stop.SupermarketShop;
import com.thinkgem.jeesite.modules.supermarket.entity.type.SupermarketType;
import com.thinkgem.jeesite.modules.supermarket.service.stop.SupermarketShopService;
import com.thinkgem.jeesite.modules.supermarket.service.type.SupermarketTypeService;

/**
 * 商品列表Controller
 * @author 773152
 * @version 2016-09-07
 */
@Controller
@RequestMapping(value = "${adminPath}/supermarket/stop/supermarketShop")
public class SupermarketShopController extends BaseController {

	@Autowired
	private SupermarketShopService supermarketShopService;
	@Autowired
	private SupermarketTypeService supermarketTypeService;
	
	@ModelAttribute
	public SupermarketShop get(@RequestParam(required=false) String id) {
		SupermarketShop entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = supermarketShopService.get(id);
		}
		if (entity == null){
			entity = new SupermarketShop();
		}
		return entity;
	}
	
	@RequiresPermissions("supermarket:stop:supermarketShop:view")
	@RequestMapping(value = {"list", ""})
	public String list(SupermarketShop supermarketShop, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SupermarketShop> page = supermarketShopService.findPage(new Page<SupermarketShop>(request, response), supermarketShop); 
		model.addAttribute("page", page);
		return "modules/supermarket/stop/supermarketShopList";
	}

	@RequiresPermissions("supermarket:stop:supermarketShop:view")
	@RequestMapping(value = "form")
	public String form(SupermarketShop supermarketShop, Model model) {
		model.addAttribute("supermarketShop", supermarketShop);
		model.addAttribute("typeList", supermarketTypeService.findList(new SupermarketType()));
		return "modules/supermarket/stop/supermarketShopForm";
	}

	@RequiresPermissions("supermarket:stop:supermarketShop:edit")
	@RequestMapping(value = "save")
	public String save(SupermarketShop supermarketShop, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, supermarketShop)){
			return form(supermarketShop, model);
		}
		supermarketShopService.save(supermarketShop);
		addMessage(redirectAttributes, "保存商品列表成功");
		return "redirect:"+Global.getAdminPath()+"/supermarket/stop/supermarketShop/?repage";
	}
	
	@RequiresPermissions("supermarket:stop:supermarketShop:edit")
	@RequestMapping(value = "delete")
	public String delete(SupermarketShop supermarketShop, RedirectAttributes redirectAttributes) {
		supermarketShopService.delete(supermarketShop);
		addMessage(redirectAttributes, "删除商品列表成功");
		return "redirect:"+Global.getAdminPath()+"/supermarket/stop/supermarketShop/?repage";
	}

}