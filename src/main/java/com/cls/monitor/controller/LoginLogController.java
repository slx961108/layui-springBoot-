package com.cls.monitor.controller;

import com.github.pagehelper.PageInfo;
import com.cls.common.annotation.ControllerEndpoint;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.ResponseVO;
import com.cls.common.entity.QueryRequest;
import com.cls.monitor.entity.LoginLog;
import com.cls.monitor.service.ILoginLogService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.wuwenze.poi.ExcelKit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @author WeiMaomao
 */
@Slf4j
@RestController
@RequestMapping("loginLog")
@RequiredArgsConstructor
public class LoginLogController extends BaseController {

    private final ILoginLogService loginLogService;

    @GetMapping("list")
    @RequiresPermissions("loginlog:view")
    public ResponseVO loginLogList(LoginLog loginLog, QueryRequest request) {
        PageInfo<LoginLog> loginLogs = this.loginLogService.findLoginLogs(loginLog, request);
        return ResponseVO.success(loginLogs);
    }

    @GetMapping("delete/{ids}")
    @RequiresPermissions("loginlog:delete")
    @ControllerEndpoint(exceptionMessage = "删除日志失败")
    public ResponseVO deleteLogss(@NotBlank(message = "{required}") @PathVariable String ids) {
        String[] loginLogIds = ids.split(StringPool.COMMA);
        this.loginLogService.deleteLoginLogs(loginLogIds);
        return ResponseVO.success();
    }

    @GetMapping("excel")
    @RequiresPermissions("loginlog:export")
    @ControllerEndpoint(exceptionMessage = "导出Excel失败")
    public void export(QueryRequest request, LoginLog loginLog, HttpServletResponse response) {
        List<LoginLog> loginLogs = this.loginLogService.findLoginLogs(loginLog, request).getList();
        ExcelKit.$Export(LoginLog.class, response).downXlsx(loginLogs, false);
    }
}
