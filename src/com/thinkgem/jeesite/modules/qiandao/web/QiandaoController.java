/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qiandao.web;

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
import com.thinkgem.jeesite.modules.qiandao.entity.Qiandao;
import com.thinkgem.jeesite.modules.qiandao.service.QiandaoService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 签到管理Controller
 * @author 773152
 * @version 2016-08-01
 */
@Controller
@RequestMapping(value = "${adminPath}/qiandao/qiandao")
public class QiandaoController extends BaseController {

	@Autowired
	private QiandaoService qiandaoService;
	@RequestMapping(value = "/init")
	public void initQiandao(String userid){
		qiandaoService.initRegisterQiandao(new User(userid));
	}

	@ModelAttribute
	public Qiandao get(@RequestParam(required=false) String id) {
		Qiandao entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qiandaoService.get(id);
		}
		if (entity == null){
			entity = new Qiandao();
		}
		return entity;
	}
	
	@RequiresPermissions("qiandao:qiandao:view")
	@RequestMapping(value = {"list", ""})
	public String list(Qiandao qiandao, HttpServletRequest request, HttpServletResponse response, Model model) {
		qiandao.setUser(UserUtils.getUser());
		Page<Qiandao> page = qiandaoService.findPage(new Page<Qiandao>(request, response), qiandao); 
		model.addAttribute("page", page);
		return "modules/qiandao/qiandaoList";
	}

	@RequiresPermissions("qiandao:qiandao:view")
	@RequestMapping(value = "form")
	public String form(Qiandao qiandao, Model model) {
		model.addAttribute("qiandao", qiandao);
		return "modules/qiandao/qiandaoForm";
	}

	@RequiresPermissions("qiandao:qiandao:edit")
	@RequestMapping(value = "save")
	public String save(Qiandao qiandao, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qiandao)){
			return form(qiandao, model);
		}
		qiandaoService.save(qiandao);
		addMessage(redirectAttributes, "保存签到成功成功");
		return "redirect:"+Global.getAdminPath()+"/qiandao/qiandao/?repage";
	}
	
	@RequiresPermissions("qiandao:qiandao:edit")
	@RequestMapping(value = "delete")
	public String delete(Qiandao qiandao, RedirectAttributes redirectAttributes) {
		qiandaoService.delete(qiandao);
		addMessage(redirectAttributes, "删除签到成功成功");
		return "redirect:"+Global.getAdminPath()+"/qiandao/qiandao/?repage";
	}

}