package cn.ssm.service;

import cn.ssm.pojo.Admin;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 21:04
 **/
public interface AdminService {
    Admin login(String a_name);

    int insert(Admin admin);

    Admin findByName(String a_name);
}
