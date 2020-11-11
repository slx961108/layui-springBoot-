package com.cls.business.service;

import com.cls.business.entity.Standard;

import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 评审标准表 Service接口
 *
 * @author wmm
 * @date 2020-11-11 16:25:41
 */
public interface IStandardService extends IService<Standard> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param standard standard
     * @return PageInfo<Standard>
     */
    PageInfo<Standard> findStandards(QueryRequest request, Standard standard);

    /**
     * 查询（所有）
     *
     * @param standard standard
     * @return List<Standard>
     */
    List<Standard> findStandards(Standard standard);

    /**
     * 新增
     *
     * @param standard standard
     */
    void createStandard(Standard standard);

    /**
     * 修改
     *
     * @param standard standard
     */
    void updateStandard(Standard standard);

    /**
     * 删除
     *
     * @param standard standard
     */
    void deleteStandards(String[] ids);
}
