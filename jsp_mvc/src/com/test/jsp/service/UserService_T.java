package com.test.jsp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService_T {
	public Map<String, String> getUserInfo(){
		Map<String, String> userInfo = new HashMap<String, String>();
		userInfo.put("name", "박상현");
		userInfo.put("address", "약수");
		return userInfo;
	}
	
	
	public List<Map<String,String>> getUserList()	{
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		for (int i=1; i<3; i++)	{
			Map<String,String> user = new HashMap<String,String>();
			user.put("name", "이름" + i);
			user.put("age", i + "");
			list.add(user);
		}
		return list;
	}
}
