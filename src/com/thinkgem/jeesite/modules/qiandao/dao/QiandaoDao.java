/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qiandao.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.qiandao.entity.Qiandao;

/**
 * 签到管理DAO接口
 * @author 773152
 * @version 2016-08-01
 */
@MyBatisDao
public interface QiandaoDao extends CrudDao<Qiandao> {
	Qiandao getQiandaoByUser(Qiandao qiandao);
}