package cn.ssm.pojo;

import lombok.Data;

/**
 * 留言信息
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-21 01:01
 **/
@Data
public class Words {

    //编号
    private Integer lw_id;
    //留言人
    private String lw_name;
    //留言时间
    private String lw_date;
    //留言内容
    private String lw_content;
    //给谁留言
    private String lw_for_name;
    //在哪篇文章留言(id)
    private Integer lw_for_article_id;
}
