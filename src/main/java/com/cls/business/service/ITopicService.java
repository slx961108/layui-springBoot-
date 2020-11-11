package com.cls.business.service;

import com.cls.business.entity.Topic;

import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 课题 Service接口
 *
 * @author weimaomao
 * @date 2020-11-10 09:57:54
 */
public interface ITopicService extends IService<Topic> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param topic topic
     * @return PageInfo<Topic>
     */
    PageInfo<Topic> findTopics(QueryRequest request, Topic topic);

    /**
     * 查询（所有）
     *
     * @param topic topic
     * @return List<Topic>
     */
    List<Topic> findTopics(Topic topic);

    /**
     * 新增
     *
     * @param topic topic
     */
    void createTopic(Topic topic);

    /**
     * 修改
     *
     * @param topic topic
     */
    void updateTopic(Topic topic);

    /**
     * 删除
     *
     * @param topic topic
     */
    void deleteTopic(Topic topic);
}
