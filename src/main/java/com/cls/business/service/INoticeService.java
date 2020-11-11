package com.cls.business.service;

import com.cls.business.entity.Notice;


import com.cls.common.entity.QueryRequest;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 通知公告 Service接口
 *
 * @author weimaomao
 * @date 2020-11-10 09:36:03
 */
public interface INoticeService extends IService<Notice> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param notice notice
     * @return PageInfo<Notice>
     */
    PageInfo<Notice> findNotices(QueryRequest request, Notice notice);

    /**
     * 查询（所有）
     *
     * @param notice notice
     * @return List<Notice>
     */
    List<Notice> findNotices(Notice notice);

    /**
     * 新增
     *
     * @param notice notice
     */
    void createNotice(Notice notice);

    /**
     * 修改
     *
     * @param notice notice
     */
    void updateNotice(Notice notice);

    /**
     * 删除
     *
     * @param notice notice
     */
    void deleteNotice(Notice notice);
}
