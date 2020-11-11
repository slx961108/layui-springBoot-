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
 *  Entity
 *
 * @author wandering
 * @date 2020-11-10 09:31:16
 */
@Data
@TableName("biz_topic_subject")
public class TopicSubject extends BaseEntity implements Serializable {



    /**
     * 
     */
    @TableId(value = "topic_subject_id", type = IdType.AUTO)
    private Long topicSubjectId;



    /**
     * 
     */
    @TableField("topic_id")
    private Long topicId;



    /**
     * 
     */
    @TableField("subject_type_id")
    private String subjectTypeId;


    /**
     * 
     */
    @TableField("num")
    private Integer num;






}
