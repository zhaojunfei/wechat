/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wechat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wechat.dao.WechatMemberDao;
import com.thinkgem.jeesite.modules.wechat.entity.WechatMember;

/**
 * 微信用户Service
 * @author zhaojf
 * @version 2016-07-18
 */
@Service
@Transactional(readOnly = true)
public class WechatMemberService extends CrudService<WechatMemberDao, WechatMember> {
	@Autowired
	private WechatMemberDao wechatMemberDao;
	public WechatMember getWechatMember(String openid) {
		return wechatMemberDao.getWechatMember(openid);
	}
	public WechatMember get(String id) {
		return super.get(id);
	}
	
	public List<WechatMember> findList(WechatMember wechatMember) {
		return super.findList(wechatMember);
	}
	
	public Page<WechatMember> findPage(Page<WechatMember> page, WechatMember wechatMember) {
		return super.findPage(page, wechatMember);
	}
	
	@Transactional(readOnly = false)
	public void save(WechatMember wechatMember) {
		super.save(wechatMember);
	}
	
	@Transactional(readOnly = false)
	public void delete(WechatMember wechatMember) {
		super.delete(wechatMember);
	}
	
}