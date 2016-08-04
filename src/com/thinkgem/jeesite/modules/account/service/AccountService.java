package com.thinkgem.jeesite.modules.account.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.HttpUtils;
import com.thinkgem.jeesite.modules.sys.dao.ChannelSerialDao;
@Service
@Transactional(readOnly = true)
public class AccountService {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private HashMap<String, String> accountSystem;
	@Autowired
	private ChannelSerialDao channelSerialDao;
	@Transactional(readOnly = false)
	public String openAccount(String phone,String truename){
		String accountHost = accountSystem.get("accountHost");
		String openAccount = accountSystem.get("openAccount");
		String url = accountHost.concat(openAccount);
		String channelSystemNo = accountSystem.get("channelSystemNo");
		String channelSerialNo = channelSerialDao.getChannelSerialNo();
		Map<String, String> params = new HashMap<String, String>();
		params.put("channelSystemNo", channelSystemNo);
		params.put("channelSerialNo", channelSerialNo);
		params.put("userNo", truename);
		params.put("accountName", phone);
		String responseMsg = HttpUtils.sendHttpClientPost(url, params);
		
		try {
			JSONObject jsonObject = new JSONObject(responseMsg);
			logger.info("this responseMsg is {}", jsonObject);
			String resultCode = jsonObject.get("resultCode").toString();
			if (!resultCode.equals(Global.SUCCESS)) {
				logger.error("开户失败,错误信息{}", jsonObject);
				throw new RuntimeException("开户失败");
			}
			JSONObject accountInfo = jsonObject.getJSONObject("accountInfo");
			String accountNo = accountInfo.getString("accountNo");
			return accountNo;
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
