package com.jmu.common;

import com.google.common.collect.Lists;
import com.jmu.constant.ResponseCode;
import org.apache.ibatis.session.RowBounds;

import java.io.Serializable;
import java.util.List;

/**
 * 有属性success、message、data，该对象只是一个约定的返回到前台的json对象，按该对象设置可基本满足需求，
 * 若不满足需求可自行返回json对象
 * <p>
 * success 表示操作是否成功
 * </p>
 * <p>
 * message 提示的信息
 * </p>
 * <p>
 * data 要返回的数据
 * </p>
 *
 * @author zhouzunrong
 * @since 1.1
 */
public class AjaxResponse extends RowBounds  implements Serializable {
    /**
     * 该请求状态编码
     */
    private String code;
    /**
     * 请求提示信息
     */
    private String message;

    private List data;

    /**
     * 创建一个新的{@link AjaxResponse}，code为0,message为操作成功
     */
    public AjaxResponse() {
        this(ResponseCode.SUCCESS, "操作成功");
    }

    /**
     * 创建一个新的{@link AjaxResponse}
     *
     * @param code
     */
    public AjaxResponse(String code) {
        this(code, null);
    }


    /**
     * 创建一个新的{@link AjaxResponse}
     *
     * @param code
     * @param message
     */
    public AjaxResponse(String code, String message) {
        this.code = (code == null ? "0" : code);
        this.message = message;
        if (this.message == null) {
            if (code.equals(ResponseCode.SUCCESS))
                this.message = "操作成功";
            if (code.equals(ResponseCode.FAIL))
                this.message = "操作失败";
            if (code.equals(ResponseCode.UNAUTHORIZED))
                this.message = "用户验证失败";
        }
        this.data = Lists.newArrayList();
    }

    /**
     * 创建一个新的{@link AjaxResponse}，code为1
     *
     * @return
     */
    public static AjaxResponse fail() {
        return fail(null);
    }

    /**
     * 创建一个新的{@link AjaxResponse}，code为1
     *
     * @param message 消息
     * @return
     */
    public static AjaxResponse fail(String message) {
        return new AjaxResponse(ResponseCode.FAIL, message);
    }

    /**
     * 创建一个新的{@link AjaxResponse}，code为0
     *
     * @return
     */
    public static AjaxResponse success() {
        return success(null);
    }

    /**
     * 创建一个新的{@link AjaxResponse}，code为0
     *
     * @param message 消息
     * @return
     */
    public static AjaxResponse success(String message) {
        return new AjaxResponse(ResponseCode.SUCCESS, message);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}
