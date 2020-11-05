package com.cls.common.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.cls.common.converter.TimeConverter;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 公共字段
 * @author Administrator
 */
@Data
public class BaseEntity implements Serializable {


    @TableField(fill = FieldFill.INSERT, value = "create_by")
    private Long createBy;


    @TableField(fill = FieldFill.INSERT_UPDATE,value = "modify_by")
    private Long modifyBy;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT, value = "CREATE_TIME")
    @ExcelField(value = "创建时间", writeConverter = TimeConverter.class)
    private Date createTime;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE,value = "MODIFY_TIME")
    @ExcelField(value = "修改时间", writeConverter = TimeConverter.class)
    private Date modifyTime;


    /**
     * 加@TableLogic的情况下,程序内部会将delete语句变为update语句  查询也会带入is_delete=0但是自己写的xml不会
     * 实际上我们写的代码并不需要做出什么改变
     */
    @TableLogic
    @TableField(fill = FieldFill.INSERT, value = "is_delete")
    private Boolean isDelete;


}
