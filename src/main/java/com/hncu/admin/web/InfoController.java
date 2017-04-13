package com.hncu.admin.web;

import com.hncu.admin.common.BaseController;
import com.hncu.admin.entity.User;
import com.hncu.admin.service.UserService;
import com.hncu.admin.utils.StringUtils;
import com.hncu.admin.utils.UserUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 个人信息控制层
 */
@Controller
@RequestMapping(value = "/sys")
public class InfoController extends BaseController{

    @Resource
    private UserService userService;

    @ModelAttribute
    public User get (@RequestParam(required = false) String id){
            return userService.queryById(UserUtils.getCurrentUser().getId());
    }

    @RequestMapping(value = "/info")
    public String infoEdit(User user, Model model){
        model.addAttribute("user", user);
        return "admin/info";
    }

    @RequestMapping(value = "/saveUserBaseInfo")
    public String saveUserBaseInfo(@Valid User user, BindingResult br, Model model, RedirectAttributes redirectAttributes){
        if (br.hasErrors()){
            return infoEdit(user, model);
        }
        try {
            userService.updateUserBaseInfo(user);
            redirectAttributes.addFlashAttribute("msg","【基本信息】保存成功！");
        } catch (Exception e) {
            logger.error("【基本信息】保存失败！", e);
            redirectAttributes.addFlashAttribute("msg","【基本信息】保存失败！");
        }
        return "redirect:/sys/info";
    }

    @RequestMapping(value = "/saveUserDetailInfo")
    public String saveUserDetailInfo(@Valid User user, BindingResult br, Model model, RedirectAttributes redirectAttributes){
        if (br.hasErrors()){
            return infoEdit(user, model);
        }
        try {
            userService.updateUserDetailInfo(user);
            redirectAttributes.addFlashAttribute("msg","【详细信息】保存成功！");
        } catch (Exception e) {
            logger.error("【详细信息】保存失败！", e);
            redirectAttributes.addFlashAttribute("msg","【详细信息】保存失败！");
        }
        return "redirect:/sys/info";
    }
}
