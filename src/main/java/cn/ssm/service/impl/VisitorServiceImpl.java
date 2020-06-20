package cn.ssm.service.impl;

import cn.ssm.dao.VisitorDao;
import cn.ssm.pojo.Visitor;
import cn.ssm.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: blog_maven
 * @description: 游客服务层实现
 * @author: Mr.Gu
 * @create: 2020-05-22 20:00
 **/
@Service
public class VisitorServiceImpl implements VisitorService {

    /**
     * 注入
     */
    @Autowired
    private VisitorDao visitorDao;

    /**
     * 游客登录
     * @return
     */
    @Override
    public Visitor login(Visitor visitor) {
        return visitorDao.login(visitor);
    }

    /**
     * 游客注册
     * @return
     */
    @Override
    public Integer insert(Visitor visitor) {
        return visitorDao.insert(visitor);
    }

    /**
     * 游客查名
     * @return
     */
    @Override
    public Visitor findByName(String username) {
        return visitorDao.findByName(username);
    }
}
