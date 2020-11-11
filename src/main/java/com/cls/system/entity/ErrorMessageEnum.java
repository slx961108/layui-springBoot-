package com.cls.system.entity;

/**
 * @ClassName: BooleanEnum
 * @author: weimaomao
 * @create: 2020-03-20 21:55
 * @description
 **/
public enum ErrorMessageEnum {
    /**
     * 不能为空
     */
    NULL_MESSAGE("%s,不能为空！"),

    /**
     *
     */
    ILLEGAL_MESSAGE("%s,不合法！"),

    /**
     * 无此数据
     */
    NO_DATA(" %s不存在: %s是%s！"),

    UPLOAD_MESSAGE("%s上传失败！"),

    EXISTED_DATA(" %s数据已经存在！"),

    PERSON_NOT_UNIT("当前身份证号码人员不是本单位人员，请先进行人员调动!"),

    /**
     * 格式不正确
     */
    MALFORMED_MESSAGE("%s,格式不正确！"),

    /**
     * 格式不正确
     */
    NO_PERMISSION("%s,此数据您无权限！"),
    MAX_VALUE("此数据超过最大限度，最大限度为%s！"),

    PASSWORD_NO_SAME("两次密码输入不一致！！"),

    IMPORT_EXCEL_ROW_INVALID_STR("导入的EXCEL中数据行无效！"),
    IMPORT_EXCEL_COLUMN_INVALID_STR("导入的EXCEL中数据列无效！"),
    IMPORT_EXCEL_FORMAT_INVALID_STR("导入的EXCEL格式无效！"),
    IMPORT_EXCEL_FILE_INVALID_STR("导入的文件无效！"),
    IMPORT_EXCEL_DATA_INVALID_STR("导入的EXCEL数据无效！"),
    IMPORT_EXCEL_CONTENT_INVALID_STR("导入的EXCEL试题内容无效！"),
    IMPORT_EXCEL_NO_FILE_SELECTED_STR("未选择导入的EXCEL文件！"),

    COOKIE_INVALID("会话过期");


    private String value;

    ErrorMessageEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
