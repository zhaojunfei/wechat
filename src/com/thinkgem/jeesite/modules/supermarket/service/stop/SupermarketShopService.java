/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.service.stop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.supermarket.entity.stop.SupermarketShop;
import com.thinkgem.jeesite.modules.supermarket.dao.stop.SupermarketShopDao;

/**
 * 商品列表Service
 * @author 773152
 * @version 2016-09-07
 */
@Service
@Transactional(readOnly = true)
public class SupermarketShopService extends CrudService<SupermarketShopDao, SupermarketShop> {

	
	public SupermarketShop get(String id) {
		SupermarketShop supermarketShop = super.get(id);
		return supermarketShop;
	}
	
	public List<SupermarketShop> findList(SupermarketShop supermarketShop) {
		return super.findList(supermarketShop);
	}
	
	public Page<SupermarketShop> findPage(Page<SupermarketShop> page, SupermarketShop supermarketShop) {
		return super.findPage(page, supermarketShop);
	}
	
	@Transactional(readOnly = false)
	public void save(SupermarketShop supermarketShop) {
		super.save(supermarketShop);
	}
	
	@Transactional(readOnly = false)
	public void delete(SupermarketShop supermarketShop) {
		super.delete(supermarketShop);
	}
	
}