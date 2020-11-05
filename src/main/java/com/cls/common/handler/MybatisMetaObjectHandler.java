package com.cls.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.cls.system.entity.User;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 公共填充器 mybatis配置
 * mybatisplus自定义填充公共字段 ,即没有传的字段自动填充
 *
 * @author Administrator
 */
@Component
public class MybatisMetaObjectHandler implements MetaObjectHandler {

    private static final Logger logger = LoggerFactory.getLogger(MybatisMetaObjectHandler.class);

    /**
     * 新增填充
     *
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        // 设置操作用户
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        Date now = new Date();
        logger.info("start insert fill ....");
        //避免使用metaObject.setValue()
        this.setFieldValByName("createBy", user.getUserId(), metaObject);
        this.setFieldValByName("createTime", now, metaObject);
        this.setFieldValByName("modifyBy", user.getUserId(), metaObject);
        this.setFieldValByName("modifyTime", now, metaObject);
        this.setFieldValByName("isDelete", Boolean.FALSE, metaObject);
    }

    /**
     * 更新填充
     *
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        logger.info("start update fill ....");
        this.setFieldValByName("modifyBy", user.getUserId(), metaObject);
        this.setFieldValByName("modifyTime", new Date(), metaObject);
    }
}
