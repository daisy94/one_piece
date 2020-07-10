package com.kiwi.hushang_ayi.controller;

import com.kiwi.hushang_ayi.service.TongJiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import utils.JsonResult;

import java.util.Map;

@RestController
public class TongJiController {

    @Autowired
    TongJiService tongJiService;

    @RequestMapping(value = "/getTongJiEchartsDataByYear", method = RequestMethod.POST)
    public JsonResult getTongJiEchartsDataByYear(@RequestBody Map<String, Object> params)throws Exception{

        return tongJiService.getTongJiEchartsDataByYear(params);
    }
}
