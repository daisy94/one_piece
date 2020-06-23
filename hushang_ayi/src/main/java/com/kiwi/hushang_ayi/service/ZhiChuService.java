package com.kiwi.hushang_ayi.service;

import com.kiwi.hushang_ayi.mapper.ZhiChuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.TypeUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ZhiChuService {
	
	@Autowired
	private ZhiChuMapper zhiChuMapper;
	
	public List<Map<String, Object>> getZhiChuByMonth(Integer dateYM){
		
		List<Map<String, Object>> zhiChuByMonth = zhiChuMapper.getZhiChuByMonth(dateYM);
		
		for (Map<String, Object> map : zhiChuByMonth) {
			
			String zhichuTime = TypeUtil.toString(map.get("zhichu_time"));
			String year = zhichuTime.substring(0, 4);
			String month = zhichuTime.substring(4, 6);
			String day = zhichuTime.substring(6, 8);
			map.put("zhichu_time", year + "-" + month + "-" + day);
		}
		
		return zhiChuByMonth;
	}

	public List<Map<String, Object>> getZhiChuByMonthDay(Integer dateYMD){
		
		List<Map<String,Object>> zhiChuByMonthDay = zhiChuMapper.getZhiChuByMonthDay(dateYMD);
		
		for (Map<String, Object> map : zhiChuByMonthDay) {
			
			String zhichuTime = TypeUtil.toString(map.get("zhichu_time"));
			String year = zhichuTime.substring(0, 4);
			String month = zhichuTime.substring(4, 6);
			String day = zhichuTime.substring(6, 8);
			map.put("zhichu_time", year + "-" + month + "-" + day);
		}
		
		return zhiChuByMonthDay;
	}

	public List<Map<String, Object>> getZhiChuByMonthEcharts(Integer date){

		List<Map<String, Object>> zhiChuByMonthEcharts = zhiChuMapper.getZhiChuByMonthEcharts(date);

		for (Map<String, Object> map : zhiChuByMonthEcharts) {

			String zhichuTime = TypeUtil.toString(map.get("zhichu_time"));
			String year = zhichuTime.substring(0, 4);
			String month = zhichuTime.substring(4, 6);
			String day = zhichuTime.substring(6, 8);
			map.put("zhichu_time", year + "-" + month + "-" + day);
		}

		return zhiChuByMonthEcharts;
	}

	public Map<String, Object> insertZhiChuData(Map<String, Object> map){
		
		zhiChuMapper.insertZhiChuData(map);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("status", "success");
		return result;
	}

	public Map<String, Object> getZCCountByYM(Map<String, Object> map){

		Map<String, Object> zcCountByYM = zhiChuMapper.getZCCountByYM(map);
		return zcCountByYM;
	}
}