package com.hncu.admin.entity;

import com.hncu.admin.common.TreeEntity;

/**
 * 分会信息实体类
 */
public class Branch extends TreeEntity<Branch> {

    private static final long serialVersionUID = -3437981132718371404L;

    private String captain;
    private String count;

    public Branch() {

    }

    public Branch(String id){
        super(id);
    }

    public String getCaptain() {
        return captain;
    }

    public void setCaptain(String captain) {
        this.captain = captain;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    @Override
    public Branch getParent() {
        return null;
    }

    @Override
    public void setParent(Branch parent) {

    }
}
