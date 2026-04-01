package com.xworkz.xworkz_loginModule.controller;

import com.xworkz.xworkz_loginModule.dto.LoginDTO;
import com.xworkz.xworkz_loginModule.service.LoginService;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    LoginService loginService;

    @PostMapping("/signup")
    public String register(@Valid LoginDTO dto,
                           BindingResult bindingResult,
                           Model model){

        if(bindingResult.hasErrors()){
            model.addAttribute("errMessage", "Invalid data");
            return "signup";
        }

        String result = loginService.saveData(dto);

        if(result.equalsIgnoreCase("Registered successfully")){
            model.addAttribute("success", result);
            return "signUpResponse";
        }

        model.addAttribute("errMessage", result);
        return "signup";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        String result = loginService.login(email, password);

        if(result.equals("LOGIN_SUCCESS")){

            LoginDTO dto = loginService.getEmailInService(email);

            session.setAttribute("user", dto);

            return "profile";
        }

        if(result.equals("ACCOUNT_LOCKED")){
            model.addAttribute("error","Account locked. Reset password.");
            model.addAttribute("email", email);
            return "signin";
        }

        model.addAttribute("error",result);
        return "signin";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam String email,
                                @RequestParam String newPassword,
                                @RequestParam String confirmPassword,
                                Model model){

        if(!newPassword.equals(confirmPassword)){
            model.addAttribute("message","Passwords do not match");
            return "resetPassword";
        }

        String result = loginService.resetPassword(email, newPassword);
        model.addAttribute("message", result);

        return "signin";
    }
    @PostMapping("/logout")
    public String logout(HttpSession session){

        session.invalidate();

        return "redirect:/signin.jsp";
    }
}