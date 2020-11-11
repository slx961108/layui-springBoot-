package com.cls.business.entity;

import java.math.BigDecimal;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import java.io.Serializable;
/**
 * 申报课题表 Entity
 *
 * @author weimaomao
 * @date 2020-11-10 11:09:57
 */
@Data
@TableName("biz_declare_topic")
public class DeclareTopic extends BaseEntity implements Serializable {



    /**
     * 
     */
    @TableId(value = "declare_id", type = IdType.AUTO)
    private Long declareId;



    /**
     * 申报课题名称
     */
    @TableField("topic_name")
    private String topicName;


    /**
     * 课题id
     */
    @TableField("topic_id")
    private Long topicId;



    /**
     * 
     */
    @TableField("status_type_id")
    private String statusTypeId;


    /**
     * 总分
     */
    @TableField("score")
    private BigDecimal score;


    /**
     * 申报方式
     */
    @TableField("declare_type_id")
    private Long declareTypeId;



    /**
     * 申请人id
     */
    @TableField("applicant_id")
    private Long applicantId;



    /**
     * 课题编号
     */
    @TableField("topic_code")
    private String topicCode;


    /**
     * 学科分类
     */
    @TableField("subject_type_id")
    private Long subjectTypeId;



    /**
     * 校验后学科
     */
    @TableField("check_subject_type_id")
    private Long checkSubjectTypeId;



    /**
     * 主要观点
     */
    @TableField("main_point")
    private String mainPoint;


    /**
     * 成果形式
     */
    @TableField("achievement_form_type_id")
    private Long achievementFormTypeId;



    /**
     * 成果字数
     */
    @TableField("achievement_form_size")
    private BigDecimal achievementFormSize;


    /**
     * 研究类型
     */
    @TableField("research_type_id")
    private Long researchTypeId;



    /**
     * 研究内容
     */
    @TableField("research_content")
    private String researchContent;





}
