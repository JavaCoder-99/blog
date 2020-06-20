package cn.ssm.pojo;

import lombok.Data;

/**
 * @program: blog_maven
 * @description: 游客
 * @author: Mr.Gu
 * @create: 2020-05-22 19:59
 **/
@Data
public class Visitor {
    private Integer v_id;
    private String v_username;
    private String v_password;
}
