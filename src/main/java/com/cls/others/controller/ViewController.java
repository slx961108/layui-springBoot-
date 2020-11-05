package com.cls.others.controller;

import com.cls.common.entity.MyConstant;
import com.cls.common.utils.MyUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author WeiMaomao
 */
@Controller("othersView")
@RequestMapping(MyConstant.VIEW_PREFIX + "others")
public class ViewController {

    @GetMapping("website/form")
    @RequiresPermissions("website:form:view")
    public String websiteForm() {
        return MyUtil.view("others/website/form");
    }

    @GetMapping("website/form/group")
    @RequiresPermissions("website:formgroup:view")
    public String websiteFormGroup() {
        return MyUtil.view("others/website/formGroup");
    }

    @GetMapping("website/tools")
    @RequiresPermissions("website:tools:view")
    public String websiteTools() {
        return MyUtil.view("others/website/tools");
    }

    @GetMapping("website/icon")
    @RequiresPermissions("website:icons:view")
    public String websiteIcon() {
        return MyUtil.view("others/website/icon");
    }

    @GetMapping("website/others")
    @RequiresPermissions("others:website:others")
    public String websiteOthers() {
        return MyUtil.view("others/website/others");
    }

    @GetMapping("apex/line")
    @RequiresPermissions("apex:line:view")
    public String apexLine() {
        return MyUtil.view("others/apex/line");
    }

    @GetMapping("apex/area")
    @RequiresPermissions("apex:area:view")
    public String apexArea() {
        return MyUtil.view("others/apex/area");
    }

    @GetMapping("apex/column")
    @RequiresPermissions("apex:column:view")
    public String apexColumn() {
        return MyUtil.view("others/apex/column");
    }

    @GetMapping("apex/radar")
    @RequiresPermissions("apex:radar:view")
    public String apexRadar() {
        return MyUtil.view("others/apex/radar");
    }

    @GetMapping("apex/bar")
    @RequiresPermissions("apex:bar:view")
    public String apexBar() {
        return MyUtil.view("others/apex/bar");
    }

    @GetMapping("apex/mix")
    @RequiresPermissions("apex:mix:view")
    public String apexMix() {
        return MyUtil.view("others/apex/mix");
    }

    @GetMapping("map")
    @RequiresPermissions("map:view")
    public String map() {
        return MyUtil.view("others/map/gaodeMap");
    }

    @GetMapping("eximport")
    @RequiresPermissions("others:eximport:view")
    public String eximport() {
        return MyUtil.view("others/eximport/eximport");
    }

    @GetMapping("eximport/result")
    public String eximportResult() {
        return MyUtil.view("others/eximport/eximportResult");
    }

    @GetMapping("datapermission")
    public String dataPermissionTest() {
        return MyUtil.view("others/datapermission/test");
    }
}
