package com.example.finalhd.mapper;

import com.example.finalhd.entity.TMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhang
 * @since 2022-04-06
 */
public interface TMenuMapper extends BaseMapper<TMenu> {
    List<TMenu> getfathermenu(int type);
}
