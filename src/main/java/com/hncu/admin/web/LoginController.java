package com.hncu.admin.web;

import com.hncu.admin.entity.User;
import com.hncu.admin.security.FormAuthFilter;
import com.hncu.admin.security.Principal;
import com.hncu.admin.service.UserService;
import com.hncu.admin.utils.StringUtils;
import com.hncu.admin.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 首页控制类
 */
@Controller
public class LoginController {

    @Resource
    private UserService userService;

    public User get(@RequestParam (required = false) String id){
        if (StringUtils.isBlank(id)){
            return new User();
        } else {
            return userService.queryById(id);
        }
    }

    @RequestMapping (value = "/login", method = RequestMethod.GET)
    public String toLogin () {
        return "admin/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(HttpServletRequest request, Model model){
        Principal principal = UserUtils.getPrincipal();
        if (principal != null) {
            return "redirect:/index";
        }
        String username = WebUtils.getCleanParam(request, FormAuthFilter.DEFAULT_USERNAME_PARAM);
        boolean rememberMe = WebUtils.isTrue(request, FormAuthFilter.DEFAULT_REMEMBER_ME_PARAM);
        String exception = (String) request.getAttribute(FormAuthFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String) request.getAttribute(FormAuthFilter.MESSAGE_PARAM);

        model.addAttribute(FormAuthFilter.DEFAULT_USERNAME_PARAM, username);
        model.addAttribute(FormAuthFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
        model.addAttribute(FormAuthFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
        model.addAttribute(FormAuthFilter.MESSAGE_PARAM, message);

        return "admin/login";
    }


    @RequiresPermissions("user")
    @RequestMapping(value = "/index")
    public String index(){
        return "admin/index";
    }
}
