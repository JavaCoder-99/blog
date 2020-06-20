package cn.ssm.service.impl;

import cn.ssm.dao.AdminDao;
import cn.ssm.pojo.Admin;
import cn.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: blog_maven
 * @description:
 * @author: Mr.Gu
 * @create: 2020-05-20 21:06
 **/
@Service
public class AdminServiceImpl implements AdminService {

    /**
     * 注入
     */
    @Autowired
    private AdminDao adminDao;

    /**
     * 登录用户
     *
     * @param a_name
     * @return
     */
    @Override
    public Admin login(String a_name) {
        return adminDao.login(a_name);
    }

    /**
     * 插入用户
     *
     * @param admin
     * @return
     */
    @Override
    public int insert(Admin admin) {
        return adminDao.insert(admin);
    }

    /**
     * 根据名字查找
     *
     * @param a_name
     * @return
     */
    @Override
    public Admin findByName(String a_name) {
        return adminDao.findByName(a_name);
    }


}
