package com.hncu.admin.test;

import com.hncu.admin.dao.mapper.UserMapper;
import com.hncu.admin.entity.User;
import com.hncu.admin.service.UserService;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import javax.annotation.Resource;

/**
 * 测试类
 */
@ContextConfiguration(locations = {"classpath*:/spring-core.xml"})
public class UserServiceTest extends AbstractJUnit4SpringContextTests {

    @Resource
    private UserMapper userMapper;

    @Resource
    private UserService userService;

    @Test
    public void updatePassword(){
        User user = new User();
        user.setId("1");
        user.setPassword("admin");
        String password = userService.enctypePassword(user.getPassword());
        user.setPassword(password);
        userService.updateUserPassword(user);
    }

    @Test
    public void queryUserByLoginName(){
        User user = new User();
        user.setLoginName("1406102-07");
        user = userService.queryUserByLoginName("1406102-07");

        System.out.println(user);
    }

}
