package com.cls.system.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.cls.common.entity.DictTree;
import com.cls.common.entity.MenuTree;
import com.cls.common.entity.QueryRequest;
import com.cls.common.utils.TreeUtil;
import com.cls.system.entity.Menu;
import com.cls.system.entity.SysDict;
import com.cls.system.mapper.SysDictMapper;
import com.cls.system.service.ISysDictService;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 字典表 Service实现
 *
 * @author slx
 * @date 2020-11-09 15:11:51
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict> implements ISysDictService {

    private final SysDictMapper sysDictMapper;

    @Override
    public PageInfo<SysDict> findSysDicts(QueryRequest request, SysDict sysDict) {
        LambdaQueryWrapper<SysDict> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<SysDict> list = this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<SysDict> findSysDicts(SysDict sysDict) {
        LambdaQueryWrapper<SysDict> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createSysDict(SysDict sysDict) {
        this.save(sysDict);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSysDict(SysDict sysDict) {
        this.saveOrUpdate(sysDict);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSysDict(SysDict sysDict) {
        LambdaQueryWrapper<SysDict> wrapper = new LambdaQueryWrapper<>();
        // TODO 设置删除条件
        this.remove(wrapper);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSysDicts(String dictIds) {
        String[] dictIdsArray = dictIds.split(StringPool.COMMA);
        this.delete(Arrays.asList(dictIdsArray));

    }


    private void delete(List<String> dictIds) {
        List<String> list = new ArrayList<>(dictIds);
        removeByIds(dictIds);

        LambdaQueryWrapper<SysDict> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(SysDict::getPid, dictIds);
        List<SysDict> menus = baseMapper.selectList(queryWrapper);
        if (CollectionUtils.isNotEmpty(menus)) {
            List<String> menuIdList = new ArrayList<>();
            menus.forEach(m -> menuIdList.add(String.valueOf(m.getDictId())));
            list.addAll(menuIdList);

            this.delete(menuIdList);
        }
    }


    @Override
    public DictTree<SysDict> findDicts(SysDict sysDict) {
        QueryWrapper<SysDict> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(sysDict.getName())) {
            queryWrapper.lambda().like(SysDict::getName, sysDict.getName());
        }
        queryWrapper.lambda().orderByAsc(SysDict::getSort);
        List<SysDict> sysDicts = this.baseMapper.selectList(queryWrapper);
        List<DictTree<SysDict>> trees = this.convertDicts(sysDicts);

        return TreeUtil.buildDictTree(trees);
    }

    /**
     * 根据code查询字典
     *
     * @param code
     * @return
     */
    @Override
    public SysDict findByCode(String code) {
        SysDict sysDict = this.baseMapper.selectByCode(code);
        return sysDict;
    }


    /**
     * 根据父级的code查询子集
     *
     * @param code
     * @return
     */
    @Override
    public List<SysDict> findByParentCode(String code) {
        List<SysDict> list = this.baseMapper.findByParentCode(code);
        return list;
    }

    private List<DictTree<SysDict>> convertDicts(List<SysDict> menus) {
        List<DictTree<SysDict>> trees = new ArrayList<>();
        menus.forEach(menu -> {
            DictTree<SysDict> tree = new DictTree<>();
            tree.setId(String.valueOf(menu.getDictId()));
            tree.setParentId(String.valueOf(menu.getPid()));
            tree.setTitle(menu.getName());
            tree.setData(menu);
            trees.add(tree);
        });
        return trees;
    }

}
