package com.cls.others.controller;

import com.github.pagehelper.PageInfo;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.ResponseVO;
import com.cls.common.entity.QueryRequest;
import com.cls.others.entity.DataPermissionTest;
import com.cls.others.service.IDataPermissionTestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller
 *
 * @author WeiMaomao
 * @date 2020-04-14 15:25:33
 */
@Slf4j
@RestController
@RequestMapping("datapermission/test")
@RequiredArgsConstructor
public class DataPermissionTestController extends BaseController {

    private final IDataPermissionTestService dataPermissionTestService;

    @GetMapping("list")
    @RequiresPermissions("others:datapermission")
    public ResponseVO dataPermissionTestList(QueryRequest request, DataPermissionTest dataPermissionTest) {
        PageInfo<DataPermissionTest> dataPermissionTests = this.dataPermissionTestService.findDataPermissionTests(request, dataPermissionTest);
        return ResponseVO.success(dataPermissionTests);
    }
}
