package com.poseidon.util;

//Controller Service Repository 
//Component = 객체
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
public class Util {
	// 문자열이 들어오면 숫자로 변경하기
	// "156" -> 156 "156번" -> 156
	public int strToInt(String str) {

	
        int result = 0;
		try {

			result = Integer.parseInt(str);
		} catch (Exception e) {
			
			
			StringBuilder sb = new StringBuilder();
			
			for (int i = 0; i < str.length(); i++) {

				if (Character.isDigit(str.charAt(i))) {
					//str2 += str.charAt(i);
					sb.append(str.charAt(i));
				}
			}
			result = Integer.parseInt(sb.toString());//숫자로 만들어서
		}
		
		return result;

	}


	public String exchange(String str) {

		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");

		return str;

	}

	public String getIp() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String ip = null;

		ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}
}
