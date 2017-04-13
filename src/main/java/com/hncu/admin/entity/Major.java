package com.hncu.admin.entity;

import com.hncu.admin.common.BaseEntity;

/**
 * 专业信息实体类
 */
public class Major extends BaseEntity {

    private static final long serialVersionUID = 1427975579722817505L;

    private String name;
    private String sort;
    private Department department;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
