package com.hncu.admin.service;

import com.alibaba.druid.sql.visitor.functions.If;
import com.google.common.collect.Lists;
import com.hncu.admin.common.BaseService;
import com.hncu.admin.dao.mapper.*;
import com.hncu.admin.entity.*;
import com.hncu.admin.utils.CacheUtil;
import com.hncu.admin.utils.EncryptUtil;
import com.hncu.admin.utils.StringUtils;
import com.hncu.admin.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户信息服务类
 */
@Service
public class UserService extends BaseService<UserMapper, User>{

    @Resource
    private RoleMapper roleMapper;
    @Resource
    private MenuMapper menuMapper;
    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private BranchMapper branchMapper;
    @Resource
    private ClassesMapper classesMapper;
    @Resource
    private MajorMapper majorMapper;

    public static final int HASH_ITERATIONS = 1024;
    public static final int SALT_SIZE = 8;

    public static final String USER_CACHE = "userCache";
    public static final String USER_CACHE_ID = "id_";
    public static final String USER_CACHE_LOGINNAME = "loginName_";

    /**
     * 根据登录名查询用户信息
     * @param loginName
     * @return
     */
    public User queryUserByLoginName(String loginName){
        User user = (User) CacheUtil.get(USER_CACHE, USER_CACHE_LOGINNAME + loginName);
        if (user == null){
            user = mapper.queryUserByLoginName(new User(null,loginName));
            if (user == null){
                return null;
            }
            CacheUtil.put(USER_CACHE, USER_CACHE_LOGINNAME + loginName, user);
            CacheUtil.put(USER_CACHE, USER_CACHE_ID + user.getId(), user);
        }

        return user;
    }

    /**
     * 查询校友数量
     * @return
     */
    public int queryAlumniCount(){
        return mapper.queryAlumniCount();
    }

    /**
     * 根据ID查询用户信息
     * @param id
     * @return
     */
    @Override
    public User queryById(String id) {
        User user = (User) CacheUtil.get(USER_CACHE, USER_CACHE_ID + id);
        if (user == null){
            user = mapper.queryById(id);
            if (user == null) {
                return null;
            }
            //查询用户所拥有的角色列表
            List<Role> roleList = roleMapper.queryByUserId(new Role(user));
            user.setRoleList(roleList);
            CacheUtil.put(USER_CACHE, USER_CACHE_ID + id, user);
            CacheUtil.put(USER_CACHE, USER_CACHE_LOGINNAME + user.getLoginName(), user);
        }
        return user;
    }

    /**
     * 获取当前登陆的用户的角色列表
     * @return
     */
    public List <Role> getRoleList () {
        List <Role> roleList = (List <Role>)UserUtils.getCache(UserUtils.CACHE_ROLE_LIST);
        if (roleList == null) {
            User user = UserUtils.getCurrentUser();

            //查询用户所拥有的角色列表
            roleList = roleMapper.queryByUserId(new Role(user));
            UserUtils.putCache(UserUtils.CACHE_ROLE_LIST, roleList);
        }

        return roleList;
    }

    /**
     * 获取当前登录用户的菜单
     * @return
     */
    public List<Menu> getMenuList (){
        List<Menu> menuList = (List<Menu>) UserUtils.getCache(UserUtils.CACHE_MENU_LIST);
        if (menuList == null) {
            User user = UserUtils.getCurrentUser();
            Menu menu = new Menu();
            menu.setUserId(user.getId());
            menuList = menuMapper.queryByUserId(menu);
            UserUtils.putCache(UserUtils.CACHE_MENU_LIST, menuList);
        }
        return menuList;
    }

    /**
     * 查询所有院系列表
     * @return
     */
    public List<Department> queryDepartmentList(){
        List<Department> departmentList = Lists.newArrayList();
        Department department = new Department();
        departmentList = departmentMapper.queryList(department);
        return departmentList;
    }

    /**
     * 查询所有分会列表
     * @return
     */
    public List<Branch> queryBranchList(){
        List<Branch> branchList = (List<Branch>) UserUtils.getCache(UserUtils.CACHE_BRANCH_LIST);
        if (branchList == null) {
            Branch branch = new Branch();
            branchList = branchMapper.queryList(branch);
            UserUtils.putCache(UserUtils.CACHE_BRANCH_LIST, branchList);
        }
        return branchList;
    }

    /**
     * 查询所有班级信息
     * @return
     */
    public List<Classes> queryClassesList() {
        List<Classes> classesList = (List<Classes>) UserUtils.getCache(UserUtils.CACHE_CLASSES_LIST);
        if (classesList == null) {
            Classes classes = new Classes();
            classesList = classesMapper.queryList(classes);
            UserUtils.putCache(UserUtils.CACHE_CLASSES_LIST, classesList);
        }
        return classesList;
    }

    /**
     * 查询所有专业信息
     * @return
     */
    public List<Major> queryMajorList(){
        List<Major> majorList = (List<Major>) UserUtils.getCache(UserUtils.CACHE_MAJOR_LIST);
        if (majorList == null) {
            Major major = new Major();
            majorList = majorMapper.queryList(major);
            UserUtils.putCache(UserUtils.CACHE_MAJOR_LIST, majorList);
        }
        return majorList;
    }

    /**
     * 插入用户信息
     * @param user
     * @return
     */
    @Transactional(readOnly = false)
    public boolean insert(User user){
        user.setLoginName(user.getNo());
        user.setPassword(enctypePassword("123456"));
        user.setRole(new Role("2"));
        user.preInsert();
        return mapper.insert(user)>0;
    }

    /**
     * 修改基本用户信息
     * @param user
     * @return
     */
    public boolean updateUserBaseInfo(User user){
        return mapper.updateUserBaseInfo(user) > 0;
    }

    /**
     * 修改用户详细信息
     * @param user
     * @return
     */
    public boolean updateUserDetailInfo(User user){
        return mapper.updateUserDetailInfo(user) > 0;
    }

    /**
     * 根据校友ID查询信息
     * @return
     */
    public User queryAlumniById(String id){
        if (StringUtils.isNotBlank(id)){
            return mapper.queryById(id);
        } else {
            return null;
        }
    }

    /**
     * 修改用户密码
     */
    public boolean updateUserPassword (User user) {
        clearUserCache(user);
        return mapper.updateUserPassword(user) > 0;
    }

    /**
     * 对密码进行加密 SHA-1
     * @param plainPassword  明文密码
     * @return
     */
    public String enctypePassword (String plainPassword) {
        byte[] salt = EncryptUtil.generateSalt(SALT_SIZE);
        byte[] hashPass = EncryptUtil.sha1(plainPassword.getBytes(), salt, HASH_ITERATIONS);
        return EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass);
    }

    /**
     * 检验密码是否有效
     * @param plainPassword 明文密码
     * @param password  密文密码
     * @return
     */
    public boolean validatePassword(String plainPassword, String password) {
        byte[] salt = EncryptUtil.decodeHex(password.substring(0,16));
        byte[] hashPass = EncryptUtil.sha1(plainPassword.getBytes(), salt, HASH_ITERATIONS);
        return password.equals(EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass));
    }

    /**
     * 清除用户缓存
     * @param user
     */
    private void clearUserCache (User user) {
        CacheUtil.remove(USER_CACHE, USER_CACHE_ID + user.getId());
        CacheUtil.remove(USER_CACHE, USER_CACHE_LOGINNAME + user.getLoginName());
        CacheUtil.remove(USER_CACHE, USER_CACHE_LOGINNAME + user.getOldLoginName());
    }
}
