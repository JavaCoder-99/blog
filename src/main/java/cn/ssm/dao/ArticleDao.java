package cn.ssm.dao;

import cn.ssm.pojo.Article;
import cn.ssm.pojo.Reply;
import cn.ssm.pojo.Words;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 22:59
 **/
public interface ArticleDao {
    List<Article> findByPage();

    Article findById(Integer r_id);

    List<Words> findByWords(Integer r_id);

    List<Reply> findByReply(Integer r_id);

    Integer saveWords(Words words);

    Integer saveReply(Reply reply);

    Integer saveArticle(Article article);

    Integer clean(Integer r_id);

    Integer update(Article article);

    List<Article> findByTrash();

    Integer restore(Integer r_id);

    Integer delete(Integer r_id);

    List<Article> findByCondition(Article article);

    List<Article> queryAllPub();

    Integer getWordsNum();

    Integer getReplyNum();

    List<Words> LatestMessage();

    List<Article> recentlyReleased();

    Integer flow(Integer r_id);

    Integer good(Integer r_id);
}
