package cn.ssm.service;

import cn.ssm.pojo.Article;
import cn.ssm.pojo.Reply;
import cn.ssm.pojo.Words;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 22:42
 **/
public interface ArticleService {

    PageInfo findByPage(Integer pageCode, Integer pageSize);

    Article findById(Integer r_id);

    List<Words> findByWords(Integer r_id);

    List<Reply> findByReply(Integer r_id);

    Integer saveWords(Words words);

    Integer saveReply(Reply reply);

    Integer saveArticle(Article article);

    Integer clean(Integer r_id);

    Integer update(Article article);

    PageInfo findByTrash(Integer pageCode, Integer pageSize);

    Integer restore(Integer r_id);

    Integer delete(Integer r_id);

    PageInfo findByCondition(Integer pageCode, Integer pageSize, Article article);

    PageInfo queryAllPub();

    Integer getWordsNum();

    Integer getReplyNum();

    List<Words> LatestMessage();

    List<Article> recentlyReleased();

    Integer good(Integer r_id);
}
