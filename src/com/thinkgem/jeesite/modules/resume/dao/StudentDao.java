/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.resume.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.resume.entity.Resume;

/**
 * 个人基础信息DAO接口
 * @author zhaojf
 * @version 2016-07-21
 */
@MyBatisDao
public interface StudentDao extends CrudDao<Resume> {
	
}