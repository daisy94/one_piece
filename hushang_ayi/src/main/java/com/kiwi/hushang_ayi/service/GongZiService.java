package com.kiwi.hushang_ayi.service;

import com.kiwi.hushang_ayi.mapper.GongZiMapper;
import com.kiwi.hushang_ayi.mapper.ZhiChuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.JsonResult;
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

	public JsonResult insertGongZiData(Map<String, Object> map){

		return gongZiMapper.insertGongZiData(map);
	}

	public Map<String, Object> getGZCountByYM(Map<String, Object> map){

		Map<String, Object> gzCountByYM = gongZiMapper.getGZCountByYM(map);
		return gzCountByYM;
	}
}