package com.hncu.admin.dao.mapper;

import com.hncu.admin.common.BaseMapper;
import com.hncu.admin.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 角色信息数据持久化操作接口类
 */
@Repository
public interface RoleMapper extends BaseMapper<Role> {

    List<Role> queryByUserId (Role role);
}
