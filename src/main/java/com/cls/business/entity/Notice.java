package com.cls.business.entity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import com.cls.common.entity.BaseEntity;
import java.io.Serializable;
/**
 * 通知公告 Entity
 *
 * @author weimaomao
 * @date 2020-11-10 09:36:03
 */
@Data
@TableName("biz_notice")
public class Notice extends BaseEntity implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "notice_id", type = IdType.AUTO)
    private Long noticeId;

    /**
     * 类型
     */
    @TableField("type_code")
    private String typeCode;

    /**
     * 内容
     */
    @TableField("content")
    private String content;

    /**
     * 附件
     */
    @TableField("file_id")
    private Long fileId;

    /**
     * 标题
     */
    @TableField("title")
    private String title;

    /**
     * 是否发布
     */
    @TableField(value = "is_publish")
    private Boolean isPublish;

}
