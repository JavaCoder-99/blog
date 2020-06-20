package cn.ssm.pojo;

import lombok.Data;

/**
 * 留言回复
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-21 01:02
 **/
@Data
public class Reply {

    //回复信息编号
    private Integer lr_id;
    //回复人
    private String lr_name;
    //回复时间
    private String lr_date;
    //回复内容
    private String lr_content;
    //给谁回复
    private String lr_for_name;
    //哪条留下的回复言
    private String lr_for_words;
    //给哪条回复信息回复的
    private String lr_for_reply;
    //在哪篇文章下的回复
    private Integer lr_for_article_id;

}
