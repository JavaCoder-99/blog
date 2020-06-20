package cn.ssm.service.impl;

import cn.ssm.dao.ArticleDao;
import cn.ssm.pojo.Article;
import cn.ssm.pojo.Reply;
import cn.ssm.pojo.Words;
import cn.ssm.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 22:42
 **/
@Service
public class ArticleServiceImpl implements ArticleService {

    /**
     * 注入Mapper层
     */
    @Autowired
    private ArticleDao articleMapper;

    /**
     * 分页查询目录的方法
     */
    @Override
    public PageInfo findByPage(Integer pageCode, Integer pageSize) {
        PageHelper.startPage(pageCode, pageSize);
        List<Article> all = articleMapper.findByPage();
        PageInfo<Article> pageInfo = new PageInfo<>(all);
        return pageInfo;
    }

    /**
     * 根据ID查询信息
     *
     * @param r_id 要查询的ID
     * @return 返回查询到的数据
     */
    @Override
    public Article findById(Integer r_id) {
        //浏览+1
        articleMapper.flow(r_id);
        return articleMapper.findById(r_id);
    }

    /**
     * 查询留言信息
     */
    @Override
    public List<Words> findByWords(Integer r_id) {
        return articleMapper.findByWords(r_id);
    }

    /**
     * 查询回复信息
     */
    @Override
    public List<Reply> findByReply(Integer r_id) {
        return articleMapper.findByReply(r_id);
    }

    /**
     * 保存留言信息功能
     *
     * @param words 保存的信息
     */
    @Override
    public Integer saveWords(Words words) {
        return articleMapper.saveWords(words);
    }

    /**
     * 保存回复信息内容
     *
     * @param reply 回复信息
     */
    @Override
    public Integer saveReply(Reply reply) {
        return articleMapper.saveReply(reply);
    }

    /**
     * 添加文章信息
     *
     * @param article 前台传来的文章数据
     */
    @Override
    public Integer saveArticle(Article article) {
        return articleMapper.saveArticle(article);
    }

    /**
     * 删除文章的功能（仅把文章放入到回收站中）
     *
     * @param r_id 需要删除的文章的ID值
     */
    @Override
    public Integer clean(Integer r_id) {
        return articleMapper.clean(r_id);
    }

    /**
     * 更新用户信息的功能
     *
     * @param article 需要更新的数据
     */
    @Override
    public Integer update(Article article) {
        return articleMapper.update(article);
    }

    /**
     * 分页查询回收站的方法
     */
    @Override
    public PageInfo findByTrash(Integer pageCode, Integer pageSize) {
        PageHelper.startPage(pageCode, pageSize);
        List<Article> all = articleMapper.findByTrash();
        PageInfo<Article> pageInfo = new PageInfo<>(all);
        return pageInfo;
    }

    /**
     * 恢复文章的功能（即将文章从回收站中移除）
     *
     * @param r_id 要恢复的文章的ID值
     */
    @Override
    public Integer restore(Integer r_id) {
        return articleMapper.restore(r_id);
    }

    /**
     * 删除功能
     *
     * @param r_id 要删除字段的ID值
     */
    @Override
    public Integer delete(Integer r_id) {
        return articleMapper.delete(r_id);
    }

    /**
     * 按条件查询
     *
     * @param article
     * @return
     */
    @Override
    public PageInfo findByCondition(Integer pageCode, Integer pageSize, Article article) {
        PageHelper.startPage(pageCode, pageSize);
        List<Article> all = articleMapper.findByCondition(article);
        PageInfo<Article> pageInfo = new PageInfo<>(all);
        return pageInfo;
    }

    /**
     * 查询所有发布文章
     *
     * @return
     */
    @Override
    public PageInfo queryAllPub() {
        List<Article> all = articleMapper.queryAllPub();
        PageInfo<Article> pageInfo = new PageInfo<>(all);
        return pageInfo;
    }

    /**
     * 获取留言数量
     */
    @Override
    public Integer getWordsNum() {
        //留言数量
        Integer wordsNum = articleMapper.getWordsNum();
        return wordsNum;
    }

    /**
     * 获取回复数量
     */
    @Override
    public Integer getReplyNum() {
        //回复数量
        Integer replyNum = articleMapper.getReplyNum();
        return replyNum;
    }

    /**
     * 最新的留言
     */
    @Override
    public List<Words> LatestMessage() {
        return articleMapper.LatestMessage();
    }

    /**
     * 最近发布
     *
     * @return
     */
    @Override
    public List<Article> recentlyReleased() {
        return articleMapper.recentlyReleased();
    }

    /**
     * 点赞+1
     * @param r_id
     * @return
     */
    @Override
    public Integer good(Integer r_id) {
        return articleMapper.good(r_id);
    }

}
