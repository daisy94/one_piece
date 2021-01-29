package utils;

/**
 * @Description: 信息枚举类
 * @Author: kiwi
 */
public enum InfoCode {

    LOGIN_FAIL(100, "用户名或密码错误啦！"),
    SAVE_SUCCESS(0, "保存成功"),
    SAVE_FAIL(110, "保存失败"),
    DELETE_SUCCESS(0, "删除成功"),
    DELETE_FAIL(120, "删除失败"),
    UPDATE_SUCCESS(0, "修改成功"),
    UPDATE_FAIL(130, "修改失败"),
    OPERATION_FAIL(140, "操作失败"),
    PARAMS_ERROR(150, "每一个空都要填哦"),
    PHOTO_PARAMS_ERROR(160, "照片名字和照片备注都要填哦"),
    PHOTO_ALBUM_PARAMS_ERROR(170, "相册的时间是必填的哦"),
    DROP_DOWN_LIST_FAIL(180, "获取下拉框列表失败"),
    DELIVER_GOODS_SUCCESS(0, "发货成功"),
    DELIVER_GOODS_FAIL(190, "发货失败");

    public final int code;
    public final String msg;

    InfoCode(int code, String msg){
        this.code = code;
        this.msg = msg;
    }
}