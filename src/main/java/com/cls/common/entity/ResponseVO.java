package com.cls.common.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;

/**
 * @author WeiMaomao
 */
@Data
@AllArgsConstructor
public class ResponseVO {
    private static final long serialVersionUID = -8713837118340960775L;
    public ResponseVO() {
    }

    private int code;
    private String message;
    private Object data;

    public ResponseVO(HttpStatus code, String message, Object data) {
        this.code = code.value();
        this.message = message;
        this.data = data;
    }

    public ResponseVO(HttpStatus code, String message) {
        this.code = code.value();
        this.message = message;
    }

    public static ResponseVO success(Object data){
        ResponseVO vo = new ResponseVO();
        vo.setData(data);
        vo.setMessage("成功");
        vo.setCode(HttpStatus.OK.value());
        return vo;
    }

    public static ResponseVO success(){
        ResponseVO vo = new ResponseVO();
        vo.setMessage("成功");
        vo.setCode(HttpStatus.OK.value());
        return vo;
    }

    public static ResponseVO failure(HttpStatus code ,String message){
        ResponseVO vo = new ResponseVO();
        vo.setCode(code.value());
        vo.setMessage(message);
        return vo;
    }
    public static ResponseVO failure(String message){
        ResponseVO vo = new ResponseVO();
        vo.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
        vo.setMessage(message);
        return vo;
    }
}
