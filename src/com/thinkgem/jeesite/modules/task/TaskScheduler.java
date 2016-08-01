package com.thinkgem.jeesite.modules.task;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.qiandao.entity.Qiandao;
import com.thinkgem.jeesite.modules.qiandao.service.QiandaoService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Service
@Lazy(false)
public class TaskScheduler {
	private static Logger logger = Logger.getLogger(TaskScheduler.class);
	@Autowired
	private QiandaoService qiandaoService;
	@Autowired
	private SystemService systemService;
	@Scheduled(cron = "0 0 0 1 * ?")
	public void createQiandaoTimestamp() {
		logger.info("初始化签到数据");
		Calendar calender = Calendar.getInstance();
		int count = calender.getActualMaximum(Calendar.DAY_OF_MONTH);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<User> list = systemService.findUser(UserUtils.get("1").getCurrentUser());
		for(User user:list){
			for (int i = 0; i < count; i++) {
				Date dd = calender.getTime();
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
				 qiandaoService.save(qiandao);
				 calender.add(Calendar.DAY_OF_MONTH, 1);
			}
		}
		
	}

}
