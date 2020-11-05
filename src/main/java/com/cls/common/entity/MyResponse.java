package com.cls.common.entity;

import org.springframework.http.HttpStatus;

import java.util.HashMap;

/**
 * @author WeiMaoMao
 */
public class MyResponse extends HashMap<String, Object> {

    private static final long serialVersionUID = -8713837118340960775L;

    public MyResponse code(HttpStatus status) {
        this.put("code", status.value());
        return this;
    }

    public MyResponse message(String message) {
        this.put("message", message);
        return this;
    }

    public MyResponse data(Object data) {
        this.put("data", data);
        return this;
    }

    public MyResponse success() {
        this.code(HttpStatus.OK);
        return this;
    }

    public MyResponse fail() {
        this.code(HttpStatus.INTERNAL_SERVER_ERROR);
        return this;
    }

    @Override
    public MyResponse put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
