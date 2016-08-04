/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.location.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 微信地理位置Entity
 * @author zhaojf
 * @version 2016-07-18
 */
public class WechatLocation extends DataEntity<WechatLocation> {
	
	private static final long serialVersionUID = 1L;
	private String openid;		// 用户的标识，对当前公众号唯一
	private String precision;		// 地理位置精度
	private String latitude;		// 地理位置纬度
	private String longitude;		// 地理位置经度
	private String locationX;		// location_x
	private String locationY;		// location_y
	private String status;		// 状态
	
	public WechatLocation() {
		super();
	}
	

	public WechatLocation(String openid, String precision, String latitude, String longitude, String locationX,
			String locationY) {
		super();
		this.openid = openid;
		this.precision = precision;
		this.latitude = latitude;
		this.longitude = longitude;
		this.locationX = locationX;
		this.locationY = locationY;
	}


	public WechatLocation(String id){
		super(id);
	}

	@Length(min=1, max=200, message="用户的标识，对当前公众号唯一长度必须介于 1 和 200 之间")
	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}
	
	@Length(min=0, max=200, message="地理位置精度长度必须介于 0 和 200 之间")
	public String getPrecision() {
		return precision;
	}

	public void setPrecision(String precision) {
		this.precision = precision;
	}
	
	@Length(min=0, max=200, message="地理位置纬度长度必须介于 0 和 200 之间")
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	
	@Length(min=0, max=200, message="地理位置经度长度必须介于 0 和 200 之间")
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	@Length(min=0, max=200, message="location_x长度必须介于 0 和 200 之间")
	public String getLocationX() {
		return locationX;
	}

	public void setLocationX(String locationX) {
		this.locationX = locationX;
	}
	
	@Length(min=0, max=200, message="location_y长度必须介于 0 和 200 之间")
	public String getLocationY() {
		return locationY;
	}

	public void setLocationY(String locationY) {
		this.locationY = locationY;
	}
	
	@Length(min=1, max=1, message="状态长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "WechatLocation [openid=" + openid + ", precision=" + precision + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", locationX=" + locationX + ", locationY=" + locationY + ", status="
				+ status + "]";
	}
	
}