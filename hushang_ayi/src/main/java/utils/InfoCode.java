package utils;

/**
 * @Description: 信息枚举类
 * @Author: kiwi
 */
public enum InfoCode {

    LOGIN_FAIL(100, "用户名或密码错误啦！"),
    SAVE_SUCCESS(0, "保存成功"),
    SAVE_FAIL(150, "保存失败"),
    DELETE_SUCCESS(0, "删除成功"),
    DELETE_FAIL(150, "删除失败"),
    UPDATE_SUCCESS(0, "修改成功"),
    UPDATE_FAIL(150, "修改失败"),
    OPERATION_FAIL(150, "操作失败"),
    PARAMS_ERROR(150, "每一个空都要填哦");

    public final int code;
    public final String msg;

    InfoCode (int code, String msg){
        this.code = code;
        this.msg = msg;
    }
}