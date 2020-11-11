package com.cls.business.service.impl;

import com.cls.common.entity.QueryRequest;
import com.cls.business.entity.DeclareTopic;
import com.cls.business.mapper.DeclareTopicMapper;
import com.cls.business.service.IDeclareTopicService;
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
 * 申报课题表 Service实现
 *
 * @author weimaomao
 * @date 2020-11-10 11:09:57
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class DeclareTopicServiceImpl extends ServiceImpl<DeclareTopicMapper, DeclareTopic> implements IDeclareTopicService {

    @Override
    public PageInfo<DeclareTopic> findDeclareTopics(QueryRequest request, DeclareTopic declareTopic) {
        LambdaQueryWrapper<DeclareTopic> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<DeclareTopic> list= this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<DeclareTopic> findDeclareTopics(DeclareTopic declareTopic) {
	    LambdaQueryWrapper<DeclareTopic> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createDeclareTopic(DeclareTopic declareTopic) {
        this.save(declareTopic);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDeclareTopic(DeclareTopic declareTopic) {
        this.saveOrUpdate(declareTopic);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDeclareTopic(DeclareTopic declareTopic) {
        LambdaQueryWrapper<DeclareTopic> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}
}
