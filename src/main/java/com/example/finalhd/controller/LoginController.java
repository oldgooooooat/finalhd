package com.example.finalhd.controller;

import cn.hutool.core.util.IdUtil;
import com.example.finalhd.entity.TUser;
import com.example.finalhd.service.TUserService;
import com.example.finalhd.service.impl.TUserServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

@RestController
public class LoginController {
    @GetMapping("/login")
    public RespBean login(){
        return RespBean.error("尚未登录，请先登录！");
    }

    @Resource
    TUserServiceImpl tUserService;
    @PostMapping("/regist")
    public RespBean regist(@RequestBody Map<String,String> params)
    {
        String username=params.get("username");
        String password=params.get("password");
        String email=params.get("email");
        String nickname=params.get("nickname");
        String userid= IdUtil.simpleUUID();
     boolean flag=tUserService.register(username,password,email,nickname,userid);
    if (flag)
    {
        return RespBean.ok("注册成功");
    }
    else
    {
        return  RespBean.error("用户名已存在");
    }
    }

}