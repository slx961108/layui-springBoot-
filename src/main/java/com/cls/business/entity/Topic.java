package com.cls.business.entity;

import java.util.Date;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.cls.common.entity.BaseEntity;
import java.io.Serializable;
import java.util.List;

/**
 * 课题 Entity
 *
 * @author weimaomao
 * @date 2020-11-10 09:57:54
 */
@Data
@TableName("biz_topic")
public class Topic extends BaseEntity implements Serializable {



    /**
     * 
     */
    @TableId(value = "topic_id", type = IdType.AUTO)
    private Long topicId;



    /**
     * 课题编号
     */
    @TableField("topic_code")
    private String topicCode;


    /**
     * 年份
     */
    @TableField("year")
    private Integer year;



    /**
     * 是否发布
     */
    @TableField("is_publish")
    private Boolean isPublish;


    /**
     * 学科分类id
     */
    @TableField("subject_type_id")
    private Long subjectTypeId;



    /**
     * 课题名称
     */
    @TableField("topic_name")
    private String topicName;


    /**
     * 课题收集id
     */
    @TableField("collect_ids")
    private Long collectIds;








    /**
     * 申报数
     */
    @TableField("declare_num")
    private Integer declareNum;



    /**
     * 资格审查通过数
     */
    @TableField("qualified_pass_num")
    private Integer qualifiedPassNum;



    /**
     * 立项数
     */
    @TableField("project_num")
    private Integer projectNum;



    /**
     * 计划id
     */
    @TableField("plan_id")
    private Long planId;



    /**
     * 选题ids
     */
    @TableField("guide_ids")
    private String guideIds;

    @TableField(exist=false)
    List<TopicSubject> topicSubjects;
}
