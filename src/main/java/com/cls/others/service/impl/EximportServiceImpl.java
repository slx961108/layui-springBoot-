package com.cls.others.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.cls.common.entity.QueryRequest;
import com.cls.common.properties.MyProperties;
import com.cls.others.entity.Eximport;
import com.cls.others.mapper.EximportMapper;
import com.cls.others.service.IEximportService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author WeiMaomao
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class EximportServiceImpl extends ServiceImpl<EximportMapper, Eximport> implements IEximportService {

    private final MyProperties properties;

    @Override
    public PageInfo<Eximport> findEximports(QueryRequest request, Eximport eximport) {
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Eximport> list = this.list(null);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void batchInsert(List<Eximport> list) {
        saveBatch(list, properties.getMaxBatchInsertNum());
    }

}
