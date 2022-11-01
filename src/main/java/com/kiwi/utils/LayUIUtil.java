package com.kiwi.utils;

import java.util.HashMap;
import java.util.List;

public class LayUIUtil extends HashMap<String, Object>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static LayUIUtil data(Integer count,List<?> data){
		
		LayUIUtil laiUI = new LayUIUtil();
		laiUI.put("code", 0);
		laiUI.put("msg", "操作成功");
		laiUI.put("count", count);
		laiUI.put("data", data);
        return laiUI;
    }
}