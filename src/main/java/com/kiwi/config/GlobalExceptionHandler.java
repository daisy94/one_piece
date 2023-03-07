package com.kiwi.config;

import com.kiwi.controller.base.BaseController;
import com.kiwi.utils.JsonResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常拦截
 *
 * @author FuJH
 */
@RestControllerAdvice
public class GlobalExceptionHandler extends BaseController {

    @ExceptionHandler
    public JsonResult handlerException(Exception e) {
        log.error("\n==================== 全局异常拦截 ====================", e);
        return JsonResult.fail(e.getMessage());
    }
}
