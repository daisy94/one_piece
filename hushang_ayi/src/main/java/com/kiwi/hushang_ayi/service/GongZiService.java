package com.kiwi.hushang_ayi.service;

import com.kiwi.hushang_ayi.mapper.GongZiMapper;
import com.kiwi.hushang_ayi.mapper.ZhiChuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.TypeUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GongZiService {
	
	@Autowired
	GongZiMapper gongZiMapper;
	
	public List<Map<String, Object>> getGongZiByMonth(Integer dateYM){

		List<Map<String, Object>> gongZiByMonth = gongZiMapper.getGongZiByMonth(dateYM);

		for (Map<String, Object> map : gongZiByMonth) {
			
			String gongZiTime = TypeUtil.toString(map.get("gongzi_time"));
			String year = gongZiTime.substring(0, 4);
			String month = gongZiTime.substring(4, 6);
			map.put("gongzi_time", year + "-" + month);
		}
		return gongZiByMonth;
	}

	/*public List<Map<String, Object>> getZhiChuByMonthDay(Integer dateYMD){
		
		List<Map<String,Object>> zhiChuByMonthDay = zhiChuMapper.getZhiChuByMonthDay(dateYMD);
		
		for (Map<String, Object> map : zhiChuByMonthDay) {
			
			String zhichuTime = TypeUtil.toString(map.get("zhichu_time"));
			String year = zhichuTime.substring(0, 4);
			String month = zhichuTime.substring(4, 6);
			String day = zhichuTime.substring(6, 8);
			map.put("zhichu_time", year + "-" + month + "-" + day);
		}
		
		return zhiChuByMonthDay;
	}*/

	public List<Map<String, Object>> getGongZiByMonthEcharts(Integer date){

		List<Map<String, Object>> gongZiByMonthEcharts = gongZiMapper.getGongZiByMonthEcharts(date);

		for (Map<String, Object> map : gongZiByMonthEcharts) {

			String gongZiTime = TypeUtil.toString(map.get("gongzi_time"));
			String year = gongZiTime.substring(0, 4);
			String month = gongZiTime.substring(4, 6);
			map.put("gongzi_time", year + "-" + month);
		}
		return gongZiByMonthEcharts;
	}

	/*public Map<String, Object> insertZhiChuData(Map<String, Object> map){
		
		zhiChuMapper.insertZhiChuData(map);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		return result;
	}*/

	/*public Map<String, Object> getZCCountByYM(Map<String, Object> map){

		Map<String, Object> zcCountByYM = zhiChuMapper.getZCCountByYM(map);
		return zcCountByYM;
	}*/
}