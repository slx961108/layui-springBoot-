package com.cls.business.service;

import com.cls.business.entity.DeclareTopic;

import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 申报课题表 Service接口
 *
 * @author weimaomao
 * @date 2020-11-10 11:09:57
 */
public interface IDeclareTopicService extends IService<DeclareTopic> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param declareTopic declareTopic
     * @return PageInfo<DeclareTopic>
     */
    PageInfo<DeclareTopic> findDeclareTopics(QueryRequest request, DeclareTopic declareTopic);

    /**
     * 查询（所有）
     *
     * @param declareTopic declareTopic
     * @return List<DeclareTopic>
     */
    List<DeclareTopic> findDeclareTopics(DeclareTopic declareTopic);

    /**
     * 新增
     *
     * @param declareTopic declareTopic
     */
    void createDeclareTopic(DeclareTopic declareTopic);

    /**
     * 修改
     *
     * @param declareTopic declareTopic
     */
    void updateDeclareTopic(DeclareTopic declareTopic);

    /**
     * 删除
     *
     * @param declareTopic declareTopic
     */
    void deleteDeclareTopic(DeclareTopic declareTopic);
}
