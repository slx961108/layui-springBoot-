package com.cls.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * 专家表 Entity
 *
 * @author Carey
 * @date 2020-11-06 10:47:30
 */
@Data
@TableName("biz_expert")
public class Expert extends BaseEntity implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;


    /**
     * 主键ID
     */
    @TableId(value = "expert_id", type = IdType.AUTO)
    private Long expertId;



    /**
     * 姓名
     */
    @TableField("name")
    private String name;


    /**
     * 工作单位
     */
    @TableField("company")
    private String company;


    /**
     * 行政职务
     */
    @TableField("position_type_code")
    private String positionTypeCode;



    /**
     * 职称
     */
    @TableField("title_type_code")
    private String titleTypeCode;



    /**
     * 学位
     */
    @TableField("degree_type_code")
    private String degreeTypeCode;



    /**
     * 身份证号
     */
    @TableField("identity_id")
    private String identityId;


    /**
     * 学科分类
     */
    @TableField("subject_type_code")
    private String subjectTypeCode;



    /**
     * 理论与实务专家
     */
    @TableField("feature_type_code")
    private String featureTypeCode;



    /**
     * 京内与京外专家
     */
    @TableField("district_type_code")
    private String districtTypeCode;



    /**
     * 是否发布
     */
    @TableField("is_publish")
    private Boolean isPublish;

    /**
     * 是否发布name
     */
    @TableField(exist = false)
    private String isPublishName;

    /**
     * 银行帐号
     */
    @TableField("account_id")
    private String accountId;


    /**
     * 银行帐号开户行
     */
    @TableField("bank_name")
    private String bankName;


    /**
     * 联系方式
     */
    @TableField("phone")
    private String phone;


    /**
     * 地址
     */
    @TableField("address")
    private String address;


    /**
     * 电子邮件
     */
    @TableField("email")
    private String email;


    /**
     * 剩余工作量
     */
    @TableField(exist = false)
    private Integer workload;

    /**
     * 专家来源是否存在已分配库中
     */
    @TableField(exist = false)
    private boolean usedAssign;
}
