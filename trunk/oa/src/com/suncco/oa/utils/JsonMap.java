package com.suncco.oa.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 封装转成json的map数据
 * @author jun
 *
 */
public class JsonMap {
   
	/**
	 * 返回页面列表map
	 * @param count
	 * @param list
	 * @return
	 */
	public static Map<String, Object> getJsonMap(int count, List<?> list) {
		Map<String, Object> jsonMap = new  HashMap<String, Object>(2);
		if(list!=null && list.size()>0){
		   jsonMap.put("Total",count);
		   jsonMap.put("Rows", list);
		   return jsonMap;
		}else{
		   return jsonMap;
		}
	}

	/**
	 * 返回保存，删除提示map信息
	 * @param obj返回对象
	 * @param flag 是否有错误信息   false 无   true 有
	 * @param 返回提示信息
	 * @return
	 */
	public static Map<String, Object> getJsonTipMap(Object obj, boolean flag, String message) {
		 Map<String, Object> jsonMap = new  HashMap<String, Object>(3);	
		 jsonMap.put("Data", obj);
		 jsonMap.put("IsError", flag);
		 jsonMap.put("Message", message);
		 return jsonMap;
	}

}
