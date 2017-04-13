package com.hncu.admin.dao.mapper;

import com.hncu.admin.common.BaseMapper;
import com.hncu.admin.entity.Admin;

/**
 * 管理信息数据持久化操作接口
 */
public interface AdminMapper extends BaseMapper<Admin> {

    /**
     * 根据登录名查询管理员
     * @param admin
     * @return
     */
    Admin queryAdminByLoginName(Admin admin);
}
