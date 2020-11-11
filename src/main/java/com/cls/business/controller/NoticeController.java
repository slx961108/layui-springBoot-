package com.cls.business.controller;
import com.cls.business.entity.Notice;
import com.cls.business.service.INoticeService;
import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.consts.DictEnum;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.MyConstant;
import com.cls.common.entity.QueryRequest;
import com.cls.common.entity.ResponseVO;
import com.cls.common.utils.MyUtil;
import com.cls.system.entity.SysDict;
import com.cls.system.service.ISysDictService;
import com.github.pagehelper.PageInfo;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * 通知公告 Controller
 *
 * @author weimaomao
 * @date 2020-11-10 09:36:03
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class NoticeController extends BaseController {

    private final INoticeService noticeService;

    private final ISysDictService sysDictService;
    /**
     * 通知公告列表页面
     * @return
     */
    @GetMapping(MyConstant.VIEW_PREFIX + "biz/notice")
    public String noticeIndex(Model model){
        //获取通知类型字典表
        List<SysDict> noticeType = sysDictService.findByParentCode(DictEnum.NOTICE_TYPE.getCode());
        model.addAttribute("noticeType",noticeType);
        return MyUtil.view("business/notice/notice");
    }

    @GetMapping("notice")
    @ResponseBody
    @RequiresPermissions("notice:list")
    public ResponseVO getAllNotices(Notice notice) {
        return ResponseVO.success(noticeService.findNotices(notice));
    }

    @GetMapping("notice/list")
    @ResponseBody
    @RequiresPermissions("notice:list")
    public ResponseVO noticeList(QueryRequest request, Notice notice) {
        PageInfo<Notice> pageInfo =  this.noticeService.findNotices(request, notice);
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增Notice", exceptionMessage = "新增Notice失败")
    @PostMapping("notice")
    @ResponseBody
    @RequiresPermissions("notice:add")
    public ResponseVO addNotice(@Valid Notice notice) {
        this.noticeService.createNotice(notice);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "删除Notice", exceptionMessage = "删除Notice失败")
    @GetMapping("notice/delete")
    @ResponseBody
    @RequiresPermissions("notice:delete")
    public ResponseVO deleteNotice(Notice notice) {
        this.noticeService.deleteNotice(notice);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改Notice", exceptionMessage = "修改Notice失败")
    @PostMapping("notice/update")
    @ResponseBody
    @RequiresPermissions("notice:update")
    public ResponseVO updateNotice(Notice notice) {
        this.noticeService.updateNotice(notice);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改Notice", exceptionMessage = "导出Excel失败")
    @PostMapping("notice/excel")
    @ResponseBody
    @RequiresPermissions("notice:export")
    public void export(QueryRequest queryRequest, Notice notice, HttpServletResponse response) {
        List<Notice> notices = this.noticeService.findNotices(queryRequest, notice).getList();
        ExcelKit.$Export(Notice.class, response).downXlsx(notices, false);
    }
}
