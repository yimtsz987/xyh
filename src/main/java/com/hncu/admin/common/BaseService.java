package com.hncu.admin.common;


import com.hncu.admin.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 所有服务类的超类
 */
public class BaseService <D extends BaseMapper <T>, T extends BaseEntity> {

    @Autowired
    protected D mapper;

    /**
     * 根据id查询数据
     * @param id
     * @return
     */
    public T queryById (String id) {
        return mapper.queryById(id);
    }

    /**
     * 查询列表
     * @param entity
     * @return
     */
    public List<T> queryList (T entity) {
        return mapper.queryList(entity);
    }

    /**
     * 保存数据，判断id是否为空，为空时新增，不为空，修改
     * @param entity
     * @return
     */
    public boolean save (T entity) {
        int res = 0;
        if(StringUtils.isBlank(entity.getId())) {
            entity.preInsert();
            res = mapper.insert(entity);
        } else {
            entity.preUpdate();
            res = mapper.update(entity);
        }

        return res > 0;
    }

    /**
     * 删除数据
     * @param entity
     * @return
     */
    public boolean delete (T entity) {
        int res = mapper.delete(entity);
        return res > 0;
    }
}
