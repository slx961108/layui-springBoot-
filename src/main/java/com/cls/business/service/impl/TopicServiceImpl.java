package com.cls.business.service.impl;

import com.cls.common.entity.QueryRequest;
import com.cls.business.entity.Topic;
import com.cls.business.mapper.TopicMapper;
import com.cls.business.service.ITopicService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

/**
 * 课题 Service实现
 *
 * @author weimaomao
 * @date 2020-11-10 09:57:54
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TopicServiceImpl extends ServiceImpl<TopicMapper, Topic> implements ITopicService {

    @Override
    public PageInfo<Topic> findTopics(QueryRequest request, Topic topic) {
        LambdaQueryWrapper<Topic> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Topic> list= this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<Topic> findTopics(Topic topic) {
	    LambdaQueryWrapper<Topic> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createTopic(Topic topic) {
        this.save(topic);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateTopic(Topic topic) {
        this.saveOrUpdate(topic);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteTopic(Topic topic) {
        LambdaQueryWrapper<Topic> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}
}
