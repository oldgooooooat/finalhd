package com.example.finalhd.mapper;

import com.example.finalhd.entity.TUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhang
 * @since 2022-02-10
 */
public interface TUserMapper extends BaseMapper<TUser> {
TUser loadUserByUsername(String username);
void regist(@Param("username") String username,
            @Param("password") String password
            );

}
