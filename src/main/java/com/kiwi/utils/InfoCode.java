package com.kiwi.utils;

/**
 * 系统信息枚举类
 */
public enum InfoCode {

    SAVE_SUCCESS(0, "保存成功"),
    DELETE_SUCCESS(0, "删除成功"),
    UPDATE_SUCCESS(0, "修改成功"),
    DELIVER_GOODS_SUCCESS(0, "发货成功"),
    DELIVER_GOODS_REVOKE(0, "发货撤销"),
    LOGIN_ERROR(1000, "登录失败"),
    LOGIN_FAIL(1001, "用户名或密码错误啦"),
    SAVE_FAIL(1002, "保存失败"),
    DELETE_FAIL(1003, "删除失败"),
    UPDATE_FAIL(1004, "修改失败"),
    SELECT_FAIL(1005, "查询失败"),
    OPERATION_FAIL(1006, "操作失败"),
    PHOTO_PARAMS_ERROR(1007, "照片名字和照片备注都要填哦"),
    PHOTO_ALBUM_PARAMS_ERROR(1008, "相册的时间是必填的哦"),
    PHOTO_ALBUM_ERROR(1009, "这个月的相册已经存在啦"),
    SYSTEM_FAIL(1010, "操作错误，请联系三十五酱");

    public final int code;
    public final String msg;

    InfoCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}