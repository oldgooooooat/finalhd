package com.example.finalhd.controller;

import com.example.finalhd.entity.TUser;
import com.example.finalhd.service.TUserService;
import com.example.finalhd.service.impl.TUserServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class LoginController {
    @GetMapping("/login")
    public RespBean login(){
        return RespBean.error("尚未登录，请先登录！");
    }

    @Resource
    TUserServiceImpl tUserService;
    @PostMapping("/regist")
    public RespBean regist(String username,String password)
    {
     boolean flag=tUserService.register(username,password);
    if (flag)
    {
        return RespBean.ok("ok");
    }
    else
    {
        return  RespBean.error("no");
    }
    }

}