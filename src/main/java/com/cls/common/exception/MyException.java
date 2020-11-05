package com.cls.common.exception;

/**
 * 系统内部异常
 *
 * @author WeiMaomao
 */
public class MyException extends RuntimeException  {

    private static final long serialVersionUID = -994962710559017255L;

    public MyException(String message) {
        super(message);
    }
}
