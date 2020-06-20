package cn.ssm.pojo;

import lombok.Data;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 22:57
 **/
@Data
public class Article {
    // 文章编号
    private Integer r_id;
    // 文章作者
    private String r_author;
    // 文章简介
    private String r_summary;
    // 文章内容
    private String r_content;
    // 文章创建日期
    private String r_date;
    // 文章审核 --> 0：未审核   1：已审核
    private Integer r_verify;
    // 文章发表 --> 0：未发表   1：已发表
    private Integer r_publish;
    // 文章状态 --> 0：存在    1：已删除
    private Integer r_status;
    //留言数量
    private Integer r_words;
    //浏览数量
    private Integer r_views;
    //点赞量
    private Integer r_goods;

    public Article() {
    }

    public Article(String r_author, Integer r_verify, Integer r_publish, Integer r_status) {
        this.r_author = r_author;
        this.r_verify = r_verify;
        this.r_publish = r_publish;
        this.r_status = r_status;
    }
}
