/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.location.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.location.entity.WechatLocation;
import com.thinkgem.jeesite.modules.location.dao.WechatLocationDao;

/**
 * 微信地理位置Service
 * @author zhaojf
 * @version 2016-07-18
 */
@Service
@Transactional(readOnly = true)
public class WechatLocationService extends CrudService<WechatLocationDao, WechatLocation> {

	public WechatLocation get(String id) {
		return super.get(id);
	}
	
	public List<WechatLocation> findList(WechatLocation wechatLocation) {
		return super.findList(wechatLocation);
	}
	
	public Page<WechatLocation> findPage(Page<WechatLocation> page, WechatLocation wechatLocation) {
		return super.findPage(page, wechatLocation);
	}
	
	@Transactional(readOnly = false)
	public void save(WechatLocation wechatLocation) {
		super.save(wechatLocation);
	}
	
	@Transactional(readOnly = false)
	public void delete(WechatLocation wechatLocation) {
		super.delete(wechatLocation);
	}
	
}