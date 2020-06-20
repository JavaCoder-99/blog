package cn.ssm.service;

import cn.ssm.pojo.Visitor;

/**
 * @program: blog_maven
 * @description: 游客服务层
 * @author: Mr.Gu
 * @create: 2020-05-22 20:00
 **/
public interface VisitorService {
    Visitor login(Visitor visitor);
    Integer insert(Visitor visitor);
    Visitor findByName(String username);
}
