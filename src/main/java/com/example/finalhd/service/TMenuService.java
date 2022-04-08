package com.example.finalhd.service;

import com.example.finalhd.entity.TMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhang
 * @since 2022-04-06
 */
public interface TMenuService extends IService<TMenu> {
    List<TMenu> getfathermenu(int type);

}
