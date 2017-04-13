package com.hncu.admin.web;

import com.hncu.admin.common.BaseController;
import com.hncu.admin.utils.DateUtils;
import com.hncu.admin.utils.RequestUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 主页控制类
 */
@Controller
@RequestMapping(value = "/sys")
public class HomeController extends BaseController {

    @RequiresPermissions("user")
    @RequestMapping(value = "/home")
    public String home(HttpServletRequest request, Model model){
        String loginIp = RequestUtil.getRemoteAddr(request);
        model.addAttribute("loginIp",loginIp);
        model.addAttribute("nowDate", DateUtils.getDateTime());
        return "admin/home";
    }
}
