package com.cls.business.entity;

import java.util.Date;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import java.io.Serializable;
/**
 * 评审标准表 Entity
 *
 * @author wmm
 * @date 2020-11-11 16:25:41
 */
@Data
@TableName("biz_standard")
public class Standard extends BaseEntity implements Serializable {



    /**
     * 
     */
    @TableId(value = "standard_id", type = IdType.AUTO)
    private Long standardId;



    /**
     * 名称
     */
    @TableField("name")
    private String name;





}
