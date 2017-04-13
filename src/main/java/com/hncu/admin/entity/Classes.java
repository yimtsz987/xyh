package com.hncu.admin.entity;

import com.hncu.admin.common.BaseEntity;

/**
 * 班级信息实体类
 */
public class Classes extends BaseEntity{

    private static final long serialVersionUID = -8443373640300533334L;

    private String classId;
    private Major major;
    private Department department;
    private String count;
    private String sort;

    public Classes() {
    }

    public Classes(String classId) {
        this.classId = classId;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
