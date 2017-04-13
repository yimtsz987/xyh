package com.hncu.admin.entity;

import com.google.common.collect.Lists;
import com.hncu.admin.common.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * 用户信息实体类
 */
public class User extends BaseEntity {

    private static final long serialVersionUID = -1899937486840402141L;

    /**
     * 登陆标识 - 正常
     */
    public static final String LOGIN_NORMAL = "0";
    /**
     * 登陆标识 - 禁止
     */
    public static final String LOGIN_BAN = "1";
    /**
     * 保密标识 - 是
     */
    public static final String SECRECY_FLAG_YES = "0";
    /**
     * 保密标识 - 否
     */
    public static final String SECRECY_FLAG_NO = "1";

    private String no;
    private String name;
    private String loginName;
    private String password;
    private Role role;
    private String idCard;
    private String sex;
    private String nativePleace;
    private String secrecyFlag = SECRECY_FLAG_YES;
    private String headerPic;
    private String mobile;
    private String email;
    private String classes;
    private String enrollmentYear;
    private Department department;
    private Major major;
    private Branch branch;
    private String wechat;
    private String qq;
    private String address;
    private String homephone;
    private String postcode;
    private String introduction;
    private String enterpriseAddress;
    private String industryCategory;
    private String loginFlag;
    private String loginIp;
    private Date loginDate;

    private String majorId;
    private String branchId;

    private String oldLoginName;

    private List<Role> roleList = Lists.newArrayList(); //拥有的角色


    public User(){

    }

    public User(String id,String majorId,String branchId){
        this.id = id;
        this.getMajor().setId(majorId);
        this.getBranch().setId(branchId);
    }

    public User (String id){
        super(id);
    }

    public User (String id,String loginName) {
        this.id = id;
        this.loginName = loginName;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNativePleace() {
        return nativePleace;
    }

    public void setNativePleace(String nativePleace) {
        this.nativePleace = nativePleace;
    }

    public String getSecrecyFlag() {
        return secrecyFlag;
    }

    public void setSecrecyFlag(String secrecyFlag) {
        this.secrecyFlag = secrecyFlag;
    }

    public String getHeaderPic() {
        return headerPic;
    }

    public void setHeaderPic(String headerPic) {
        this.headerPic = headerPic;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getEnrollmentYear() {
        return enrollmentYear;
    }

    public void setEnrollmentYear(String enrollmentYear) {
        this.enrollmentYear = enrollmentYear;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHomephone() {
        return homephone;
    }

    public void setHomephone(String homephone) {
        this.homephone = homephone;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getEnterpriseAddress() {
        return enterpriseAddress;
    }

    public void setEnterpriseAddress(String enterpriseAddress) {
        this.enterpriseAddress = enterpriseAddress;
    }

    public String getIndustryCategory() {
        return industryCategory;
    }

    public void setIndustryCategory(String industryCategory) {
        this.industryCategory = industryCategory;
    }

    public String getLoginFlag() {
        return loginFlag;
    }

    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getOldLoginName() {
        return oldLoginName;
    }

    public void setOldLoginName(String oldLoginName) {
        this.oldLoginName = oldLoginName;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public String getMajorId() {
        return majorId;
    }

    public void setMajorId(String majorId) {
        this.majorId = majorId;
    }

    public String getBranchId() {
        return branchId;
    }

    public void setBranchId(String branchId) {
        this.branchId = branchId;
    }
}
