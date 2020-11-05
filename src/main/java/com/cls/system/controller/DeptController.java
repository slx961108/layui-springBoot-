package com.cls.system.controller;


import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.entity.DeptTree;
import com.cls.common.entity.ResponseVO;
import com.cls.common.entity.QueryRequest;
import com.cls.common.exception.MyException;
import com.cls.system.entity.Dept;
import com.cls.system.service.IDeptService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
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
@RequestMapping("dept")
public class DeptController {

    private final IDeptService deptService;

    @GetMapping("select/tree")
    @ControllerEndpoint(exceptionMessage = "获取部门树失败")
    public List<DeptTree<Dept>> getDeptTree() throws MyException {
        return this.deptService.findDepts();
    }

    @GetMapping("tree")
    @ControllerEndpoint(exceptionMessage = "获取部门树失败")
    public ResponseVO getDeptTree(Dept dept) throws MyException {
        List<DeptTree<Dept>> depts = this.deptService.findDepts(dept);
        return ResponseVO.success(depts);
    }

    @PostMapping
    @RequiresPermissions("dept:add")
    @ControllerEndpoint(operation = "新增部门", exceptionMessage = "新增部门失败")
    public ResponseVO addDept(@Valid Dept dept) {
        this.deptService.createDept(dept);
        return ResponseVO.success();
    }

    @GetMapping("delete/{deptIds}")
    @RequiresPermissions("dept:delete")
    @ControllerEndpoint(operation = "删除部门", exceptionMessage = "删除部门失败")
    public ResponseVO deleteDepts(@NotBlank(message = "{required}") @PathVariable String deptIds) throws MyException {
        String[] ids = deptIds.split(StringPool.COMMA);
        this.deptService.deleteDepts(ids);
        return ResponseVO.success();
    }

    @PostMapping("update")
    @RequiresPermissions("dept:update")
    @ControllerEndpoint(operation = "修改部门", exceptionMessage = "修改部门失败")
    public ResponseVO updateDept(@Valid Dept dept) throws MyException {
        this.deptService.updateDept(dept);
        return ResponseVO.success();
    }

    @GetMapping("excel")
    @RequiresPermissions("dept:export")
    @ControllerEndpoint(exceptionMessage = "导出Excel失败")
    public void export(Dept dept, QueryRequest request, HttpServletResponse response) throws MyException {
        List<Dept> depts = this.deptService.findDepts(dept, request);
        ExcelKit.$Export(Dept.class, response).downXlsx(depts, false);
    }
}
