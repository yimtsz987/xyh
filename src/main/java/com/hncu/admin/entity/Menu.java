package com.hncu.admin.entity;

import com.hncu.admin.common.Config;
import com.hncu.admin.common.TreeEntity;

/**
 * 菜单信息实体类
 */
public class Menu extends TreeEntity<Menu> {

    private static final long serialVersionUID = -6514808865299347713L;

    private String href;
    private String icon;
    private String isShow;
    private String permission;

    private String userId;

    public Menu () {
        super();
        this.sort = 10;
        this.isShow = Config.SHOW;
    }

    public Menu(String id){
        super(id);
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    @Override
    public Menu getParent() {
        return null;
    }

    @Override
    public void setParent(Menu parent) {

    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
