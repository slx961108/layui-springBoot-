package com.cls.system.mapper;

import com.cls.system.entity.SysDict;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 字典表 Mapper
 *
 * @author slx
 * @date 2020-11-09 15:11:51
 */
public interface SysDictMapper extends BaseMapper<SysDict> {

    /**
     * 根据code查询字典
     * @param code
     * @return
     */
    @Select("select dict_id,name,value,code,enabled,remark,sort,pid from sys_dict where is_delete=0 and code=#{code}")
    SysDict selectByCode(@Param("code") String code);



    /**
     * 根据父级的code查询子集
     *
     * @param code
     * @return
     */
    @Select("select dict_id,name,value,code,enabled,remark,sort,pid from sys_dict where  pid=(select dict_id from sys_dict where code=#{code} and is_delete=0) and is_delete=0 ORDER BY sort")
    List<SysDict> findByParentCode(@Param("code") String code);
}
