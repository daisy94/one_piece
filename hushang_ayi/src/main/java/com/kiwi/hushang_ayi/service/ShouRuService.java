package com.kiwi.hushang_ayi.service;

import com.kiwi.hushang_ayi.mapper.ShouRuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.TypeUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShouRuService {

    @Autowired
    private ShouRuMapper shouRuMapper;

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

    public List<Map<String, Object>> getShouRuByMonthDay(Integer dateYMD){

        List<Map<String,Object>> shouRuByMonthDay = shouRuMapper.getShouRuByMonthDay(dateYMD);

        for (Map<String, Object> map :shouRuByMonthDay) {

            String shouruTime = TypeUtil.toString(map.get("shouru_time"));
            String year = shouruTime.substring(0, 4);
            String month = shouruTime.substring(4, 6);
            String day = shouruTime.substring(6, 8);
            map.put("shouru_time", year + "-" + month + "-" + day);
        }

        return shouRuByMonthDay;
    }

    public Map<String, Object> insertShouRuData(Map<String, Object> map){

        shouRuMapper.insertShouRuData(map);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("status", "success");
        return result;
    }

    public Map<String, Object> getSRCountByYM(Map<String, Object> map){

        Map<String, Object> srCountByYM = shouRuMapper.getSRCountByYM(map);
        return srCountByYM;
    }
}
