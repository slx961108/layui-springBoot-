package com.cls.system.entity;

import java.util.Date;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import java.io.Serializable;
/**
 * 字典表 Entity
 *
 * @author slx
 * @date 2020-11-09 15:11:51
 */
@Data
@TableName("sys_dict")
public class SysDict extends BaseEntity implements Serializable {



    /**
     * 
     */
    @TableId(value = "dict_id", type = IdType.AUTO)
    private Long dictId;



    /**
     * 标签名
     */
    @TableField("name")
    private String name;


    /**
     * 数据值
     */
    @TableField("value")
    private String value;


    /**
     * 代码
     */
    @TableField("code")
    private String code;


    /**
     * 是否可用
     */
    @TableField("enabled")
    private Boolean enabled;


    /**
     * 备注
     */
    @TableField("remark")
    private String remark;


    /**
     * 排序（升序）
     */
    @TableField("sort")
    private Integer sort;



    /**
     * 父级编号
     */
    @TableField("pid")
    private String pid;





}
