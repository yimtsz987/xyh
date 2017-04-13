package com.hncu.admin.common;

import java.util.List;

/**
 * 所有数据库持久化操作超级类
 */
public interface BaseMapper<T> {

    List<T> queryList (T entity);

    T queryById (String id);

    int insert (T entity);

    int update (T entity);

    int delete (T entity);
}
