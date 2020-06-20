package cn.ssm.controller;

import cn.ssm.pojo.*;
import cn.ssm.service.ArticleService;
import cn.ssm.service.VisitorService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: blog_maven
 * @description: 游客控制
 * @author: Mr.Gu
 * @create: 2020-05-22 20:08
 **/
@Controller
@RequestMapping("/")
public class VisitorController {

    /**
     * 注入
     */
    @Autowired
    private VisitorService visitorService;
    /**
     * 注入
     */
    @Autowired
    private ArticleService articleService;

    /**
     * 登录页面
     */
    @RequestMapping("/login")
    public String login() {
        return "front/login";
    }

    /**
     * 访客登录
     */
    @RequestMapping("/userLogin")
    @ResponseBody
    public String userLogin(@RequestBody Visitor visitor,
                            HttpServletRequest request) throws JsonProcessingException {
        Visitor ref = visitorService.findByName(visitor.getV_username());
        if (ref != null) {
            //存在就登录
            Visitor login = visitorService.login(visitor);
            if (login != null) {
                //登录成功
                request.getSession().setAttribute("visitor", login.getV_username());
                return JSON.toJSONString(new Result(200, "登录成功"), SerializerFeature.BrowserCompatible);
            } else {
                //登录失败
                return JSON.toJSONString(new Result(400, "登录失败 请检查密码"), SerializerFeature.BrowserCompatible);
            }

        } else {
            //不存在就注册
            Integer insert = visitorService.insert(visitor);
            if (insert != 0) {
                //注册成功
                request.getSession().setAttribute("visitor", visitor.getV_username());
                return JSON.toJSONString(new Result(200, "注册成功"), SerializerFeature.BrowserCompatible);
            } else {
                //注册失败
                return JSON.toJSONString(new Result(400, "注册失败"), SerializerFeature.BrowserCompatible);
            }
        }
    }

    /**
     * 根据用户名查询
     */
    @RequestMapping(value = "/findByName")
    @ResponseBody
    public String findByName(@RequestBody Visitor visitor) throws JsonProcessingException {
        Visitor ref = visitorService.findByName(visitor.getV_username());
        String value = JSON.toJSONString(ref);
        return value;
    }

    /**
     * 退出
     */
    @RequestMapping("/userLogout")
    @ResponseBody
    public String userLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "";
    }

    /**
     * 保存留言信息
     */
    @RequestMapping(value = "/saveWords")
    public String saveWords(Words words) {
        articleService.saveWords(words);
        return "redirect:detail/" + words.getLw_for_article_id();
    }

    /**
     * 保存回复信息
     */
    @RequestMapping(value = "/saveReply")
    public String saveReply(Reply reply) {
        articleService.saveReply(reply);
        return "redirect:detail/" + reply.getLr_for_article_id();
    }

    /**
     * 点赞+1
     */
    @RequestMapping("/good/{r_id}")
    public void good(@PathVariable("r_id") Integer r_id){
         articleService.good(r_id);
    }
}
