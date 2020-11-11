package com.cls.system.service;

import com.cls.common.entity.QueryRequest;
import com.cls.system.entity.Expert;


import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.InputStream;
import java.util.List;

/**
 * 专家表 Service接口
 *
 * @author Carey
 * @date 2020-11-06 10:47:30
 */
public interface IExpertService extends IService<Expert> {

    /**
     * 批量导入
     * @param inputStream
     */
    void uploadExpert(InputStream inputStream);

    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param expert expert
     * @return PageInfo<Expert>
     */
    PageInfo<Expert> findExperts(QueryRequest request, Expert expert);

    /**
     * 查询（所有）
     *
     * @param expert expert
     * @return List<Expert>
     */
    List<Expert> findExperts(Expert expert);

    /**
     * 新增
     *
     * @param expert expert
     */
    void createExpert(Expert expert);

    /**
     * 修改
     *
     * @param expert expert
     */
    void updateExpert(Expert expert);

    /**
     * 删除
     *
     * @param expert expert
     */
    void deleteExpert(Expert expert);

    Expert findById(Long id);

    void deleteExperts(String[] ids);
    void pubishExperts(String[] ids);
    void cancelExperts(String[] ids);
}
