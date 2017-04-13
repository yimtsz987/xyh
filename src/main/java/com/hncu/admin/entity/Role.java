package com.hncu.admin.entity;

import com.google.common.collect.Lists;
import com.hncu.admin.common.BaseEntity;

import java.util.List;

/**
 * 角色信息实体类
 */
public class Role extends BaseEntity {
    private static final long serialVersionUID = -7356645935586755896L;

    private String name;
    private String description;
    private String count;
    private String dataScope;

    /**
     * 所有数据
     */
    public static final String DATA_SCOPE_ALL = "1";
    /**
     * 所在院系数据
     */
    public static final String DATA_SCOPE_DEPARTMENT = "2";
    /**
     * 所在分会数据
     */
    public static final String DATA_SCOPE_BRANCH = "3";
    /**
     * 所在班级数据
     */
    public static final String DATA_SCOPE_CLASS = "4";


    private List<Menu> menuList = Lists.newArrayList(); //角色关联菜单集合

    private User user;

    public Role(){

    }

    public Role(String id) {
        this.id = id;
    }

    public Role(User user) {
        this();
        this.user = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getDataScope() {
        return dataScope;
    }

    public void setDataScope(String dataScope) {
        this.dataScope = dataScope;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
