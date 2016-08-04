package com.thinkgem.jeesite.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MobileCodeUtils {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 获取验证码
	 * @return
	 */
	public static String genCheckCode() {
		
		String str = String.valueOf(Math.round(Math.random() * 1000000));
		if (str.length() < 6) {
			return genCheckCode();
		}
		return str;
	}
	


}