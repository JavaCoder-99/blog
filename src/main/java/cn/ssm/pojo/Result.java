package cn.ssm.pojo;

import lombok.Data;

/**
 * @program: blog_maven
 * @description: 返回ajax
 * @author: Mr.Gu
 * @create: 2020-05-22 20:25
 **/
@Data
public class Result {
    private Integer status;
    private String msg;

    public Result() {
    }

    public Result(Integer status, String msg) {
        this.status = status;
        this.msg = msg;
    }
}
