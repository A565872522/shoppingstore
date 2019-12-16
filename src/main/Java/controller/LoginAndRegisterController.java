package controller;

import entity.Admininfo;
import entity.Userinfo;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import service.UserService;
import serviceimpl.AdmininfoServiceImpl;
import serviceimpl.UserServiceImpl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class LoginAndRegisterController {

    @Autowired
    UserServiceImpl usi;

    @Autowired
    AdmininfoServiceImpl asi;

    @RequestMapping("/register")
    public String register(@RequestParam String username, @RequestParam String password, @RequestParam String email) {
        /*如果查询结果不为空，说明该用户已存在，不允许注册*/
        if (usi.selectByUsername(username) != null) {
            return "existed";
        } else {
            Userinfo ui = new Userinfo();
            ui.setUsername(username);
            ui.setPassword(DigestUtils.md5Hex(password.getBytes()));
            ui.setEmail(email);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ui.setRegisterTime(sdf.format(date));
            int line = usi.insert(ui);
            if (line > 0) {
                return "yes";
            } else {
                return "no";
            }
        }
    }

    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, @RequestParam String flag, HttpServletRequest req, HttpServletResponse resp) {
//        Userinfo ui = usi.selectByUsername(username);
//        if(ui==null){
//            return "none";
//        }else{
//            if(DigestUtils.md5Hex(password.getBytes()).equals(ui.getPassword())){
//                if(flag.equals("yes")){
//                    req.getSession().setAttribute("info",ui);
//                    ui.setPassword(password);
//                }else{
//                    req.getSession().removeAttribute("info");
//                }
//                return "yes";
//            }else{
//                return "no";
//            }
//        }

        Userinfo ui = usi.selectByUsername(username);
        if(ui==null){
            return "none";
        }else{
            if(DigestUtils.md5Hex(password.getBytes()).equals(ui.getPassword())){
                    Cookie name = new Cookie("username", username);
                    Cookie pwd = new Cookie("password", password);
                    name.setMaxAge(10000);
                    pwd.setMaxAge(10000);
                    resp.addCookie(name);
                    resp.addCookie(pwd);
                    if(flag.equals("yes")){
                        Cookie cookie1 = new Cookie("flag","no");
                        cookie1.setMaxAge(10000);
                        resp.addCookie(cookie1);
                    }else{
                        Cookie cookie2 = new Cookie("flag","yes");
                        cookie2.setMaxAge(10000);
                        resp.addCookie(cookie2);
                    }
                return "yes";
            }else{
                return "no";
            }
        }
    }

    @RequestMapping("/adminlogin")
    public String adminlogin(@RequestParam String adName, @RequestParam String adPassword, @RequestParam String flag, HttpServletRequest req, HttpServletResponse resp){
        Admininfo ai = asi.selectByAdName(adName);
        if(ai==null){
            return "none";
        }else{
            if(DigestUtils.md5Hex(adPassword.getBytes()).equals(ai.getAdPassword())){
                Cookie name = new Cookie("adName", adName);
                Cookie pwd = new Cookie("adPassword", adPassword);
                name.setMaxAge(50000);
                pwd.setMaxAge(50000);
                resp.addCookie(name);
                resp.addCookie(pwd);
                if(flag.equals("yes")){
                    Cookie cookie1 = new Cookie("flag", "no");
                    cookie1.setMaxAge(50000);
                    resp.addCookie(cookie1);
                }else{
                    Cookie cookie2 = new Cookie("flag", "yes");
                    cookie2.setMaxAge(50000);
                    resp.addCookie(cookie2);
                }
                return "yes";
            }else{
                return "no";
            }
        }
    }

    @RequestMapping("/forgetpwd")
    public String forgetpwd(@RequestParam String username,@RequestParam String password){
        Userinfo ui = usi.selectByUsername(username);
        if(ui==null){
            return "none";
        }else{
            if(DigestUtils.md5Hex(password.getBytes()).equals(ui.getPassword())){
                return "no";
            }else {
                ui.setPassword(DigestUtils.md5Hex(password.getBytes()));
                int i = usi.updateByPrimaryKeySelective(ui);
//                int i = usi.insert(ui);
                if(i>0){
                    return "yes";
                }else{
                    return "error";
                }
            }
        }
    }
}