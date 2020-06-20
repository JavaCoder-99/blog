package cn.ssm.controller;

import cn.ssm.pojo.Article;
import cn.ssm.pojo.Reply;
import cn.ssm.pojo.Visitor;
import cn.ssm.pojo.Words;
import cn.ssm.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: blog_maven
 * @description: 博客前页
 * @author: Mr.Gu
 * @create: 2020-05-21 04:56
 **/
@Controller
@RequestMapping("/")
public class IndexController {

    /**
     * 注入
     */
    @Autowired
    private ArticleService articleService;

    /**
     * 博客主页
     *
     * @return
     */
    @RequestMapping
    public String index(Model model) {
        //获取所有文章
        PageInfo pageInfo = articleService.queryAllPub();
        model.addAttribute("page", pageInfo);

        //获取留言数量
        Integer wordsNum = articleService.getWordsNum();
        model.addAttribute("wordsNum", wordsNum);

        //获取回复数量
        Integer replyNum = articleService.getReplyNum();
        model.addAttribute("replyNum", replyNum);

        //最近发布
        List<Article> articles = articleService.recentlyReleased();
        model.addAttribute("articles", articles);

        //最新留言
        List<Words> words = articleService.LatestMessage();
        model.addAttribute("words", words);
        return "front/index";
    }

    /**
     * 博文页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/detail/{r_id}")
    public String detail(@PathVariable("r_id") Integer r_id, Model model) {
        //封装留言信息
        List<Words> wordsList = articleService.findByWords(r_id);
        model.addAttribute("lw_list", wordsList);
        //封装回复信息
        List<Reply> replyList = articleService.findByReply(r_id);
        model.addAttribute("lr_list", replyList);
        //查询文章信息
        Article article = articleService.findById(r_id);
        model.addAttribute("article", article);
        //最近发布
        List<Article> articles = articleService.recentlyReleased();
        model.addAttribute("articles", articles);
        return "front/detail";
    }

    /**
     * 文章列表页面
     *
     * @return
     */
    @RequestMapping("/articlelist")
    public String articlelist(Model model) {
        //获取所有文章
        PageInfo pageInfo = articleService.queryAllPub();
        model.addAttribute("page", pageInfo);
        //最近发布
        List<Article> articles = articleService.recentlyReleased();
        model.addAttribute("articles", articles);
        return "front/articlelist";
    }

    /**
     * 关于本站页面
     */
    @RequestMapping("/about")
    public String about() {
        return "front/about";
    }


    /**
     * 留言页面
     */
    @RequestMapping("/comment")
    public String comment(Model model) {
        List<Words> wordsList = articleService.findByWords(0);
        List<Reply> replyList = articleService.findByReply(0);
        model.addAttribute("lw_list", wordsList);
        model.addAttribute("lr_list", replyList);
        return "front/comment";
    }


    /**
     * 作品界面
     */
    @RequestMapping("/production")
    public String production() {
        return "/front/production";
    }


    /**
     * 点点滴滴界面
     */
    @RequestMapping("/timeline")
    public String timeline() {
        return "/front/timeline";
    }
}
