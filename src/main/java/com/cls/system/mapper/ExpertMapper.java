package com.cls.system.mapper;

import com.cls.system.entity.Expert;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 专家表 Mapper
 *
 * @author Carey
 * @date 2020-11-06 10:47:30
 */
public interface ExpertMapper extends BaseMapper<Expert> {

    List<Expert> findExpertDetail(@Param("expert")Expert expert);
}
