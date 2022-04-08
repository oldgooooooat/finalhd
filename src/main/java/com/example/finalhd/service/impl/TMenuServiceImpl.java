package com.example.finalhd.service.impl;

import com.example.finalhd.entity.TMenu;
import com.example.finalhd.mapper.TMenuMapper;
import com.example.finalhd.service.TMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhang
 * @since 2022-04-06
 */
@Service
public class TMenuServiceImpl extends ServiceImpl<TMenuMapper, TMenu> implements TMenuService {

   @Resource
   TMenuMapper tMenuMapper;
    @Override
    public List<TMenu> getfathermenu(int type) {
     return    tMenuMapper.getfathermenu(type);
    }
}
