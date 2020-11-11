package com.cls.business.controller;

import com.cls.business.entity.TopicSubject;
import com.cls.business.service.ITopicSubjectService;
import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.MyConstant;
import com.cls.common.entity.QueryRequest;
import com.cls.common.entity.ResponseVO;
import com.cls.common.utils.MyUtil;
import com.github.pagehelper.PageInfo;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 *  Controller
 *
 * @author wandering
 * @date 2020-11-10 09:31:16
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class TopicSubjectController extends BaseController {

    private final ITopicSubjectService topicSubjectService;

    @GetMapping(MyConstant.VIEW_PREFIX + "topicSubject")
    public String topicSubjectIndex(){
        return MyUtil.view("topicSubject/topicSubject");
    }

    @GetMapping("topicSubject")
    @ResponseBody
    @RequiresPermissions("topicSubject:list")
    public ResponseVO getAllTopicSubjects(TopicSubject topicSubject) {
        return new ResponseVO().success(topicSubjectService.findTopicSubjects(topicSubject));
    }

    @GetMapping("topicSubject/list")
    @ResponseBody
    @RequiresPermissions("topicSubject:list")
    public ResponseVO topicSubjectList(QueryRequest request, TopicSubject topicSubject) {
        PageInfo<TopicSubject> pageInfo =  this.topicSubjectService.findTopicSubjects(request, topicSubject);
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增TopicSubject", exceptionMessage = "新增TopicSubject失败")
    @PostMapping("topicSubject")
    @ResponseBody
    @RequiresPermissions("topicSubject:add")
    public ResponseVO addTopicSubject(@Valid TopicSubject topicSubject) {
        this.topicSubjectService.createTopicSubject(topicSubject);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "删除TopicSubject", exceptionMessage = "删除TopicSubject失败")
    @GetMapping("topicSubject/delete")
    @ResponseBody
    @RequiresPermissions("topicSubject:delete")
    public ResponseVO deleteTopicSubject(TopicSubject topicSubject) {
        this.topicSubjectService.deleteTopicSubject(topicSubject);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改TopicSubject", exceptionMessage = "修改TopicSubject失败")
    @PostMapping("topicSubject/update")
    @ResponseBody
    @RequiresPermissions("topicSubject:update")
    public ResponseVO updateTopicSubject(TopicSubject topicSubject) {
        this.topicSubjectService.updateTopicSubject(topicSubject);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改TopicSubject", exceptionMessage = "导出Excel失败")
    @PostMapping("topicSubject/excel")
    @ResponseBody
    @RequiresPermissions("topicSubject:export")
    public void export(QueryRequest queryRequest, TopicSubject topicSubject, HttpServletResponse response) {
        List<TopicSubject> topicSubjects = this.topicSubjectService.findTopicSubjects(queryRequest, topicSubject).getList();
        ExcelKit.$Export(TopicSubject.class, response).downXlsx(topicSubjects, false);
    }
}
