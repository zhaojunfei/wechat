/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.dao.stop;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.supermarket.entity.stop.SupermarketShop;

/**
 * 商品列表DAO接口
 * @author 773152
 * @version 2016-09-07
 */
@MyBatisDao
public interface SupermarketShopDao extends CrudDao<SupermarketShop> {
	
}