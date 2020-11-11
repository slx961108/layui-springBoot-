package com.cls.business.service.impl;

import com.cls.business.entity.TopicSubject;
import com.cls.business.mapper.TopicSubjectMapper;
import com.cls.business.service.ITopicSubjectService;
import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

/**
 *  Service实现
 *
 * @author wandering
 * @date 2020-11-10 09:31:16
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TopicSubjectServiceImpl extends ServiceImpl<TopicSubjectMapper, TopicSubject> implements ITopicSubjectService {

    private final TopicSubjectMapper topicSubjectMapper;

    @Override
    public PageInfo<TopicSubject> findTopicSubjects(QueryRequest request, TopicSubject topicSubject) {
        LambdaQueryWrapper<TopicSubject> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<TopicSubject> list= this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<TopicSubject> findTopicSubjects(TopicSubject topicSubject) {
	    LambdaQueryWrapper<TopicSubject> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createTopicSubject(TopicSubject topicSubject) {
        this.save(topicSubject);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateTopicSubject(TopicSubject topicSubject) {
        this.saveOrUpdate(topicSubject);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteTopicSubject(TopicSubject topicSubject) {
        LambdaQueryWrapper<TopicSubject> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}
}
