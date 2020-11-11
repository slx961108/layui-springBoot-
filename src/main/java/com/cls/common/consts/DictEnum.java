package com.cls.common.consts;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * 字典表枚举
 *
 * @author
 */
@AllArgsConstructor
@Getter
public enum  DictEnum {

    NOTICE_TYPE("通知类型","notice_type","");

    private final String name;
    private final String code;
    private final String value;

}
