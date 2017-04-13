package com.hncu.admin.security;

import com.hncu.admin.common.Config;
import com.hncu.admin.entity.Admin;
import com.hncu.admin.entity.Menu;
import com.hncu.admin.entity.Role;
import com.hncu.admin.entity.User;
import com.hncu.admin.service.AdminService;
import com.hncu.admin.service.UserService;
import com.hncu.admin.utils.EncryptUtil;
import com.hncu.admin.utils.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2015/7/22.
 */
@Component
public class UserPassAuthRealm extends AuthorizingRealm{

    @Resource
    private UserService userService;

    /***
     * 获取授权信息
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Principal principal = (Principal)getAvailablePrincipal(principalCollection);
        User user = userService.queryUserByLoginName(principal.getLoginName());
        if (user != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            List<Menu> menuList = userService.getMenuList();
            for (Menu menu : menuList) {
                if (StringUtils.isNotBlank(menu.getPermission())){
                    for (String permission : StringUtils.split(menu.getPermission(), ",")){
                        info.addStringPermission(permission);
                    }
                }
            }

            info.addStringPermission("user");
            //添加用户拥有的角色
            List<Role> roleList = userService.getRoleList();
            for (Role role : roleList) {
                info.addRole(role.getName());
            }
            //todo 更新用户登录的相关信息
            //todo 记录用户登录日志


            return info;
        }
        return null;
    }

    /**
     * 进行登陆的认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        UsernamePasswordToken authTocken = (UsernamePasswordToken)authenticationToken;

        User user = userService.queryUserByLoginName(authTocken.getUsername());

        if (user != null) {
            if (Config.YES.equals(user.getLoginFlag())) {
                byte[] salt = EncryptUtil.decodeHex(user.getPassword().substring(0,16));

                return new SimpleAuthenticationInfo(new Principal(user),
                        user.getPassword().substring(16),
                        ByteSource.Util.bytes(salt), getName());
            } else {
                throw new AuthenticationException("xyh:该账号已禁止登陆!");
            }
        } else {
            return null;
        }
    }

    /**
     * 设定密码校验的算法与迭代次数
     */
    @PostConstruct
    public void initCredentialsMatcher () {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(EncryptUtil.SHA1);
        matcher.setHashIterations(userService.HASH_ITERATIONS);
        setCredentialsMatcher(matcher);
    }
}
