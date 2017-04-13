package com.hncu.admin.dao.mapper;

import com.hncu.admin.common.BaseMapper;
import com.hncu.admin.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 菜单信息数据持久化操作接口
 */
@Repository
public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> queryByUserId (Menu menu);
}
