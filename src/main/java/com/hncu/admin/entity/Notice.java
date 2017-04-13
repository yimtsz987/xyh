package com.hncu.admin.entity;

import com.hncu.admin.common.BaseEntity;

/**
 * 通知信息实体类
 */
public class Notice extends BaseEntity {
    private static final long serialVersionUID = -2969887938777839395L;

    private String title;
    private String content;
    private String issueId;
    private String receiveIds;

    public Notice(){

    }

    public Notice(String id) {
        super(id);
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIssueId() {
        return issueId;
    }

    public void setIssueId(String issueId) {
        this.issueId = issueId;
    }

    public String getReceiveIds() {
        return receiveIds;
    }

    public void setReceiveIds(String receiveIds) {
        this.receiveIds = receiveIds;
    }
}
