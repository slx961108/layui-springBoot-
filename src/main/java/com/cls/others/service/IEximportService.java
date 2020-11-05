package com.cls.others.service;


import com.github.pagehelper.PageInfo;
import com.cls.common.entity.QueryRequest;
import com.cls.others.entity.Eximport;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author WeiMaomao
 */
public interface IEximportService extends IService<Eximport> {
    /**
     * 查询（分页）
     *
     * @param request  QueryRequest
     * @param eximport eximport
     */
    PageInfo<Eximport> findEximports(QueryRequest request, Eximport eximport);


    /**
     * 批量插入
     *
     * @param list List<Eximport>
     */
    void batchInsert(List<Eximport> list);

}
