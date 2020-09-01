package utils;

public class JsonResult<T> {

    private T data;
    private int code;
    private String msg;
    private  int count;
    private InfoCode infoCode;

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public InfoCode getNfoCode() {
        return infoCode;
    }

    public void setNfoCode(InfoCode nfoCode) {
        this.infoCode = nfoCode;
    }

    /**
     * 若没有数据返回，默认状态码为 0，提示信息为“操作成功！”
     */
    public JsonResult() {
        this.code = 0;
        this.msg = "操作成功！";
    }

    /**
     * 若没有数据返回，可以人为指定状态码和提示信息
     * @param code
     * @param msg
     */
    public JsonResult(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 有数据返回时，状态码为 0，默认提示信息为“操作成功！”
     * @param data
     */
    public JsonResult(T data) {
        this.data = data;
        this.code = 0;
        this.msg = "操作成功！";
    }

    /**
     * 有数据返回，状态码为 0，人为指定提示信息
     * @param data
     * @param msg
     */
    public JsonResult(T data, String msg) {
        this.data = data;
        this.code = 0;
        this.msg = msg;
    }

    /**
     * 无数据返回，状态码为 0，人为指定提示信息类
     * @param infoCode
     */
    public JsonResult(InfoCode infoCode) {
        this.code = infoCode.code;
        this.msg = infoCode.msg;
    }

    /**
     * 有数据返回，状态码为 0，LayUI专用
     * @param data
     * @param count
     */
    public JsonResult(T data, int count) {
        this.code = 0;
        this.msg = "操作成功！";
        this.data = data;
        this.count = count;
    }
}