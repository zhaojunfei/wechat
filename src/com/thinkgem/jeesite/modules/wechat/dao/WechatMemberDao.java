/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wechat.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wechat.entity.WechatMember;

/**
 * 微信用户DAO接口
 * @author zhaojf
 * @version 2016-07-18
 */
@MyBatisDao
public interface WechatMemberDao extends CrudDao<WechatMember> {
	public WechatMember getWechatMember(@Param("openid") String openid);
}