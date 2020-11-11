package com.cls.business.controller;

import com.cls.common.utils.MyUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端请求接口
 *
 * @author Administrator
 */
@Controller
@RequestMapping("front")
@RequiredArgsConstructor
public class FrontController {

    /**
     * 首页页面映射
     *
     * @return
     */
    @GetMapping("index")
    public String index() {
        return MyUtil.view("front/index");
    }

    /**
     * 通知公告列表映射
     *
     * @return
     */
    @GetMapping("noticList")
    public String noticList() {
        return MyUtil.view("front/noticList");
    }

    /**
     * 通知公告详情映射
     *
     * @return
     */
    @GetMapping("noticDetail")
    public String noticDetail() {
        return MyUtil.view("front/noticDetail");
    }

}
