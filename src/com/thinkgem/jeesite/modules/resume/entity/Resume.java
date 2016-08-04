/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.resume.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 个人基础信息Entity
 * @author zhaojf
 * @version 2016-07-21
 */
public class Resume extends DataEntity<Resume> {
	
	private static final long serialVersionUID = 1L;
	private String officeId;		//所属班级
	private String name;		// 姓名
	private String gender;		// 性别
	private String headimgurl;		// 个人头像
	private String birthday;		// 出生日期
	private String workYear;		// 工作年限
	private String cardType;		// 证件类型
	private String idnumber;		// 证件号
	private String location;		// 居住地
	private String email;		// email
	private String salary;		// 目前年薪
	private String currentSituation;		// 求职状态
	private String mobile;		// 手机号码
	private String hukou;		// 户口
	private String resumekey;		// 关键字
	private String stature;		// 身高
	private String marrige;		// 婚姻状况
	private String qqTalk;		// qq号
	private String zipCode;		// 邮编
	private String aliTalk;		// 旺旺id
	private String homePage;		// 个人主页
	private String address;		// 地址
	private String studentGroup;		// 工作经验
	private String status;		// 状态
	private String channel;//业务渠道
	private String openId;//OPENID,当业务渠道为wechat的时候使用
	
	public Resume() {
		super();
	}

	public Resume(String id){
		super(id);
	}

	@Length(min=1, max=20, message="姓名长度必须介于 1 和 20 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=11, message="性别长度必须介于 0 和 11 之间")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Length(min=0, max=200, message="个人头像长度必须介于 0 和 200 之间")
	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=0, max=11, message="工作年限长度必须介于 0 和 11 之间")
	public String getWorkYear() {
		return workYear;
	}

	public void setWorkYear(String workYear) {
		this.workYear = workYear;
	}
	
	@Length(min=0, max=11, message="证件类型长度必须介于 0 和 11 之间")
	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	@Length(min=1, max=25, message="证件号长度必须介于 1 和 25 之间")
	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	
	@Length(min=0, max=150, message="居住地长度必须介于 0 和 150 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@Length(min=0, max=80, message="email长度必须介于 0 和 80 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=0, max=11, message="目前年薪长度必须介于 0 和 11 之间")
	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	@Length(min=0, max=11, message="求职状态长度必须介于 0 和 11 之间")
	public String getCurrentSituation() {
		return currentSituation;
	}

	public void setCurrentSituation(String currentSituation) {
		this.currentSituation = currentSituation;
	}
	
	@Length(min=0, max=20, message="手机号码长度必须介于 0 和 20 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=150, message="户口长度必须介于 0 和 150 之间")
	public String getHukou() {
		return hukou;
	}

	public void setHukou(String hukou) {
		this.hukou = hukou;
	}
	
	@Length(min=0, max=12, message="关键字长度必须介于 0 和 12 之间")
	public String getResumekey() {
		return resumekey;
	}

	public void setResumekey(String resumekey) {
		this.resumekey = resumekey;
	}
	
	@Length(min=0, max=11, message="身高长度必须介于 0 和 11 之间")
	public String getStature() {
		return stature;
	}

	public void setStature(String stature) {
		this.stature = stature;
	}
	
	@Length(min=0, max=11, message="婚姻状况长度必须介于 0 和 11 之间")
	public String getMarrige() {
		return marrige;
	}

	public void setMarrige(String marrige) {
		this.marrige = marrige;
	}
	
	@Length(min=0, max=20, message="qq号长度必须介于 0 和 20 之间")
	public String getQqTalk() {
		return qqTalk;
	}

	public void setQqTalk(String qqTalk) {
		this.qqTalk = qqTalk;
	}
	
	@Length(min=0, max=6, message="邮编长度必须介于 0 和 6 之间")
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	@Length(min=0, max=100, message="旺旺id长度必须介于 0 和 100 之间")
	public String getAliTalk() {
		return aliTalk;
	}

	public void setAliTalk(String aliTalk) {
		this.aliTalk = aliTalk;
	}
	
	@Length(min=0, max=200, message="个人主页长度必须介于 0 和 200 之间")
	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	
	@Length(min=0, max=150, message="地址长度必须介于 0 和 150 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=11, message="工作经验长度必须介于 0 和 11 之间")
	public String getStudentGroup() {
		return studentGroup;
	}

	public void setStudentGroup(String studentGroup) {
		this.studentGroup = studentGroup;
	}
	
	@Length(min=1, max=1, message="状态长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	
}