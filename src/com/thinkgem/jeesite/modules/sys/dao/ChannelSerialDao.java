package com.thinkgem.jeesite.modules.sys.dao;

import org.apache.ibatis.annotations.Select;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface ChannelSerialDao {
	@Select("select	getSequence('serialNo')")
	String getChannelSerialNo();
}
