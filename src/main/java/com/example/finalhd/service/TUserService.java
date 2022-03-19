package com.example.finalhd.service;

import com.example.finalhd.entity.TUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhang
 * @since 2022-02-10
 */

public interface TUserService extends IService<TUser> {
    public boolean register(String username, String password,String email,String nickname,String userid);


}
