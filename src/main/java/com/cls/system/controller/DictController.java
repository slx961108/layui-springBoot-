package com.cls.system.controller;

import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.*;
import com.cls.common.utils.MyUtil;
import com.cls.system.entity.Menu;
import com.cls.system.entity.SysDict;
import com.cls.system.service.ISysDictService;
import com.github.pagehelper.PageInfo;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * 字典表 Controller
 *
 * @author slx
 * @date 2020-11-09 15:11:51
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class DictController extends BaseController {

    private final ISysDictService sysDictService;

    @GetMapping(MyConstant.VIEW_PREFIX + "system/dict")
    @RequiresPermissions("dict:view")
    public String systemDict() {
        return MyUtil.view("system/dict/dict");
    }

    /*@GetMapping("dict/list")
    @ResponseBody
    @RequiresPermissions("dict:view")
    public ResponseVO sysDictList(QueryRequest request, SysDict sysDict) {
        PageInfo<SysDict> pageInfo =  this.sysDictService.findSysDicts(request, sysDict);
        return ResponseVO.success(pageInfo);
    }*/

    @GetMapping("dict/code/{code}")
    @ResponseBody
    @RequiresPermissions("dict:view")
    public ResponseVO sysDictByCode(@NotBlank(message = "{required}") @PathVariable String code) {
        SysDict pageInfo =  this.sysDictService.findByCode(code);
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增字典", exceptionMessage = "新增字典失败")
    @PostMapping("dict")
    @ResponseBody
    @RequiresPermissions("dict:add")
    public ResponseVO addSysDict(@Valid SysDict sysDict) {
        this.sysDictService.createSysDict(sysDict);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "删除字典", exceptionMessage = "删除字典失败")
    @GetMapping("dict/delete")
    @ResponseBody
    @RequiresPermissions("dict:delete")
    public ResponseVO deleteSysDict(SysDict sysDict) {
        this.sysDictService.deleteSysDict(sysDict);
        return ResponseVO.success();
    }

    @GetMapping("dict/delete/{dictIds}")
    @RequiresPermissions("dict:delete")
    @ResponseBody
    @ControllerEndpoint(operation = "删除字典", exceptionMessage = "删除菜单/按钮失败")
    public ResponseVO deleteMenus(@NotBlank(message = "{required}") @PathVariable String dictIds) {
        this.sysDictService.deleteSysDicts(dictIds);
        return ResponseVO.success();
    }


    @ControllerEndpoint(operation = "修改字典", exceptionMessage = "修改字典失败")
    @PostMapping("dict/update")
    @ResponseBody
    @RequiresPermissions("dict:update")
    public ResponseVO updateSysDict(SysDict sysDict) {
        this.sysDictService.updateSysDict(sysDict);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "导出字典", exceptionMessage = "导出字典失败")
    @PostMapping("dict/excel")
    @ResponseBody
    @RequiresPermissions("dict:export")
    public void export(QueryRequest queryRequest, SysDict sysDict, HttpServletResponse response) {
        List<SysDict> sysDicts = this.sysDictService.findSysDicts(queryRequest, sysDict).getList();
        ExcelKit.$Export(SysDict.class, response).downXlsx(sysDicts, false);
    }


    @GetMapping("dict/tree")
    @ControllerEndpoint(exceptionMessage = "获取菜单树失败")
    @ResponseBody
    public ResponseVO getDictTree(SysDict sysDict) {
        DictTree<SysDict> dicts = this.sysDictService.findDicts(sysDict);
        return ResponseVO.success(dicts.getChilds());
    }

}
