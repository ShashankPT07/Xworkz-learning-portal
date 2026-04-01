package com.xworkz.xworkz_loginModule.service;

import com.xworkz.xworkz_loginModule.dao.LoginDAO;
import com.xworkz.xworkz_loginModule.dto.LoginDTO;
import com.xworkz.xworkz_loginModule.entity.LoginEntity;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginDAO loginDAO;

    @Autowired
    BCryptPasswordEncoder encoder ;

    @Override
    public String saveData(LoginDTO dto) {


        String email = dto.getEmail().trim().toLowerCase();
        System.out.println("Checking email: " + email);
        dto.setEmail(email);

        LoginDTO emailDto = getEmailInService(email);

        if(emailDto != null){
            return "Email already exists";
        }

        LoginDTO phoneDto = getPhoneNumberInService(dto.getPhoneNumber().trim());

        if(phoneDto != null){
            return "Phone number already exists";
        }

        if(!dto.getPassword().equals(dto.getConfirmPassword())){
            return "Password and Confirm Password do not match";
        }

        LoginEntity entity = new LoginEntity();

        BeanUtils.copyProperties(dto,entity);

        String encryptedPassword = encoder.encode(dto.getPassword());
        entity.setPassword(encryptedPassword);

        boolean saved = loginDAO.save(entity);

        if(saved){
            return "Registered successfully";
        }

        return "Registration failed";
    }

    @Override
    public LoginDTO getEmailInService(String email) {

        System.out.println("Inside service getEmail: " + email);

        email = email.toLowerCase().trim();
        LoginEntity entity = loginDAO.getEmail(email);

        if(entity!=null){

            LoginDTO dto = new LoginDTO();
            BeanUtils.copyProperties(entity,dto);

            return dto;
        }

        return null;
    }

    @Override
    public LoginDTO getPhoneNumberInService(String phoneNumber) {

        LoginEntity entity = loginDAO.getPhoneNumber(phoneNumber);

        if(entity!=null){

            LoginDTO dto = new LoginDTO();
            BeanUtils.copyProperties(entity,dto);

            return dto;
        }

        return null;
    }

    @Override
    public String login(String email, String password) {

        email = email.toLowerCase().trim();
        LoginEntity entity = loginDAO.getEmail(email);

        if(entity == null){
            return "User not found";
        }

        if(entity.isAccountLocked()){
            return "ACCOUNT_LOCKED";
        }

        boolean match = encoder.matches(password, entity.getPassword());

        if(match){

            entity.setLoginAttempts(0);
            loginDAO.update(entity);

            return "LOGIN_SUCCESS";
        }

        int attempts = entity.getLoginAttempts() + 1;
        entity.setLoginAttempts(attempts);

        if(attempts >= 3){
            entity.setAccountLocked(true);
            loginDAO.update(entity);
            return "ACCOUNT_LOCKED";
        }

        loginDAO.update(entity);

        return "Incorrect password. Attempt " + attempts + " of 3";
    }

    @Override
    public String resetPassword(String email, String newPassword) {

        LoginEntity entity = loginDAO.getEmail(email);

        if(entity == null){
            return "User not found";
        }

        String encryptedPassword = encoder.encode(newPassword);

        entity.setPassword(encryptedPassword);
        entity.setLoginAttempts(0);
        entity.setAccountLocked(false);

        loginDAO.update(entity);

        return "Password updated successfully";
    }
}