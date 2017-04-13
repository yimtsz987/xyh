package com.hncu.admin.web;

import com.hncu.admin.common.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 管理员信息控制类
 */
@Controller
@RequestMapping(value = "/admin/admin")
public class AdminController extends BaseController {

    @RequestMapping("/index")
    public String index(){
        return "/admin/index";
    }

    @RequestMapping("/login")
    public  String adminLogin(){
        return "/admin/login";
    }
}
