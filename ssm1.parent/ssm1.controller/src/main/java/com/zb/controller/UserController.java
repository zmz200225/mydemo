package com.zb.controller;

import com.zb.entity.User;
import com.zb.service.UserService;
import com.zb.util.SMSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.concurrent.TimeUnit;

@Controller
public class UserController {
    @Autowired
    private SMSUtil sms;

    @Autowired(required = false)
    private RedisTemplate<String, String> redisTemplate;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/adminlogin")
    public String adminlogin(String name, String password, String code, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        int num = register(session, request, response, code);
        if (num == -1) {
            return "adminlogin";
        }
        if (name != null && password != null) {
            User user = userService.findUserLogin(name, password);
            if (user != null && user.getUserIsadmin() == 1) {
                session.setAttribute("sys_user", user);
                return "adminmain";
            }
        }
        request.setAttribute("msg", "用户名密码错误");
        return "adminlogin";
    }

    @RequestMapping("/sendsms")
    @ResponseBody
    public String sendsms(String phone, HttpSession seesion) {
        int code = (int) (Math.random() * 10000 + 1000);
        sms.send(phone, "1", new String[]{code + "", "1"});
        String key = "phone:" + phone;
        redisTemplate.opsForValue().set(key, code + "", 60, TimeUnit.SECONDS);
        return "ok";
    }

    @RequestMapping("/userlogin")
    public String login2(String name, String password, String phone, String code, HttpSession session, HttpServletRequest request) {
        String key = "phone:" + phone;
        String strCode = redisTemplate.opsForValue().get(key);
        if (!strCode.equals(code)) {
            request.setAttribute("msg", "验证码不正确！");
            return "userlogin";
        }
        if (name != null && password != null) {
            User user = userService.findUserLogin(name, password);
            if (user != null) {
                session.setAttribute("sys_user", user);
                return "usermain";
            }
        }
        request.setAttribute("msg", "用户名密码错误");
        return "userlogin";
    }

    @RequestMapping(value = "/insertuser")
    public String insertuser(User user, HttpServletRequest request, HttpSession session, HttpServletResponse response, String code) {
        int num1 = register(session, request, response, code);
        if (num1 == -1) {
            return "adminlogin";
        }
        int num = userService.insertUser(user);
        if (num > 0) {
            request.setAttribute("msg", "<script>alert('注册成功')</script>");
        } else {
            request.setAttribute("msg", "<script>alert('注册失败')</script>");
        }
        return "userlogin";
    }

    @RequestMapping(value = "/exit")
    public String exit(HttpSession session) {
        session.invalidate();
        return "userlogin";
    }

    public int register(HttpSession session, HttpServletRequest request, HttpServletResponse response, String code) {
        String numrand = (String) session.getAttribute("numrand");
        if (!code.trim().equals(numrand)) {
            request.setAttribute("msg", "注册失败！验证码不正确！");
            return -1;
        }
        return 1;
    }
}
