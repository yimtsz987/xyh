package com.hncu.admin.utils;

import com.hncu.admin.common.SpringContextHolder;
import com.hncu.admin.entity.*;
import com.hncu.admin.security.Principal;
import com.hncu.admin.service.AdminService;
import com.hncu.admin.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.List;

/**
 * 用户信息帮助类
 */
public class UserUtils {

    private static UserService userService = SpringContextHolder.getBean(UserService.class);
    private static AdminService adminService = SpringContextHolder.getBean(AdminService.class);

    public static final String CACHE_ROLE_LIST = "user_role_list";
    public static final String CACHE_MENU_LIST = "user_menu_list";
    public static final String CACHE_DEPARTMENT_LIST = "user_department_list";
    public static final String CACHE_BRANCH_LIST = "user_branch_list";
    public static final String CACHE_CLASSES_LIST = "user_classes_list";
    public static final String CACHE_MAJOR_LIST = "user_major_list";

    /**
     * 获取当前登陆的用户信息
     * @return
     */
    public static Principal getPrincipal () {
        Subject subject = SecurityUtils.getSubject();
        Principal principal =  (Principal)subject.getPrincipal();
        return principal;
    }

    /**
     * 获取当前登陆的用户对象
     * @return 如果登陆的用户为空，则返回空User
     */
    public static User getCurrentUser () {
        Principal principal = getPrincipal();
        if (principal != null) {
            User user = userService.queryById(principal.getId());
            if (user != null) {
                return user;
            } else {
                return new User ();
            }
        } else {
            return new User ();
        }
    }

    /**
     * 获取当前登陆用户所拥有的菜单列表
     * @return
     */
    public static List<Menu> getMenuList () {
        return userService.getMenuList();
    }

    /**
     * 获取当前登陆的用户的角色列表
     * @return
     */
    public static List <Role> getRoleList () {
        return userService.getRoleList();
    }

    /**
     * 获取班级列表
     * @return
     */
    public static List<Classes> getClassesList (){
        return userService.queryClassesList();
    }

    /**
     * 获取院系列表
     * @return
     */
    public static List<Department> getDepartmentList (){
        return userService.queryDepartmentList();
    }

    /**
     * 获取分会列表
     * @return
     */
    public static List<Branch> getBranchList (){
        return userService.queryBranchList();
    }

    /**
     * 获取专业列表
     * @return
     */
    public static List<Major> getMajorList (){
        return userService.queryMajorList();
    }


    /**
     * 获得用户的会话信息
     * @return
     */
    public static Session getSession () {
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        return session;
    }

    //--------------------------用户会话信息的缓存操作-----------------------//
    public static void putCache (String key, Object value) {
        getSession().setAttribute(key, value);
    }

    public static Object getCache (String key) {
        return getSession().getAttribute(key);
    }

    public static void removeCache (String key) {
        getSession().removeAttribute(key);
    }
}
