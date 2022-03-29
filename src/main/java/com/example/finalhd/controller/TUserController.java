package com.example.finalhd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.finalhd.entity.TUser;
import com.example.finalhd.service.TUserService;
import com.example.finalhd.service.impl.TUserServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhang
 * @since 2022-02-10
 */
@RestController
@RequestMapping("/t-user")
public class TUserController {
    @Resource
    TUserServiceImpl tUserServiceimpl;
    @GetMapping("/getalluser")
    public RespBean getalluser() {
        QueryWrapper<TUser> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("type",2);

        List<TUser>  userList=tUserServiceimpl.list(queryWrapper);
        return RespBean.ok("ok",userList);
    }

}