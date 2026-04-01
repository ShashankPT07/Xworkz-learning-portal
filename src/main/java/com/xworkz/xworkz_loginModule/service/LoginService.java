package com.xworkz.xworkz_loginModule.service;

import com.xworkz.xworkz_loginModule.dto.LoginDTO;

public interface LoginService {

    String saveData(LoginDTO loginDTO);

    LoginDTO getEmailInService(String email);

    LoginDTO getPhoneNumberInService(String phoneNumber);

    String login(String username, String password);

    String resetPassword(String email, String newPassword);

}