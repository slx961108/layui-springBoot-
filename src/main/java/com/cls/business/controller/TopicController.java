package com.cls.business.controller;

import com.cls.common.annotation.ControllerEndpoint;

import com.cls.common.entity.ResponseVO;
import com.cls.common.utils.MyUtil;
import com.cls.common.entity.MyConstant;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.QueryRequest;
import com.cls.business.entity.Topic;
import com.cls.business.service.ITopicService;

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
 * 课题 Controller
 *
 * @author weimaomao
 * @date 2020-11-10 09:57:54
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class TopicController extends BaseController {

    private final ITopicService topicService;

    @GetMapping(MyConstant.VIEW_PREFIX + "topic")
    public String topicIndex(){
        return MyUtil.view("topic/topic");
    }

    @GetMapping("topic")
    @ResponseBody
    @RequiresPermissions("topic:list")
    public ResponseVO getAllTopics(Topic topic) {
        return ResponseVO.success(topicService.findTopics(topic));
    }

    @GetMapping("topic/list")
    @ResponseBody
    @RequiresPermissions("topic:list")
    public ResponseVO topicList(QueryRequest request, Topic topic) {
        PageInfo<Topic> pageInfo =  this.topicService.findTopics(request, topic);
        return ResponseVO.success(pageInfo);
    }

    @ControllerEndpoint(operation = "新增Topic", exceptionMessage = "新增Topic失败")
    @PostMapping("topic")
    @ResponseBody
    @RequiresPermissions("topic:add")
    public ResponseVO addTopic(@Valid Topic topic) {
        this.topicService.createTopic(topic);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "删除Topic", exceptionMessage = "删除Topic失败")
    @GetMapping("topic/delete")
    @ResponseBody
    @RequiresPermissions("topic:delete")
    public ResponseVO deleteTopic(Topic topic) {
        this.topicService.deleteTopic(topic);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改Topic", exceptionMessage = "修改Topic失败")
    @PostMapping("topic/update")
    @ResponseBody
    @RequiresPermissions("topic:update")
    public ResponseVO updateTopic(Topic topic) {
        this.topicService.updateTopic(topic);
        return ResponseVO.success();
    }

    @ControllerEndpoint(operation = "修改Topic", exceptionMessage = "导出Excel失败")
    @PostMapping("topic/excel")
    @ResponseBody
    @RequiresPermissions("topic:export")
    public void export(QueryRequest queryRequest, Topic topic, HttpServletResponse response) {
        List<Topic> topics = this.topicService.findTopics(queryRequest, topic).getList();
        ExcelKit.$Export(Topic.class, response).downXlsx(topics, false);
    }
}
