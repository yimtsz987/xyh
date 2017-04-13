package com.hncu.admin.common;


import com.hncu.admin.utils.StringUtils;

/**
 * 分页参数类
 */
public class PageParam {
    private String pageNum = "1"; //页码
    private Integer pageSize = 10; //每一页大小
    private String orderBy; //排序的字符串


    public Integer getPageNum() {

        if (StringUtils.isNumeric(pageNum)) {
            return Integer.valueOf(pageNum);
        } else {
            return 1;
        }

    }

    public void setPageNum(String pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
}
