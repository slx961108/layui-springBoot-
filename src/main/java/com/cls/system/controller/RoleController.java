package com.cls.system.controller;


import com.github.pagehelper.PageInfo;
import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.ResponseVO;
import com.cls.common.entity.QueryRequest;
import com.cls.common.exception.MyException;
import com.cls.system.entity.Role;
import com.cls.system.service.IRoleService;
import com.wuwenze.poi.ExcelKit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @author WeiMaomao
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("role")
public class RoleController extends BaseController {

    private final IRoleService roleService;

    @GetMapping
    public ResponseVO getAllRoles(Role role) {
        return ResponseVO.success(roleService.findRoles(role));
    }

    @GetMapping("list")
    @RequiresPermissions("role:view")
    public ResponseVO roleList(Role role, QueryRequest request) {
        PageInfo<Role> roles = this.roleService.findRoles(role, request);
        return ResponseVO.success(roles);
    }

    @PostMapping
    @RequiresPermissions("role:add")
    @ControllerEndpoint(operation = "新增角色", exceptionMessage = "新增角色失败")
    public ResponseVO addRole(@Valid Role role) {
        this.roleService.createRole(role);
        return ResponseVO.success();
    }

    @GetMapping("delete/{roleIds}")
    @RequiresPermissions("role:delete")
    @ControllerEndpoint(operation = "删除角色", exceptionMessage = "删除角色失败")
    public ResponseVO deleteRoles(@NotBlank(message = "{required}") @PathVariable String roleIds) {
        this.roleService.deleteRoles(roleIds);
        return ResponseVO.success();
    }

    @PostMapping("update")
    @RequiresPermissions("role:update")
    @ControllerEndpoint(operation = "修改角色", exceptionMessage = "修改角色失败")
    public ResponseVO updateRole(Role role) {
        this.roleService.updateRole(role);
        return ResponseVO.success();
    }

    @GetMapping("excel")
    @RequiresPermissions("role:export")
    @ControllerEndpoint(exceptionMessage = "导出Excel失败")
    public void export(QueryRequest queryRequest, Role role, HttpServletResponse response) throws MyException {
        List<Role> roles = this.roleService.findRoles(role, queryRequest).getList();
        ExcelKit.$Export(Role.class, response).downXlsx(roles, false);
    }

}
