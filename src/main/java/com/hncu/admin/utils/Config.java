package com.hncu.admin.utils;

/**
 * 全局配置文件帮助类
 */
public class Config {

    /**
     * 显示/隐藏
     */
    public static final String SHOW = "1";
    public static final String HIDE = "0";

    /**
     * 是/否
     */
    public static final String YES = "1";
    public static final String NO = "0";


    /**
     * 获取常量
     * @see
     */
    public static Object getConst(String field) {
        try {
            return Config.class.getField(field).get(null);
        } catch (Exception e) {
            // 异常代表无配置，这里什么也不做
        }
        return null;
    }


}
