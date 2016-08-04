/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.qiandao.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.qiandao.dao.QiandaoDao;
import com.thinkgem.jeesite.modules.qiandao.entity.Qiandao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 签到管理Service
 * @author 773152
 * @version 2016-08-01
 */
@Service
@Transactional(readOnly = true)
public class QiandaoService extends CrudService<QiandaoDao, Qiandao> {
	@Autowired
	private QiandaoDao qiandaoDao;
	public Qiandao get(String id) {
		return super.get(id);
	}
	@Transactional(readOnly = false)
	public void getQiandaoByUser(User user) {
		
		Qiandao qiandao = new Qiandao();
		qiandao.setUser(user);
		qiandao.setDate(DateUtils.getDate("yyyy-MM-dd"));
		qiandao = qiandaoDao.getQiandaoByUser(qiandao);
		String clockIn = qiandao.getClockIn().equals("缺勤")?DateUtils.getDate("HH:mm:ss"):qiandao.getClockIn();
		String clockOut = DateUtils.getDate("HH:mm:ss");
		qiandao.setClockIn(clockIn);
		qiandao.setClockOut(clockOut);
		this.save(qiandao);
	}
	@Transactional(readOnly = false)
	public void initRegisterQiandao(User user){
		logger.info("初始化签到数据");
	  	Calendar calender = Calendar.getInstance();
        int count =  calender.getActualMaximum(Calendar.DAY_OF_MONTH);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int c = calender.getTime().getDate() - 1;//计算今天几号,只初始化本月的数据.其他初始化数据由定时任务完成
        for (int i = 0; i < (count-c); i++)
        {
	        Date dd  = calender.getTime();
	        String date = sdf.format(dd);
	        String week = DateUtils.getWeekOfDate(calender.getTime());
	        String clockIn = "缺勤";
	        String clockOut = "缺勤";
	        Qiandao qiandao = new Qiandao();
	        qiandao.setDate(date);
	        qiandao.setWeek(week);
	        qiandao.setClockIn(clockIn);
	        qiandao.setClockOut(clockOut);
	        qiandao.setUser(user);
	        this.save(qiandao);
	        calender.add(Calendar.DAY_OF_MONTH, 1);
        }
	}
	
	public List<Qiandao> findList(Qiandao qiandao) {
		return super.findList(qiandao);
	}
	
	public Page<Qiandao> findPage(Page<Qiandao> page, Qiandao qiandao) {
		// 设置默认时间范围，默认当前月
				if (qiandao.getBeginDate() == null){
					qiandao.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
				}
				if (qiandao.getEndDate() == null){
					qiandao.setEndDate(DateUtils.addMonths(qiandao.getBeginDate(), 1));
				}
				
		return super.findPage(page, qiandao);
	}
	
	@Transactional(readOnly = false)
	public void save(Qiandao qiandao) {
		qiandao.setUpdateDate(new Date());
		super.save(qiandao);
	}
	
	@Transactional(readOnly = false)
	public void delete(Qiandao qiandao) {
		super.delete(qiandao);
	}
	
}