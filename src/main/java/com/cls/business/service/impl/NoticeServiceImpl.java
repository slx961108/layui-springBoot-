package com.cls.business.service.impl;


import com.cls.business.entity.Notice;
import com.cls.business.mapper.NoticeMapper;
import com.cls.business.service.INoticeService;
import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.List;

/**
 * 通知公告 Service实现
 *
 * @author weimaomao
 * @date 2020-11-10 09:36:03
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {

    @Override
    public PageInfo<Notice> findNotices(QueryRequest request, Notice notice) {
        LambdaQueryWrapper<Notice> queryWrapper = new LambdaQueryWrapper<>();
        if(StringUtils.isNotEmpty(notice.getTitle())){
            queryWrapper.like(Notice::getTitle,notice.getTitle());
        }
        if(StringUtils.isNotEmpty(notice.getTypeCode())){
            queryWrapper.eq(Notice::getTypeCode,notice.getTypeCode());
        }
        // TODO 设置查询条件
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Notice> list= this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<Notice> findNotices(Notice notice) {
	    LambdaQueryWrapper<Notice> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createNotice(Notice notice) {
        this.save(notice);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateNotice(Notice notice) {
        this.saveOrUpdate(notice);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteNotice(Notice notice) {
        LambdaQueryWrapper<Notice> wrapper = new LambdaQueryWrapper<>();
	    // TODO 设置删除条件
	    this.remove(wrapper);
	}
}
