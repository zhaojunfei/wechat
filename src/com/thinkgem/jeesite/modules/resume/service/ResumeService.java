/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.resume.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.resume.entity.Resume;
import com.thinkgem.jeesite.modules.resume.dao.ResumeDao;

/**
 * 个人基础信息Service
 * @author zhaojf
 * @version 2016-07-21
 */
@Service
@Transactional(readOnly = true)
public class ResumeService extends CrudService<ResumeDao, Resume> {
	@Autowired
	private ResumeDao resumeDao;
	public Resume get(String id) {
		return super.get(id);
	}
	
	public Resume getResumeByIdnumberAndPhoneAndName(String idnumber, String mobile, String name) {
		return resumeDao.getResumeByIdnumberAndPhoneAndName(idnumber, mobile, name);
	}
	
	public List<Resume> findList(Resume resume) {
		return super.findList(resume);
	}
	
	public Page<Resume> findPage(Page<Resume> page, Resume resume) {
		return super.findPage(page, resume);
	}
	
	@Transactional(readOnly = false)
	public void save(Resume resume) {
		super.save(resume);
	}
	
	@Transactional(readOnly = false)
	public void delete(Resume resume) {
		super.delete(resume);
	}
	
}