package com.cls.monitor.controller;

import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.entity.ResponseVO;
import com.cls.common.utils.DateUtil;
import com.cls.monitor.endpoint.MyHttpTraceEndpoint;
import com.cls.monitor.entity.MyHttpTrace;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.boot.actuate.trace.http.HttpTrace;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.cls.monitor.endpoint.MyHttpTraceEndpoint.MyHttpTraceDescriptor;

/**
 * @author WeiMaomao
 */
@Slf4j
@RestController
@RequestMapping("actuator")
@RequiredArgsConstructor
public class ActuatorController {

    private final MyHttpTraceEndpoint httpTraceEndpoint;

    @GetMapping("httptrace")
    @RequiresPermissions("httptrace:view")
    @ControllerEndpoint(exceptionMessage = "请求追踪失败")
    public ResponseVO httpTraces(String method, String url) {
        MyHttpTraceDescriptor traces = httpTraceEndpoint.traces();
        List<HttpTrace> httpTraceList = traces.getTraces();
        List<MyHttpTrace> myHttpTracesList = new ArrayList<>();
        httpTraceList.forEach(t -> {
            MyHttpTrace myHttpTrace = new MyHttpTrace();
            myHttpTrace.setRequestTime(DateUtil.formatInstant(t.getTimestamp(), DateUtil.FULL_TIME_SPLIT_PATTERN));
            myHttpTrace.setMethod(t.getRequest().getMethod());
            myHttpTrace.setUrl(t.getRequest().getUri());
            myHttpTrace.setStatus(t.getResponse().getStatus());
            myHttpTrace.setTimeTaken(t.getTimeTaken());
            if (StringUtils.isNotBlank(method) && StringUtils.isNotBlank(url)) {
                if (StringUtils.equalsIgnoreCase(method, myHttpTrace.getMethod())
                        && StringUtils.containsIgnoreCase(myHttpTrace.getUrl().toString(), url)) {
                    myHttpTracesList.add(myHttpTrace);
                }
            } else if (StringUtils.isNotBlank(method)) {
                if (StringUtils.equalsIgnoreCase(method, myHttpTrace.getMethod())) {
                    myHttpTracesList.add(myHttpTrace);
                }
            } else if (StringUtils.isNotBlank(url)) {
                if (StringUtils.containsIgnoreCase(myHttpTrace.getUrl().toString(), url)) {
                    myHttpTracesList.add(myHttpTrace);
                }
            } else {
                myHttpTracesList.add(myHttpTrace);
            }
        });

        Map<String, Object> data = new HashMap<>(2);
        data.put("list", myHttpTracesList);
        data.put("total", myHttpTracesList.size());
        return ResponseVO.success(data);
    }
}
