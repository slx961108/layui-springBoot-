package com.cls.others.service;

import com.github.pagehelper.PageInfo;
import com.cls.common.entity.QueryRequest;
import com.cls.others.entity.DataPermissionTest;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * @author WeiMaomao
 */
public interface IDataPermissionTestService extends IService<DataPermissionTest> {
    /**
     * 查询（分页）
     *
     * @param request            QueryRequest
     * @param dataPermissionTest dataPermissionTest
     */
    PageInfo<DataPermissionTest> findDataPermissionTests(QueryRequest request, DataPermissionTest dataPermissionTest);
}
