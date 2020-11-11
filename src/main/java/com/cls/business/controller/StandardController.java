package com.cls.business.controller;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.utils.MyUtil;
import com.cls.common.entity.MyConstant;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.QueryRequest;
import com.cls.common.entity.ResponseVO;
import com.github.pagehelper.PageInfo;
import com.cls.business.entity.Standard;
import com.cls.business.service.IStandardService;
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
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * 评审标准表 Controller
 *
 * @author wmm
 * @date 2020-11-11 16:25:41
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class StandardController extends BaseController {

    private final IStandardService standardService;

    /**
    * 评审标准表列表页面
    **/
    @GetMapping(MyConstant.VIEW_PREFIX + "standard")
    public String standardIndex(){
        return MyUtil.view("standard/standard");
    }

    /**
    * 评审标准表新增页面
    * @return
    */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/standard/standardAdd")
    public String standardAdd(Model model){
        return MyUtil.view("business/standard/standardAdd");
    }

    /**
    * 评审标准表修改页面
    * @return
    */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/standard/standardUpdate/{standardId}")
    public String standardUpdate(@PathVariable Long standardId, Model model){
        Standard standard = standardService.getById(standardId);
        model.addAttribute("standard",standard);
        return MyUtil.view("business/standard/standardUpdate");
    }



    /**
    * 通知公告详情页面
    * @return
    */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/standard/standardDetail/{standardId}")
    public String standardDetail(@PathVariable Long standardId, Model model){
        Standard standard = standardService.getById(standardId);
        model.addAttribute("standard",standard);
        return MyUtil.view("business/standard/standardDetail");
    }

    @GetMapping("standard")
    @ResponseBody
    @RequiresPermissions("standard:list")
    public ResponseVO getAllStandards(Standard standard) {
        return ResponseVO.success(standardService.findStandards(standard));
    }

    @GetMapping("standard/list")
    @ResponseBody
    @RequiresPermissions("standard:list")
    public ResponseVO standardList(QueryRequest request, Standard standard) {
        PageInfo<Standard> pageInfo =  this.standardService.findStandards(request, standard);
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增Standard", exceptionMessage = "新增Standard失败")
    @PostMapping("standard")
    @ResponseBody
    @RequiresPermissions("standard:add")
    public ResponseVO addStandard(@Valid Standard standard) {
        this.standardService.createStandard(standard);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "多个删除Standard", exceptionMessage = "删除Standard失败")
    @PostMapping("standard/deletes/{ids}")
    @ResponseBody
    @RequiresPermissions("standard:delete")
    public ResponseVO deleteStandards(@PathVariable String ids) {
        String[] idArry = ids.split(StringPool.COMMA);
        this.standardService.deleteStandards(idArry);
        return ResponseVO.success();
    }


    @ControllerEndpoint(operation = "删除单个Standard", exceptionMessage = "删除Standard失败")
    @PostMapping("standard/delete/{standardId}")
    @ResponseBody
    @RequiresPermissions("standard:delete")
    public ResponseVO deleteStandard(@PathVariable Long standardId) {
        this.standardService.removeById(standardId);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改Standard", exceptionMessage = "修改Standard失败")
    @PostMapping("standard/update")
    @ResponseBody
    @RequiresPermissions("standard:update")
    public ResponseVO updateStandard(Standard standard) {
        this.standardService.updateStandard(standard);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改Standard", exceptionMessage = "导出Excel失败")
    @PostMapping("standard/excel")
    @ResponseBody
    @RequiresPermissions("standard:export")
    public void export(QueryRequest queryRequest, Standard standard, HttpServletResponse response) {
        List<Standard> standards = this.standardService.findStandards(queryRequest, standard).getList();
        ExcelKit.$Export(Standard.class, response).downXlsx(standards, false);
    }
}
