package com.cls.others.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.cls.common.entity.QueryRequest;
import com.cls.others.entity.DataPermissionTest;
import com.cls.others.mapper.DataPermissionTestMapper;
import com.cls.others.service.IDataPermissionTestService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author WeiMaomao
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class DataPermissionTestServiceImpl extends ServiceImpl<DataPermissionTestMapper, DataPermissionTest> implements IDataPermissionTestService {

    @Override
    public PageInfo<DataPermissionTest> findDataPermissionTests(QueryRequest request, DataPermissionTest dataPermissionTest) {
        LambdaQueryWrapper<DataPermissionTest> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByAsc(DataPermissionTest::getCreateTime);
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<DataPermissionTest> list = this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;

    }
}
