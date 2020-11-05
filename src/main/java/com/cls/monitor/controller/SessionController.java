package com.cls.monitor.controller;

import com.cls.common.entity.ResponseVO;
import com.cls.monitor.entity.ActiveUser;
import com.cls.monitor.service.ISessionService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author WeiMaomao
 */
@RestController
@RequestMapping("session")
@RequiredArgsConstructor
public class SessionController {

    private final ISessionService sessionService;

    @GetMapping("list")
    @RequiresPermissions("online:view")
    public ResponseVO list(String username) {
        List<ActiveUser> list = sessionService.list(username);
        Map<String, Object> data = new HashMap<>(2);
        data.put("list", list);
        data.put("total", CollectionUtils.size(list));
        return ResponseVO.success(data);
    }

    @GetMapping("delete/{id}")
    @RequiresPermissions("user:kickout")
    public ResponseVO forceLogout(@PathVariable String id) {
        sessionService.forceLogout(id);
        return ResponseVO.success();
    }
}
