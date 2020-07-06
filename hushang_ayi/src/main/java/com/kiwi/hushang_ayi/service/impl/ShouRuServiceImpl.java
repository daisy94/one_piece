package com.kiwi.hushang_ayi.service.impl;

import com.kiwi.hushang_ayi.mapper.ShouRuMapper;
import com.kiwi.hushang_ayi.service.ShouRuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.JsonResult;
import utils.TypeUtil;

import java.util.List;
import java.util.Map;

@Service
public class ShouRuServiceImpl implements ShouRuService {

    @Autowired
    private ShouRuMapper shouRuMapper;

    @Override
    public List<Map<String, Object>> getShouRuByMonth(Integer dateYM){

        List<Map<String, Object>> shouRuByMonth = shouRuMapper.getShouRuByMonth(dateYM);

        for (Map<String, Object> map : shouRuByMonth) {

            String shouruTime = TypeUtil.toString(map.get("shouru_time"));
            String year = shouruTime.substring(0, 4);
            String month = shouruTime.substring(4, 6);
            String day = shouruTime.substring(6, 8);
            map.put("shouru_time", year + "-" + month + "-" + day);
        }
        return shouRuByMonth;
    }

    @Override
    public List<Map<String, Object>> getShouRuByYear(Integer dateYear){

        List<Map<String, Object>> shouRuByYear = shouRuMapper.getShouRuByYear(dateYear);

        for (Map<String, Object> map : shouRuByYear) {

            String shouruTime = TypeUtil.toString(map.get("shouru_time"));
            String year = shouruTime.substring(0, 4);
            String month = shouruTime.substring(4, 6);
            map.put("shouru_time", year + "-" + month);
        }
        return shouRuByYear;
    }

    @Override
    public JsonResult insertShouRuData(Map<String, Object> map){

        shouRuMapper.insertShouRuData(map);
        return new JsonResult();
    }

    @Override
    public Map<String, Object> getSRCountByYear(Map<String, Object> map){

        Map<String, Object> srCountByYear = shouRuMapper.getSRCountByYear(map);
        return srCountByYear;
    }

    @Override
    public Map<String, Object> getSRCountByYM(Map<String, Object> map){

        Map<String, Object> srCountByYM = shouRuMapper.getSRCountByYM(map);
        return srCountByYM;
    }
}
