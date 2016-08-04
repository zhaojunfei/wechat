/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.location.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.location.entity.WechatLocation;

/**
 * 微信地理位置DAO接口
 * @author zhaojf
 * @version 2016-07-18
 */
@MyBatisDao
public interface WechatLocationDao extends CrudDao<WechatLocation> {
	
}