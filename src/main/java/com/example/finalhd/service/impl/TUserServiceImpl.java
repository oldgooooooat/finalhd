package com.example.finalhd.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.example.finalhd.entity.TUser;
import com.example.finalhd.mapper.TUserMapper;
import com.example.finalhd.service.TUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhang
 * @since 2022-02-10
 */
@Service
public class TUserServiceImpl extends ServiceImpl<TUserMapper, TUser> implements TUserService {

    @Resource
    TUserMapper tUserMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Override
    public boolean register(String username, String password) {

        TUser tUser = tUserMapper.loadUserByUsername(username);
        System.out.println(username);
       System.out.println(tUser);
        if (tUser == null) {
            String password1 = passwordEncoder.encode(password);
         tUserMapper.regist(username, password1);
         return true;
        }
        else
            return  false;
    }
}
