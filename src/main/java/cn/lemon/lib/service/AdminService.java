package cn.lemon.lib.service;

import cn.lemon.lib.dao.AdminDao;
import cn.lemon.lib.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminService {

    @Autowired
    AdminDao adminDao;

    public Admin check(String username, String password) {
        Admin admin = adminDao.findByName(username);
        return admin;
    }
}
