package cn.ssm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: blog_maven
 * @description: 拦截器
 * @author: Mr.Gu
 * @create: 2020-05-21 04:18
 **/
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的url
        String url = request.getRequestURI();
        //判断url是否为公开地址（实际使用时需要配置在配置文件中)
        //这里公开地址就是登录的地址
        if (url.indexOf("admin") >= 0) {
            //如果是登录提交，则放行
            return true;
        }
        Object name = request.getSession().getAttribute("name");
        if (name != null) {
            return true;
        } else {
            response.sendRedirect(request.getContextPath() + "/admin");
            return false;
        }
    }
}
