/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.resume.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.resume.entity.Resume;

/**
 * 个人基础信息DAO接口
 * @author zhaojf
 * @version 2016-07-21
 */
@MyBatisDao
public interface ResumeDao extends CrudDao<Resume> {
	@Select("select * from Resume where name=#{name} and mobile=#{mobile}")
	public Resume getResumeByTruenameAndPhone(@Param(value = "name") String name,@Param(value="mobile") String mobile);
}