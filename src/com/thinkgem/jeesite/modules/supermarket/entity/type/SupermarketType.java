/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.supermarket.entity.type;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 超市种类信息表Entity
 * @author 773152
 * @version 2016-09-07
 */
public class SupermarketType extends DataEntity<SupermarketType> {
	
	private static final long serialVersionUID = 1L;
	private String dictId;		// 类型
	private String label;		// 标签名
	private String value;		// 数据值
	private String photo;		// 图片
	private String description;		// 描述
	private String sort;		// 排序（升序）
	
	public SupermarketType() {
		super();
	}

	public SupermarketType(String id){
		super(id);
	}

	@Length(min=0, max=64, message="类型长度必须介于 0 和 64 之间")
	public String getDictId() {
		return dictId;
	}

	public void setDictId(String dictId) {
		this.dictId = dictId;
	}
	
	@Length(min=1, max=100, message="商品名称长度必须介于 1 和 100 之间")
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}