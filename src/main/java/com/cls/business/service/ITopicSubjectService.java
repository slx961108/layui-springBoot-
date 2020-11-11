package com.cls.business.service;

import com.cls.business.entity.TopicSubject;
import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 *  Service接口
 *
 * @author wandering
 * @date 2020-11-10 09:31:16
 */
public interface ITopicSubjectService extends IService<TopicSubject> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param topicSubject topicSubject
     * @return PageInfo<TopicSubject>
     */
    PageInfo<TopicSubject> findTopicSubjects(QueryRequest request, TopicSubject topicSubject);

    /**
     * 查询（所有）
     *
     * @param topicSubject topicSubject
     * @return List<TopicSubject>
     */
    List<TopicSubject> findTopicSubjects(TopicSubject topicSubject);

    /**
     * 新增
     *
     * @param topicSubject topicSubject
     */
    void createTopicSubject(TopicSubject topicSubject);

    /**
     * 修改
     *
     * @param topicSubject topicSubject
     */
    void updateTopicSubject(TopicSubject topicSubject);

    /**
     * 删除
     *
     * @param topicSubject topicSubject
     */
    void deleteTopicSubject(TopicSubject topicSubject);
}
