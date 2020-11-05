package com.cls.system.controller;

import com.cls.common.authentication.ShiroHelper;
import com.cls.common.controller.BaseController;
import com.cls.common.entity.MyConstant;
import com.cls.common.utils.DateUtil;
import com.cls.common.utils.MyUtil;
import com.cls.system.entity.User;
import com.cls.system.service.IUserDataPermissionService;
import com.cls.system.service.IUserService;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.ExpiredSessionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author WeiMaomao
 */
@Controller("systemView")
@RequiredArgsConstructor
public class ViewController extends BaseController {

    private final IUserService userService;
    private final ShiroHelper shiroHelper;
    private final IUserDataPermissionService userDataPermissionService;

    @GetMapping("login")
    @ResponseBody
    public Object login(HttpServletRequest request) {
        if (MyUtil.isAjaxRequest(request)) {
            throw new ExpiredSessionException();
        } else {
            ModelAndView mav = new ModelAndView();
            mav.setViewName(MyUtil.view("login"));
            return mav;
        }
    }

    @GetMapping("unauthorized")
    public String unauthorized() {
        return MyUtil.view("error/403");
    }


    @GetMapping("/")
    public String redirectIndex() {
        return "redirect:/index";
    }

    @GetMapping("index")
    public String index(Model model) {
        AuthorizationInfo authorizationInfo = shiroHelper.getCurrentUserAuthorizationInfo();
        User user = super.getCurrentUser();
        User currentUserDetail = userService.findByName(user.getUsername());
        currentUserDetail.setPassword("It's a secret");
        model.addAttribute("user", currentUserDetail);
        model.addAttribute("permissions", authorizationInfo.getStringPermissions());
        model.addAttribute("roles", authorizationInfo.getRoles());
        return "index";
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "layout")
    public String layout() {
        return MyUtil.view("layout");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "password/update")
    public String passwordUpdate() {
        return MyUtil.view("system/user/passwordUpdate");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "user/profile")
    public String userProfile() {
        return MyUtil.view("system/user/userProfile");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "user/avatar")
    public String userAvatar() {
        return MyUtil.view("system/user/avatar");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "user/profile/update")
    public String profileUpdate() {
        return MyUtil.view("system/user/profileUpdate");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/user")
    @RequiresPermissions("user:view")
    public String systemUser() {
        return MyUtil.view("system/user/user");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/user/add")
    @RequiresPermissions("user:add")
    public String systemUserAdd() {
        return MyUtil.view("system/user/userAdd");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/user/detail/{username}")
    @RequiresPermissions("user:view")
    public String systemUserDetail(@PathVariable String username, Model model) {
        resolveUserModel(username, model, true);
        return MyUtil.view("system/user/userDetail");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/user/update/{username}")
    @RequiresPermissions("user:update")
    public String systemUserUpdate(@PathVariable String username, Model model) {
        resolveUserModel(username, model, false);
        return MyUtil.view("system/user/userUpdate");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/role")
    @RequiresPermissions("role:view")
    public String systemRole() {
        return MyUtil.view("system/role/role");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/menu")
    @RequiresPermissions("menu:view")
    public String systemMenu() {
        return MyUtil.view("system/menu/menu");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "system/dept")
    @RequiresPermissions("dept:view")
    public String systemDept() {
        return MyUtil.view("system/dept/dept");
    }

    @RequestMapping(MyConstant.VIEW_PREFIX + "index")
    public String pageIndex() {
        return MyUtil.view("index");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "404")
    public String error404() {
        return MyUtil.view("error/404");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "403")
    public String error403() {
        return MyUtil.view("error/403");
    }

    @GetMapping(MyConstant.VIEW_PREFIX + "500")
    public String error500() {
        return MyUtil.view("error/500");
    }

    private void resolveUserModel(String username, Model model, Boolean transform) {
        User user = userService.findByName(username);
        String deptIds = userDataPermissionService.findByUserId(String.valueOf(user.getUserId()));
        user.setDeptIds(deptIds);
        model.addAttribute("user", user);
        if (transform) {
            String sex = user.getSex();
            if (User.SEX_MALE.equals(sex)) {
                user.setSex("男");
            } else if (User.SEX_FEMALE.equals(sex)) {
                user.setSex("女");
            } else {
                user.setSex("保密");
            }
        }
        if (user.getLastLoginTime() != null) {
            model.addAttribute("lastLoginTime", DateUtil.getDateFormat(user.getLastLoginTime(), DateUtil.FULL_TIME_SPLIT_PATTERN));
        }
    }
}
