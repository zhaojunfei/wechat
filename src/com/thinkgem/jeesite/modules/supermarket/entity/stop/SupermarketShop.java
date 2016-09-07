/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.entity.stop;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品列表Entity
 * @author 773152
 * @version 2016-09-07
 */
public class SupermarketShop extends DataEntity<SupermarketShop> {
	
	private static final long serialVersionUID = 1L;
	private String typeId;		// 商品分类
	private String name;		// 商品名称
	private String company;		// 单位
	private String price;		// 零售价
	private String value;		// 进货价
	private String gain;		// 利润百分比
	private String description;		// 描述
	
	public SupermarketShop() {
		super();
	}

	public SupermarketShop(String id){
		super(id);
	}

	@Length(min=1, max=64, message="商品分类长度必须介于 1 和 64 之间")
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	@Length(min=0, max=64, message="商品名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=64, message="单位长度必须介于 1 和 64 之间")
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public String getGain() {
		return gain;
	}

	public void setGain(String gain) {
		this.gain = gain;
	}
	
	@Length(min=0, max=100, message="描述长度必须介于 0 和 100 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}