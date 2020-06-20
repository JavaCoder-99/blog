package cn.ssm.dao;

import cn.ssm.pojo.Visitor;

/**
 * @program: blog_maven
 * @description: 游客dao
 * @author: Mr.Gu
 * @create: 2020-05-22 20:00
 **/
public interface VisitorDao {
    Visitor login(Visitor visitor);
    Integer insert(Visitor visitor);
    Visitor findByName(String username);
}
