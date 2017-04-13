package com.hncu.admin.web;

import com.hncu.admin.common.BaseController;
import com.hncu.admin.entity.Branch;
import com.hncu.admin.entity.Department;
import com.hncu.admin.entity.Test;
import com.hncu.admin.entity.User;
import com.hncu.admin.service.UserService;
import com.hncu.admin.utils.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * 校友信息控制类
 */
@Controller
@RequestMapping(value = {"/admin","/"})
public class AlumniController extends BaseController {

    @Resource
    private UserService userService;

    @ModelAttribute
    public User get (@RequestParam (required = false) String id){
        if (StringUtils.isBlank(id)) {
            return new User ();
        } else {
            return userService.queryById(id);
        }
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "/alumni")
    public String alumni(User user,Model model){
        List<User> userList = userService.queryList(user);
        model.addAttribute("userList", userList);
        model.addAttribute("departmentList", userService.queryDepartmentList());
        model.addAttribute("branchList", userService.queryBranchList());
        model.addAttribute("classesList", userService.queryClassesList());
        model.addAttribute("majorList", userService.queryMajorList());
        model.addAttribute("alumniCount", userService.queryAlumniCount());
        return "admin/alumni";
    }

    @ResponseBody
    @RequestMapping(value = "/queryAlumni",method = RequestMethod.POST)
    public List<User> queryAlumni(@RequestBody User user){
        List<User> userList = userService.queryList(user);
            return userList;
    }

    @ResponseBody
    @RequestMapping(value = "/queryAlumniById")
    public User queryAlumniById(HttpServletRequest request){
        String id = request.getParameter("id");
        User user = userService.queryAlumniById(id);
        return user;
    }

    @RequestMapping(value = "/queryAlumniByDepartment")
    public String queryAlumniByDepartment(@RequestParam(required = false) String dNo, User user, Model model){
        if (dNo != null){
            user.setDepartment(new Department(dNo));
        }
        List<User> userList = userService.queryList(user);
        model.addAttribute("userList", userList);
        model.addAttribute("departmentList", userService.queryDepartmentList());
        model.addAttribute("branchList", userService.queryBranchList());
        model.addAttribute("classesList", userService.queryClassesList());
        model.addAttribute("majorList", userService.queryMajorList());
        model.addAttribute("alumniCount", userService.queryAlumniCount());
        model.addAttribute("departmentNo", dNo);
        return "admin/alumni";
    }

    @RequestMapping(value = "/insertAlumni",method = RequestMethod.POST)
    public String insertAlumni(@Valid User user,BindingResult br, Model model,
                               RedirectAttributes redirectAttributes){
        if (br.hasErrors()) {
            return alumni(user, model);
        }

        try {
            userService.insert(user);
            redirectAttributes.addFlashAttribute("msg","【" + user.getName() + "," + user.getNo() + "】添加成功！");
        } catch (Exception e) {
            logger.error("msg", "【" + user.getName() + "," + user.getNo() + "】添加失败！");
            model.addAttribute("msg", "【" + user.getName() + "," + user.getNo() + "】添加失败！");
            return alumni(new User(),model);
        }
        return "redirect:/admin/alumni";
    }

    @RequestMapping(value = "/saveAlumni",method = RequestMethod.POST)
    public String saveAlumni(@Valid User user,BindingResult br, Model model,
                               RedirectAttributes redirectAttributes){
        if (br.hasErrors()) {
            return alumni(new User(),model);
        }

        try {
            userService.save(user);
            redirectAttributes.addFlashAttribute("msg","【" + user.getName() + "," + user.getNo() + "】保存成功！");
        } catch (Exception e) {
            logger.error("msg", "【" + user.getName() + "," + user.getNo() + "】保存失败！");
            model.addAttribute("msg", "【" + user.getName() + "," + user.getNo() + "】保存失败！");
            return alumni(new User(),model);
        }
        return "redirect:/admin/alumni";
    }

    @RequestMapping(value = "/deleteAlumni")
    public String deleteAlumni(User user, Model model,RedirectAttributes redirectAttributes){
        try {
            userService.delete(user);
            redirectAttributes.addFlashAttribute("msg","【" + user.getName() + "," + user.getNo() + "】删除成功！");
        } catch (Exception e) {
            logger.error("msg", "【" + user.getName() + "," + user.getNo() + "】删除失败！");
            model.addAttribute("msg", "【" + user.getName() + "," + user.getNo() + "】删除失败！");
        }
        return "redirect:/admin/alumni";
    }

}
