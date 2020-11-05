package com.cls.system.mapper;

import com.cls.system.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author WeiMaomao
 */
public interface RoleMapper extends BaseMapper<Role> {
    Long countRole(@Param("role") Role role);

    /**
     * 通过用户名查找用户角色
     *
     * @param username 用户名
     * @return 用户角色集合
     */
    List<Role> findUserRole(String username);

    /**
     * 查找角色详情
     *
     * @param role 角色
     */
    List<Role> findRole(@Param("role") Role role);
}
