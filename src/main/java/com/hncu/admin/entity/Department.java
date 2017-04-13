package com.hncu.admin.entity;

import com.hncu.admin.common.BaseEntity;

/**
 * 院系信息实体类
 */
public class Department extends BaseEntity {

    private static final long serialVersionUID = 7697560743761445067L;

    private String dNo; //院系编号
    private String name; //院系名称
    private String count; //人数
    private String sort;  //排序

    public Department(){
    }
    public Department(String dNo){
        this.dNo = dNo;
        this.sort = dNo;
    }

    public String getdNo() {
        return dNo;
    }

    public void setdNo(String dNo) {
        this.dNo = dNo;
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

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
