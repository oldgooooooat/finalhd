package com.example.finalhd.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.finalhd.entity.TUser;
import com.example.finalhd.service.TUserService;
import com.example.finalhd.service.impl.TUserServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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
    @Resource
    private PasswordEncoder passwordEncoder;
    @GetMapping("/getalluser")
    public RespBean getalluser() {
        QueryWrapper<TUser> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("type",3);

        List<TUser>  userList=tUserServiceimpl.list(queryWrapper);
        for(int i=0;i<userList.size();i++)
        {
            userList.get(i).setPassword(null);
        }
        return RespBean.ok("ok",userList);
    }
    @PostMapping("/getoneuser")
    public RespBean getoneuser(@RequestBody Map<String,Object> params){
        String userid= (String) params.get("userid");
         TUser user =tUserServiceimpl.getById(userid);
   System.out.println(params);
        return RespBean.ok("111",user);

    }
    @PostMapping("/changeuser")
    public  RespBean changeuser(@RequestBody Map<String,Object> params)
    {
        String userid= (String) params.get("id");
        System.out.println(params);
        TUser user =tUserServiceimpl.getById(userid);
        String password= (String) params.get("password");
        UpdateWrapper updateWrapper=new UpdateWrapper();
        if(password.equals(user.getPassword())){
System.out.println("密码相同");

        }
        else
        {
            updateWrapper.set("password",passwordEncoder.encode(password));

        }
        updateWrapper.eq("id",userid);
        updateWrapper.set("email",(String) params.get("email"));
        updateWrapper.set("classname",(String) params.get("classname"));
        updateWrapper.set("nickname",(String) params.get("nickname"));

         tUserServiceimpl.update(updateWrapper);
        return RespBean.ok("111");
    }

}