package com.hncu.admin.common;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hncu.admin.entity.User;
import com.hncu.admin.utils.UserUtils;
import org.hibernate.validator.constraints.Length;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

/**
 * 所以实体类的超类
 */
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = -4665828830630990032L;

    /**
     * 删除标记 - 正常
     */
    public static final String DEL_FLAG_NORMAL = "0";
    /**
     * 删除标记 - 删除
     */
    public static final String DEL_FLAG_DELETE = "1";



    protected String id;  //主键
    protected User createBy; //创建者
    protected User updateBy; //更新者
    protected Date createDate; //创建时间
    protected Date updateDate; //更新时间
    protected String delFlag = DEL_FLAG_NORMAL; //删除标记  （0正常 1删除）
    @Length(max = 100, message = "备注信息不能超过100个字符")
    protected String remarks;

    /**
     * 执行新增操作之前需要执行的操作
     * 在service类里，调用mapper接口的inset方法以前主动调用
     */
    public void preInsert () {
        User user = UserUtils.getCurrentUser();
        if (user != null) {
            this.createBy = user;
            this.updateBy = user;
        }

        Date now = Calendar.getInstance().getTime();
        this.setCreateDate(now);
        this.setUpdateDate(now);
    }

    public void preUpdate () {
        User user = UserUtils.getCurrentUser();
        if (user != null){
            this.updateBy = user;
        }
        Date now = Calendar.getInstance().getTime();
        this.setUpdateDate(now);
    }

    public BaseEntity() {
    }

    public BaseEntity(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @JsonIgnore
    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    @JsonIgnore
    public User getUpdateBy() {
        return updateBy;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setUpdateBy(User updateBy) {
        this.updateBy = updateBy;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @JsonIgnore
    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
