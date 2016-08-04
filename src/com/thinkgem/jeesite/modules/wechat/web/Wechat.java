package com.thinkgem.jeesite.modules.wechat.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.sword.wechat4j.WechatSupport;
import org.sword.wechat4j.message.TemplateMsg;
import org.sword.wechat4j.message.template.TemplateMsgBody;
import org.sword.wechat4j.message.template.TemplateMsgData;
import org.sword.wechat4j.user.User;
import org.sword.wechat4j.user.UserManager;

import com.thinkgem.jeesite.common.utils.MobileCodeUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.location.entity.WechatLocation;
import com.thinkgem.jeesite.modules.location.service.WechatLocationService;
import com.thinkgem.jeesite.modules.wechat.entity.WechatMember;
import com.thinkgem.jeesite.modules.wechat.service.WechatMemberService;


public class Wechat extends WechatSupport {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	private final static Map<Integer,String> GLOBAL_SEX_MAP = new HashMap<Integer,String>();
	static{
		GLOBAL_SEX_MAP.put(1, "男性");
		GLOBAL_SEX_MAP.put(2, "女性");
		GLOBAL_SEX_MAP.put(0, "未知");
	}
	public Wechat(HttpServletRequest request) {
		super(request);
		
	}

	@Override
	protected void click() {
		String key = this.wechatRequest.getEventKey();
		String openid = this.wechatRequest.getFromUserName();
		if(!StringUtils.isEmpty(key)&&key.equals("checkcode")){
			String templateId = "n80DBR9xgpO_Vqja36jc12wO2u12pRQuYjl-zBScII8";
			TemplateMsg templateMsg = new TemplateMsg();
			TemplateMsgBody postData = new TemplateMsgBody();
			List<TemplateMsgData> data = new ArrayList<TemplateMsgData>();
			postData.setTouser(openid);
			TemplateMsgData checkCodeMsgData = new TemplateMsgData();
			checkCodeMsgData.setName("checkCode");
			String checkCode = MobileCodeUtils.genCheckCode();
			checkCodeMsgData.setValue(checkCode);
			data.add(checkCodeMsgData);
			postData.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa378556d31d712fe&redirect_uri=http://zhaojunfei.tunnel.qydev.com/wechat/register&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect");
			postData.setData(data);
			postData.setTemplateId(templateId);
			templateMsg.send(postData);
			//https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa378556d31d712fe&redirect_uri=http://zhaojunfei.tunnel.qydev.com/wechat/register&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect
		}
		responseText("www.zhaojunfei.com");
	}

	@Override
	protected void kfCloseSession() {
		
		
	}

	@Override
	protected void kfCreateSession() {
		
		
	}

	@Override
	protected void kfSwitchSession() {
		
		
	}

	@Override
	protected void location() {
		logger.info("获取地理位置信息");
		String openid = this.wechatRequest.getFromUserName();
		
		UserManager userManager = new UserManager();
		User user = userManager.getUserInfo(openid);
		insertWechatMember(user);
		WechatLocationService wechatLocationService = SpringContextHolder.getBean("wechatLocationService");
		String latitude = this.wechatRequest.getLatitude();
		String longitude = this.wechatRequest.getLongitude();
		String locationX = this.wechatRequest.getLocation_X();
		String locationY = this.wechatRequest.getLocation_Y();
		String precision = this.wechatRequest.getPrecision();
		WechatLocation wechatLocation = new WechatLocation(openid, precision, latitude, longitude, locationX, locationY);
		wechatLocation.setCreateDate(new Date());
		logger.info("wechatLocation:{}",wechatLocation);
		wechatLocationService.save(wechatLocation);
	}
	private WechatMember insertWechatMember(User user){
		WechatMemberService wechatMemberService = SpringContextHolder.getBean("wechatMemberService");
		WechatMember wechatMember = wechatMemberService.getWechatMember(user.getOpenId());
		if(StringUtils.isEmpty(wechatMember)){
			wechatMember = new WechatMember();
		}
		wechatMember.setStatus("0");
		wechatMember.setSubscribe(String.valueOf(user.getSubscribe()));
		wechatMember.setOpenid(user.getOpenId());
		wechatMember.setNickname(user.getNickName());
		wechatMember.setSex(GLOBAL_SEX_MAP.get(user.getSex()));
		wechatMember.setCity(user.getCity());
		wechatMember.setCountry(user.getCountry());
		wechatMember.setProvince(user.getProvince());
		wechatMember.setLanguage(user.getLanguage().name());
		wechatMember.setHeadimgurl(user.getHeadimgUrl());
		wechatMember.setSubscribeTime(user.getSubscribeTime());
		wechatMember.setUnionid(user.getUnionId());
		wechatMember.setRemark(user.getRemark());
		wechatMember.setGroupid(String.valueOf(user.getGroupId()));
		wechatMemberService.save(wechatMember);
		return wechatMember;
	}

	@Override
	protected void locationSelect() {
		
		
	}

	@Override
	protected void onImage() {
		
		
	}

	@Override
	protected void onLink() {
		
		
	}

	@Override
	protected void onLocation() {
		
		
	}

	@Override
	protected void onShortVideo() {
		
		
	}

	@Override
	protected void onText() {
		
		
	}

	@Override
	protected void onUnknown() {
		
		
	}

	@Override
	protected void onVideo() {
		
		
	}

	@Override
	protected void onVoice() {
		
		
	}

	@Override
	protected void picPhotoOrAlbum() {
		
		
	}

	@Override
	protected void picSysPhoto() {
		
		
	}

	@Override
	protected void picWeixin() {
		
		
	}

	@Override
	protected void scan() {
		logger.info("获取扫描事件");
	}

	@Override
	protected void scanCodePush() {
		
		
	}

	@Override
	protected void scanCodeWaitMsg() {
		
		
	}

	@Override
	protected void subscribe() {
		logger.info("订阅");
		String openid = this.wechatRequest.getFromUserName();
		
		UserManager userManager = new UserManager();
		User user = userManager.getUserInfo(openid);
		insertWechatMember(user);
	}

	@Override
	protected void templateMsgCallback() {
		
		
	}

	@Override
	protected void unSubscribe() {
		logger.info("取消订阅");
		String openid = this.wechatRequest.getFromUserName();
		WechatMemberService wechatMemberService = SpringContextHolder.getBean("wechatMemberService");
		WechatMember wechatMember = wechatMemberService.getWechatMember(openid);
		if(!StringUtils.isEmpty(wechatMember)){
			wechatMember.setStatus("1");
			wechatMemberService.save(wechatMember);
		}
	}

	@Override
	protected void view() {
		
		
	}
	
}
