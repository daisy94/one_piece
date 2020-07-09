package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.GongZiMapper;
import com.kiwi.hushang_ayi.service.GongZiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.InfoCode;
import utils.JsonResult;
import utils.TypeUtil;

import java.util.List;
import java.util.Map;

@Service
public class GongZiServiceImpl implements GongZiService {
	
	@Autowired
	GongZiMapper gongZiMapper;

	@Override
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

	@Override
	public List<Map<String, Object>> getGongZiByYear(Integer dateYear) {

		List<Map<String, Object>> gongZiByYear = gongZiMapper.getGongZiByYear(dateYear);

		for (Map<String, Object> map : gongZiByYear) {

			String gongZiTime = TypeUtil.toString(map.get("gongzi_time"));
			String year = gongZiTime.substring(0, 4);
			String month = gongZiTime.substring(4, 6);
			map.put("gongzi_time", year + "-" + month);
		}
		return gongZiByYear;
	}

	@Override
	public List<Map<String, Object>> getGongZiByMonthEcharts(Integer date){

		List<Map<String, Object>> gongZiByMonthEcharts = gongZiMapper.getGongZiByMonthEcharts(date);
		return gongZiByMonthEcharts;
	}

	@Override
	public List<Map<String, Object>> getGongZiEchartsByYear(Integer date) {

		List<Map<String, Object>> gongZiEchartsByYear = gongZiMapper.getGongZiEchartsByYear(date);

		for (Map<String, Object> map : gongZiEchartsByYear) {

			String gongZiTime = TypeUtil.toString(map.get("gongzi_time"));
			String year = gongZiTime.substring(0, 4);
			String month = gongZiTime.substring(4, 6);
			map.put("gongzi_time", year + "-" + month);
		}
		return gongZiEchartsByYear;
	}

	@Override
	public JsonResult insertGongZiData(Map<String, Object> map){

		try {
			gongZiMapper.insertGongZiData(map);
		}catch (Exception e){
			return new JsonResult(InfoCode.SAVE_FAIL.code, InfoCode.SAVE_FAIL.msg);
		}
		return new JsonResult(InfoCode.SAVE_SUCCESS.code, InfoCode.SAVE_SUCCESS.msg);
	}

	@Override
	public Map<String, Object> getGZCountByYM(Map<String, Object> map){

		Map<String, Object> gzCountByYM = gongZiMapper.getGZCountByYM(map);
		return gzCountByYM;
	}

	@Override
	public Map<String, Object> getGZCountByYear(Map<String, Object> map) {

		Map<String, Object> gzCountByYear = gongZiMapper.getGZCountByYear(map);
		return gzCountByYear;
	}
}