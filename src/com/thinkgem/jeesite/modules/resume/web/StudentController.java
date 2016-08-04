/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.resume.web;

import java.util.List;

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
import com.thinkgem.jeesite.modules.resume.entity.Resume;
import com.thinkgem.jeesite.modules.resume.service.StudentService;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 个人基础信息Controller
 * @author zhaojf
 * @version 2016-07-21
 */
@Controller
@RequestMapping(value = "${adminPath}/resume/student")
public class StudentController extends BaseController {

	@Autowired
	private StudentService studentService;
	

	@ModelAttribute
	public Resume get(@RequestParam(required=false) String id) {
		Resume entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = studentService.get(id);
		}
		if (entity == null){
			entity = new Resume();
		}
		return entity;
	}
	
	@RequiresPermissions("resume:student:view")
	@RequestMapping(value = {"list", ""})
	public String list(Resume resume, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Role> roles =  UserUtils.getRoleList();
		for(Role role:roles){
			if(role.getEnname().indexOf("teacher")>-1&&role.getRoleType().equals("user")){
				User user = UserUtils.getUser();
				if(!user.isAdmin()){
					String officeId = user.getOffice().getId();
					resume.setOfficeId(officeId);
				}
				
			}
		}
		
		Page<Resume> page = studentService.findPage(new Page<Resume>(request, response), resume); 
		model.addAttribute("page", page);
		return "modules/student/resumeList";
	}

	
	@RequestMapping(value = "form")
	public String form(Resume resume, Model model) {
		model.addAttribute("resume", resume);
		return "modules/student/resumeForm";
	}
	
	
	@RequiresPermissions("resume:student:edit")
	@RequestMapping(value = "delete")
	public String delete(Resume resume, RedirectAttributes redirectAttributes) {
		studentService.delete(resume);
		addMessage(redirectAttributes, "删除个人基础信息成功");
		return "redirect:"+Global.getAdminPath()+"/resume/student/?repage";
	}

}