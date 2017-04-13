package com.hncu.admin.common;

import com.hncu.admin.utils.ReflectionUtil;
import com.hncu.admin.utils.StringUtils;

/**
 * 树形数据实体类
 */
public abstract class TreeEntity<T> extends BaseEntity  {

    private static final long serialVersionUID = -316967882404509699L;

    protected T parent; //父级对象
    protected String parentIds; //所有祖先菜单id，以","分割
    protected String name;
    protected Integer sort;

    public TreeEntity(){
        super();
        this.sort = 10;
    }

    public TreeEntity (String id) {
        super(id);
    }

    /**
     * 只能通过子类去实现，否则mybatis无法获得parent对象
     * @return
     */
    public abstract T getParent();

    public abstract void setParent(T parent);

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    //暂时待定
    public String getParentId(){
        String id = null;
        if (parent != null) {
            id = (String) ReflectionUtil.getFieldValue(parent, "id");
        }
        return StringUtils.isNoneBlank(id) ? id : "0";
    }
}
