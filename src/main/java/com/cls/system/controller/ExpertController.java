package com.cls.system.controller;

import cn.hutool.core.io.IoUtil;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.cls.common.annotation.ControllerEndpoint;


import com.cls.common.consts.DictEnum;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.MyConstant;
import com.cls.common.entity.QueryRequest;
import com.cls.common.entity.ResponseVO;
import com.cls.common.utils.MyUtil;
import com.cls.system.entity.Expert;
import com.cls.system.entity.SysDict;
import com.cls.system.service.IExpertService;
import com.cls.system.service.ISysDictService;
import com.github.pagehelper.PageInfo;
import com.wuwenze.poi.ExcelKit;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

/**
 * 专家表 Controller
 *
 * @author Carey
 * @date 2020-11-06 10:47:30
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class ExpertController extends BaseController {

    private final IExpertService expertService;
    private final ISysDictService sysDictService;

    @GetMapping(MyConstant.VIEW_PREFIX + "expert")
    public String expertIndex(){
        return MyUtil.view("expert/expert");
    }

    @GetMapping("expert/list")
    @ResponseBody
    @RequiresPermissions("expert:view")
    public ResponseVO expertList(QueryRequest request, Expert expert) {
        PageInfo<Expert> pageInfo =  this.expertService.findExperts(request, expert);
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增Expert", exceptionMessage = "新增Expert失败")
    @PostMapping("expert")
    @ResponseBody
    @RequiresPermissions("expert:add")
    public ResponseVO addExpert(@Valid Expert expert) {
        expert.setIsPublish(false);
        this.expertService.createExpert(expert);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "删除专家", exceptionMessage = "删除专家失败")
    @GetMapping("expert/delete/{expertIds}")
    @ResponseBody
    @RequiresPermissions("expert:delete")
    public ResponseVO deleteExpert(@NotBlank(message = "{required}") @PathVariable String expertIds) {
        String[] ids = expertIds.split(StringPool.COMMA);
        this.expertService.deleteExperts(ids);
        return ResponseVO.success();
    }
    @ControllerEndpoint(operation = "发布专家", exceptionMessage = "删除专家失败")
    @GetMapping("expert/pubish/{expertIds}")
    @ResponseBody
    @RequiresPermissions("expert:update")
    public ResponseVO pubishExpert(@NotBlank(message = "{required}") @PathVariable String expertIds) {
        String[] ids = expertIds.split(StringPool.COMMA);
        this.expertService.pubishExperts(ids);
        return ResponseVO.success();
    }
    @ControllerEndpoint(operation = "取消发布专家", exceptionMessage = "删除专家失败")
    @GetMapping("expert/cancel/{expertIds}")
    @ResponseBody
    @RequiresPermissions("expert:update")
    public ResponseVO cancelExpert(@NotBlank(message = "{required}") @PathVariable String expertIds) {
        String[] ids = expertIds.split(StringPool.COMMA);
        this.expertService.cancelExperts(ids);
        return ResponseVO.success();
    }


    @ControllerEndpoint(operation = "修改专家", exceptionMessage = "修改专家失败")
    @PostMapping("expert/update")
    @ResponseBody
    @RequiresPermissions("expert:update")
    public ResponseVO updateExpert(Expert expert) {
        this.expertService.updateExpert(expert);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "导出专家", exceptionMessage = "导出专家失败")
    @PostMapping("expert/excel")
    @ResponseBody
    @RequiresPermissions("expert:export")
    public void export(QueryRequest queryRequest, Expert expert, HttpServletResponse response) {
        List<Expert> experts = this.expertService.findExperts(queryRequest, expert).getList();
        ExcelKit.$Export(Expert.class, response).downXlsx(experts, false);
    }

    @ControllerEndpoint(operation = "导入专家", exceptionMessage = "导出专家失败")
    @PostMapping("expert/import")
    @ResponseBody
    @RequiresPermissions("expert:import")
    public ResponseVO importExpert(@RequestParam MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        if ("".equals(fileName)) {
            System.out.println("未选择导入的EXCEL文件");
            throw new IOException();
        }
        if (!file.isEmpty()) {
            // 1.获取上传文件输入流
            InputStream inputStream = file.getInputStream();
            this.expertService.uploadExpert(inputStream);
        }
        System.out.println("新增成功");
        return ResponseVO.success();
    }
    @ControllerEndpoint(operation = "模板下载", exceptionMessage = "模板下载")
    @ApiOperation("模板下载")
    @GetMapping(value = "expert/downloadT")
    public void downloadT(HttpServletResponse response) {
        InputStream is = null;
        try {
            ClassPathResource cpr = new ClassPathResource("/templates/export/Expert.xlsx");
            is = cpr.getInputStream();
            Workbook workbook = new XSSFWorkbook(is);
            String fileName = "专家导入模板.xlsx";
            downLoadExcel(fileName, response, workbook);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            IoUtil.close(is);
        }
    }


    @GetMapping(MyConstant.VIEW_PREFIX + "system/expert/detail/{expertId}")
    @RequiresPermissions("expert:view")
    public String systemExpertDetail(@PathVariable Long expertId, Model model) {
        resolveExpertModel(expertId, model, true);
        return MyUtil.view("system/expert/expertDetail");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/expert/update/{expertId}")
    @RequiresPermissions("expert:update")
    public String systemExpertUpdate(@PathVariable Long expertId, Model model) {
        resolveExpertModel(expertId, model, false);


        return MyUtil.view("system/expert/expertUpdate");
    }
    @GetMapping(MyConstant.VIEW_PREFIX + "system/expert")
    @RequiresPermissions("expert:view")
    public String systemExpert() {
        return MyUtil.view("system/expert/expert");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/expert/add")
    @RequiresPermissions("expert:add")
    public String systemExpertAdd(Model model) {
        //进入新增页面字典表初始化
       // List<SysDict> noticeType = sysDictService.findByParentCode(DictEnum.NOTICE_TYPE.getCode());
       // model.addAttribute("noticeType",noticeType);

        return MyUtil.view("system/expert/expertAdd");
    }

    private void resolveExpertModel(Long expertId, Model model, Boolean transform) {
        Expert expert = expertService.findById(expertId);
        if(expert.getIsPublish()){
            expert.setIsPublishName("是");
        }else {
            expert.setIsPublishName("否");
        }
        model.addAttribute("expert", expert);

    }
    public static void downLoadExcel(String fileName, HttpServletResponse response, Workbook workbook) {
        ServletOutputStream outputStream = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-Type", "application/vnd.ms-excel");
            response.setHeader("Content-Disposition",
                    "attachment;filename=\"" + URLEncoder.encode(fileName, "UTF-8") + "\"");
            outputStream = response.getOutputStream();
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            //此处记得关闭输出Servlet流
            IoUtil.close(outputStream);
        }
    }
}
