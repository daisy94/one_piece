package com.kiwi.utils;

import lombok.Data;

@Data
public class JsonResult {

    private Object data;
    private Integer code;
    private String msg;
    private Integer count;

    public JsonResult() {
        this.code = 0;
        this.msg = "ok";
    }

    public JsonResult(String msg) {
        this.code = 0;
        this.msg = msg;
    }

    public JsonResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public JsonResult(Object data) {
        this.data = data;
        this.code = 0;
        this.msg = "ok";
    }

    /**
     * 有数据返回，状态码为 0，LayUI专用
     */
    public JsonResult(Object data, Integer count) {
        this.code = 0;
        this.msg = "ok";
        this.data = data;
        this.count = count;
    }

    public static JsonResult success() {
        return new JsonResult();
    }

    public static JsonResult success(String msg) {
        return new JsonResult(msg);
    }

    public static JsonResult success(Object data) {
        return new JsonResult(data);
    }

    public static JsonResult layUITable(Object data, Integer count) {
        return new JsonResult(data, count);
    }

    public static JsonResult fail(InfoCode infoCode) {
        return new JsonResult(infoCode.code, infoCode.msg);
    }

    public static JsonResult fail(String msg) {
        return new JsonResult(1000, msg);
    }

}