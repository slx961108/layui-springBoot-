package com.cls.common.entity;

/**
 * @author Administrator
 */

public enum YesOrNoType {


    YES("YES","1"),
    NO("NO","0");

    private String key;
    private String value;

    private YesOrNoType(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
