package com.example.finalhd.controller;


import com.example.finalhd.service.TUserService;
import com.example.finalhd.service.impl.TUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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
    @Autowired
    TUserServiceImpl tUserService;
    @GetMapping("/{id}")
    public Object test(@PathVariable("id") Long id) {
        return tUserService.getById(id);
    }
}