package com.hncu.admin.service;

import com.hncu.admin.common.BaseService;
import com.hncu.admin.dao.mapper.AdminMapper;
import com.hncu.admin.entity.Admin;
import com.hncu.admin.entity.Menu;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 管理员信息服务类
 */
@Service
public class AdminService extends BaseService<AdminMapper, Admin> {

    public static final int HASH_ITERATIONS = 1024;
    public static final int SALT_SIZE = 8;

    public static final String USER_CACHE = "userCache";
    public static final String USER_CACHE_ID = "id_";
    public static final String USER_CACHE_LOGINNAME = "loginName_";

    public Admin queryAdminByLoginName (String loginName) {
        Admin admin = mapper.queryAdminByLoginName(new Admin(null, loginName));
        if (admin == null) {
            return null;
        }
        return admin;
    }

}
