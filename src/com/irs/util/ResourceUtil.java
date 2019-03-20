package com.irs.util;

import java.util.ResourceBundle;

public  class ResourceUtil {

	public ResourceUtil() {
		// TODO Auto-generated constructor stub
	}
	
	public  static String  getValueByProNameAndKey(String proName,String keyName){
		String value="";
		try {
			ResourceBundle resource = ResourceBundle.getBundle(proName);
			 value = resource.getString(keyName);//获取配置文件中保存图片的路径
		} catch (Exception e) {
			return value;
		}
		return value;
	}

}
