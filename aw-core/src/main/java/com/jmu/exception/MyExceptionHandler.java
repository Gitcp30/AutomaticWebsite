package com.jmu.exception;


import com.google.common.collect.Maps;
import com.jmu.common.AjaxResponse;
import com.jmu.util.ResponseJsonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletResponse;
import java.util.Map;

/**
 * Created by zzr on 2017/3/21.
 */
@ControllerAdvice
public class MyExceptionHandler {

    /**
     * 验证注解@Valid抛出的异常
     *
     * @param request
     * @param e
     * @return
     */
    @ExceptionHandler(value = BindException.class)
    public Object bindException(NativeWebRequest request,
                                ServletResponse response, BindException e) {
        if (ResponseJsonUtils.isJsonAccept(request)) {
            AjaxResponse res = AjaxResponse.fail("输入信息不符合条件");
            if (e.hasFieldErrors()) {
                String message = "";
                /*
				 * Sets.newHashSet(Lists.transform(e.getFieldErrors(), new
				 * Function<FieldError, Map<String, String>>() {
				 *
				 * @Override public Map<String, String> apply(FieldError error)
				 * { Map<String, String> map = Maps.newHashMap();
				 * map.put("field", error.getField()); map.put("message",
				 * error.getDefaultMessage()); return map; } }));
				 */
                for (FieldError error : e.getFieldErrors()) {
                    String defaultmessage = error.getDefaultMessage();
                    if (!StringUtils.isEmpty(defaultmessage)) {
                        Map<String, String> map = Maps.newHashMap();
                        map.put("field", error.getField());
                        map.put("message", error.getDefaultMessage());
                        res.getData().add(map);
                        message += error.getDefaultMessage() + "<br/>";
                    }
                }
                res.setMessage(message);
            }

            ResponseJsonUtils.writeJSON(response, res);
            return null;
        }
        ExceptionResponse exceptionResponse = ExceptionResponse.from(e);
        ModelAndView mv = new ModelAndView();
        mv.addObject("error", exceptionResponse);
        mv.setViewName("error/exception");
        return mv;
    }


}
