/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.service.type;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.supermarket.entity.type.SupermarketType;
import com.thinkgem.jeesite.modules.supermarket.dao.type.SupermarketTypeDao;

/**
 * 超市种类信息表Service
 * @author 773152
 * @version 2016-09-07
 */
@Service
@Transactional(readOnly = true)
public class SupermarketTypeService extends CrudService<SupermarketTypeDao, SupermarketType> {

	public SupermarketType get(String id) {
		return super.get(id);
	}
	
	public List<SupermarketType> findList(SupermarketType supermarketType) {
		return super.findList(supermarketType);
	}
	
	public Page<SupermarketType> findPage(Page<SupermarketType> page, SupermarketType supermarketType) {
		return super.findPage(page, supermarketType);
	}
	
	@Transactional(readOnly = false)
	public void save(SupermarketType supermarketType) {
		super.save(supermarketType);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupermarketType supermarketType) {
		super.delete(supermarketType);
	}
	
}