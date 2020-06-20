package cn.ssm.pojo;

import lombok.Data;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 21:05
 **/
@Data
public class Admin {
    // ID编号
    private Integer a_id;
    // 用户名
    private String a_name;
    // 密码
    private String a_password;
}
