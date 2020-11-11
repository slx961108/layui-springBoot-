package com.cls.business.service.impl;

import com.cls.common.entity.QueryRequest;
import com.cls.business.entity.Standard;
import com.cls.business.mapper.StandardMapper;
import com.cls.business.service.IStandardService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import lombok.RequiredArgsConstructor;
import com.github.pagehelper.PageHelper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.Arrays;
import java.util.List;

/**
 * 评审标准表 Service实现
 *
 * @author wmm
 * @date 2020-11-11 16:25:41
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class StandardServiceImpl extends ServiceImpl<StandardMapper, Standard> implements IStandardService {

    @Override
    public PageInfo<Standard> findStandards(QueryRequest request, Standard standard) {
        LambdaQueryWrapper<Standard> queryWrapper = new LambdaQueryWrapper<>();
        // TODO 设置查询条件
        PageHelper.startPage(request.getPageNum(), request.getPageSize());
        List<Standard> list= this.list(queryWrapper);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public List<Standard> findStandards(Standard standard) {
	    LambdaQueryWrapper<Standard> queryWrapper = new LambdaQueryWrapper<>();
		// TODO 设置查询条件
		return this.baseMapper.selectList(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createStandard(Standard standard) {
        this.save(standard);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateStandard(Standard standard) {
        this.saveOrUpdate(standard);
    }


    /**
    * 删除
    * @param ids
    */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteStandards(String[] ids) {
        List< String > list = Arrays.asList(ids);
        this.removeByIds(list);
     }

}
