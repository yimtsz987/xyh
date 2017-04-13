package com.hncu.admin.dao.mapper;

import com.hncu.admin.common.BaseMapper;
import com.hncu.admin.entity.User;
import org.springframework.stereotype.Repository;

/**
 * 用户信息数据持久化操作接口
 */
@Repository
public interface UserMapper extends BaseMapper<User> {

    /**
     * 根据登录名查询用户
     * @param user
     * @return
     */
    User queryUserByLoginName (User user);

    /**
     * 修改用户密码
     * @param user
     * @return
     */
    int updateUserPassword (User user);

    /**
     * 查询校友数量
     * @return
     */
    int queryAlumniCount();

    /**
     * 更新基本信息
     * @param user
     * @return
     */
    int updateUserBaseInfo(User user);

    /**
     * 更新详细信息
     * @param user
     * @return
     */
    int updateUserDetailInfo(User user);
}
