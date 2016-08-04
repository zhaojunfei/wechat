/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qiandao.entity;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 签到管理Entity
 * @author 773152
 * @version 2016-08-01
 */
public class Qiandao extends DataEntity<Qiandao> {
	
	private static final long serialVersionUID = 1L;
	private String date;		// 日期
	private String week;		// 星期
	private String clockIn;		// 上班打卡
	private String clockOut;		// 下班打卡
	private User user;	// 创建者
	private Date beginDate;		// 开始日期
	private Date endDate;		// 结束日期
	public Qiandao() {
		super();
	}

	public Qiandao(String id){
		super(id);
	}

	@Length(min=1, max=64, message="日期长度必须介于 1 和 64 之间")
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	@Length(min=1, max=64, message="星期长度必须介于 1 和 64 之间")
	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}
	
	@Length(min=0, max=64, message="上班打卡长度必须介于 0 和 64 之间")
	public String getClockIn() {
		return clockIn;
	}

	public void setClockIn(String clockIn) {
		this.clockIn = clockIn;
	}
	
	@Length(min=0, max=64, message="下班打卡长度必须介于 0 和 64 之间")
	public String getClockOut() {
		return clockOut;
	}

	public void setClockOut(String clockOut) {
		this.clockOut = clockOut;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
	
}