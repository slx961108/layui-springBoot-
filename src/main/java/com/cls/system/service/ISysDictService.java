package com.cls.system.service;

import com.cls.common.entity.DictTree;
import com.cls.common.entity.MenuTree;
import com.cls.common.entity.QueryRequest;
import com.cls.system.entity.Menu;
import com.cls.system.entity.SysDict;


import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 字典表 Service接口
 *
 * @author slx
 * @date 2020-11-09 15:11:51
 */
public interface ISysDictService extends IService<SysDict> {
    /**
     * 查询（分页）
     *
     * @param request QueryRequest
     * @param sysDict sysDict
     * @return PageInfo<SysDict>
     */
    PageInfo<SysDict> findSysDicts(QueryRequest request, SysDict sysDict);

    /**
     * 查询（所有）
     *
     * @param sysDict sysDict
     * @return List<SysDict>
     */
    List<SysDict> findSysDicts(SysDict sysDict);

    /**
     * 新增
     *
     * @param sysDict sysDict
     */
    void createSysDict(SysDict sysDict);

    /**
     * 修改
     *
     * @param sysDict sysDict
     */
    void updateSysDict(SysDict sysDict);

    /**
     * 删除
     *
     * @param sysDict sysDict
     */
    void deleteSysDict(SysDict sysDict);

    /**
     * 删除字典
     *
     * @param dictIds 字典id
     */
    void deleteSysDicts(String dictIds);

    /**
     * 查找所有的字典 （树形结构）
     *
     * @param sysDict sysDict
     * @return DictTree<SysDict>
     */
    DictTree<SysDict> findDicts(SysDict sysDict);


    /**
     * 根据code查询字典
     * @param code
     * @return
     */
    SysDict findByCode(String code);


    /**
     * 根据父级的code查询子集
     * @param code
     * @return
     */
    List<SysDict> findByParentCode(String code);
}
