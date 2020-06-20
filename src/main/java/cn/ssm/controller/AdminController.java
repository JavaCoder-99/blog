package cn.ssm.controller;

import cn.ssm.pojo.Admin;
import cn.ssm.service.AdminService;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: blog_maven
 * @description: 主页控制
 * @author: Mr.Gu
 * @create: 2020-05-20 20:27
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {
    /**
     * 注入service
     */
    @Autowired
    private AdminService adminService;

    /**
     * 跳转到系统登录首页
     */
    @RequestMapping("")
    public String index() {
        return "admin/index";
    }

    /**
     * 登录功能
     */
    @RequestMapping("login")
    public String login(String a_name, String a_password, Model model, HttpServletRequest request) {
        Admin admin = adminService.login(a_name);
        if (admin != null) {
            if (admin.getA_password().equals(a_password)) {
                request.getSession().setAttribute("name", a_name);
                return "redirect:/article";
            } else {
                model.addAttribute("message", "密码不正确");
                return "admin/login/info";
            }

        } else {
            model.addAttribute("message", "用户不存在");
            return "admin/login/info";
        }
    }

    /**
     * 注册功能
     */
    @RequestMapping("/register")
    public String register(Admin admin, Model model, HttpServletRequest request) {
        Admin ref = adminService.findByName(admin.getA_name());
        if (ref != null) {
            model.addAttribute("message", "用户已存在");
            return "admin/login/info";
        }
        int re = adminService.insert(admin);
        if (re == 1) {
            request.getSession().setAttribute("name", admin.getA_name());
            return "redirect:/article";
        } else {
            model.addAttribute("message", "注册异常");
            return "admin/login/info";
        }
    }

    /**
     * 退出登录的功能
     */
    @RequestMapping(value = "/outLogin")
    public String outLogin(HttpServletRequest request) {
        request.getSession().invalidate();
        return "admin/index";
    }

    /**
     * 根据用户名查询
     */
    @ResponseBody
    @RequestMapping(value = "/findByName")
    public String findByName(@RequestBody Admin admin) throws JsonProcessingException {
        Admin ref = adminService.findByName(admin.getA_name());
        String value = JSON.toJSONString(ref);
        return value;
    }

}
