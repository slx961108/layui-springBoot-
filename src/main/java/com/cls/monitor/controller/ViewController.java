package com.cls.monitor.controller;

import com.cls.common.entity.MyConstant;
import com.cls.common.utils.MyUtil;
import com.cls.monitor.endpoint.MyMetricsEndpoint;
import com.cls.monitor.entity.JvmInfo;
import com.cls.monitor.entity.ServerInfo;
import com.cls.monitor.entity.TomcatInfo;
import com.cls.monitor.helper.MyActuatorHelper;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author WeiMaomao
 */
@Controller("monitorView")
@RequestMapping(MyConstant.VIEW_PREFIX + "monitor")
@RequiredArgsConstructor
public class ViewController {

    private final MyActuatorHelper actuatorHelper;

    @GetMapping("online")
    @RequiresPermissions("online:view")
    public String online() {
        return MyUtil.view("monitor/online");
    }

    @GetMapping("log")
    @RequiresPermissions("log:view")
    public String log() {
        return MyUtil.view("monitor/log");
    }

    @GetMapping("loginlog")
    @RequiresPermissions("loginlog:view")
    public String loginLog() {
        return MyUtil.view("monitor/loginLog");
    }

    @GetMapping("httptrace")
    @RequiresPermissions("httptrace:view")
    public String httptrace() {
        return MyUtil.view("monitor/httpTrace");
    }

    @GetMapping("jvm")
    @RequiresPermissions("jvm:view")
    public String jvmInfo(Model model) {
        List<MyMetricsEndpoint.MyMetricResponse> jvm = actuatorHelper.getMetricResponseByType("jvm");
        JvmInfo jvmInfo = actuatorHelper.getJvmInfoFromMetricData(jvm);
        model.addAttribute("jvm", jvmInfo);
        return MyUtil.view("monitor/jvmInfo");
    }

    @GetMapping("tomcat")
    @RequiresPermissions("tomcat:view")
    public String tomcatInfo(Model model) {
        List<MyMetricsEndpoint.MyMetricResponse> tomcat = actuatorHelper.getMetricResponseByType("tomcat");
        TomcatInfo tomcatInfo = actuatorHelper.getTomcatInfoFromMetricData(tomcat);
        model.addAttribute("tomcat", tomcatInfo);
        return MyUtil.view("monitor/tomcatInfo");
    }

    @GetMapping("server")
    @RequiresPermissions("server:view")
    public String serverInfo(Model model) {
        List<MyMetricsEndpoint.MyMetricResponse> jdbcInfo = actuatorHelper.getMetricResponseByType("jdbc");
        List<MyMetricsEndpoint.MyMetricResponse> systemInfo = actuatorHelper.getMetricResponseByType("system");
        List<MyMetricsEndpoint.MyMetricResponse> processInfo = actuatorHelper.getMetricResponseByType("process");

        ServerInfo serverInfo = actuatorHelper.getServerInfoFromMetricData(jdbcInfo, systemInfo, processInfo);
        model.addAttribute("server", serverInfo);
        return MyUtil.view("monitor/serverInfo");
    }

    @GetMapping("swagger")
    public String swagger() {
        return MyUtil.view("monitor/swagger");
    }
}
