package cn.ssm.controller;

import cn.ssm.pojo.Article;
import cn.ssm.pojo.Reply;
import cn.ssm.pojo.Words;
import cn.ssm.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 22:40
 **/
@Controller
@RequestMapping("/article")
public class ArticleController {
    /**
     * 注入Service
     */
    @Autowired
    private ArticleService articleService;

    /**
     * 进入主页
     *
     * @return
     */
    @RequestMapping("")
    public String index() {
        return "admin/page";
    }


    /**
     * 目录分页查询
     */
    @RequestMapping(value = "/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false)
                                     Integer pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "3", required = false)
                                     Integer pageSize,
                             Model model) {
        model.addAttribute("page", articleService.findByPage(pageCode, pageSize));
        return "/admin/article/articleManage";
    }

    /**
     * 跳转到查看文章内容页面
     */
    @RequestMapping(value = "/toArticleView")
    public String toArticleView(@RequestParam Integer r_id, Model model) {
        //封装留言信息
        List<Words> wordsList = articleService.findByWords(r_id);
        model.addAttribute("lw_list", wordsList);
        //封装回复信息
        List<Reply> replyList = articleService.findByReply(r_id);
        model.addAttribute("lr_list", replyList);
        //查询文章信息
        Article article = articleService.findById(r_id);
        model.addAttribute("article", article);
        return "admin/article/articleView";
    }

    /**
     * 保存留言信息
     */
    @RequestMapping(value = "/saveWords")
    public String saveWords(Words words) {
        articleService.saveWords(words);
        return "redirect:toArticleView.do?r_id=" + words.getLw_for_article_id();
    }


    /**
     * 保存回复信息
     */
    @RequestMapping(value = "/saveReply")
    public String saveReply(Reply reply) {
        articleService.saveReply(reply);
        return "redirect:toArticleView.do?r_id=" + reply.getLr_for_article_id();
    }

    /**
     * 跳转到文章编辑页面
     */
    @RequestMapping(value = "/toArticleWrite")
    public String toArticleWrite() {
        return "admin/article/articleWrite";
    }

    /**
     * 保存文章
     */
    @RequestMapping(value = "/saveArticle")
    public String saveArticle(Article article, Model model) {
        articleService.saveArticle(article);
        model.addAttribute("message", "文章添加成功");
        return "admin/info/message";
    }

    /**
     * 文章删除（仅放入回收站，即仅仅改变status的值）
     */
    @RequestMapping(value = "/clean")
    public String clean(Integer r_id) {
        articleService.clean(r_id);
        return "redirect:findByPage";
    }


    /**
     * 跳转到更新文章信息页面
     */
    @RequestMapping(value = "/toEditPage")
    public String editPage(@RequestParam int r_id, Model model) {
        Article article = articleService.findById(r_id);
        model.addAttribute("article", article);
        return "/admin/article/articleUpdate";
    }


    /**
     * 更新文章信息的方法
     */
    @RequestMapping(value = "/update")
    public String update(Article article, Model model) {
        articleService.update(article);
        return "redirect:findByPage";
    }

    /**
     * 回收站分页查询
     */
    @RequestMapping(value = "/findByTrash")
    public String findByTrash(@RequestParam(value = "pageCode", defaultValue = "1", required = false)
                                      Integer pageCode,
                              @RequestParam(value = "pageSize", defaultValue = "3", required = false)
                                      Integer pageSize,
                              Model model) {
        Model page = model.addAttribute("page", articleService.findByTrash(pageCode, pageSize));
        return "/admin/article/articleTrash";
    }

    /**
     * 恢复文章信息功能（即将文章从回收站中取出，改变status值）
     */
    @RequestMapping(value = "/restore")
    public String restore(Integer r_id) {
        articleService.restore(r_id);
        return "redirect:findByTrash";
    }

    /**
     * 删除功能
     */
    @RequestMapping(value = "/delete")
    public String delete(Integer r_id) {
        articleService.delete(r_id);
        return "redirect:findByTrash";
    }


    /**
     * 条件查询
     */
    @RequestMapping("/findByCondition")
    public String findByCondition(String r_author,
                                  Integer r_verify,
                                  Integer r_publish,
                                  Integer r_status,
                                  @RequestParam(value = "pageCode", defaultValue = "1", required = false)
                                          Integer pageCode,
                                  @RequestParam(value = "pageSize", defaultValue = "3", required = false)
                                          Integer pageSize,
                                  Model model) {
        Article article = new Article(r_author, r_verify, r_publish, r_status);
        PageInfo info = articleService.findByCondition(pageCode, pageSize, article);
        model.addAttribute("page", info);
        return "/admin/article/articleManage";
    }
}
