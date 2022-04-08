package com.example.finalhd.controller;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.finalhd.entity.TMenu;
import com.example.finalhd.service.impl.TMenuServiceImpl;
import com.example.finalhd.util.RespBean;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhang
 * @since 2022-04-06
 */
@RestController
@RequestMapping("/t-menu")
public class TMenuController {
    @Resource
    TMenuServiceImpl tMenuServiceimpl;

 @PostMapping("/getmenu")
 public RespBean getmenu(@RequestBody Map<String,Object> params)
 {
     System.out.println(params);
     int type= (int) params.get("usertype");
    List<TMenu> fathermenu=tMenuServiceimpl.getfathermenu(type);
     List<JSONObject> allmenu=new ArrayList<>();

     for(int i=0;i<fathermenu.size();i++)
    {

        allmenu.add((JSONObject) JSONObject.toJSON(fathermenu.get(i)));
      String chidren=fathermenu.get(i).getChildren();
      List<TMenu> childrenmenu=new ArrayList<>();
        for (String retval: chidren.split("-")){
            childrenmenu.add(tMenuServiceimpl.getById(retval));
//            chidren.deletequestionoption(retval);
        }
        allmenu.get(i).put("menus",childrenmenu);
    }


    return RespBean.ok("111",allmenu);
 }
}
