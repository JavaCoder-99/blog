package cn.ssm.dao;

import cn.ssm.pojo.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 21:07
 **/
public interface AdminDao {
    Admin login(@Param("a_name") String a_name);

    int insert(Admin admin);

    Admin findByName(String a_name);
}
