package com.xworkz.xworkz_loginModule.dao;

import com.xworkz.xworkz_loginModule.entity.LoginEntity;

public interface LoginDAO {

    boolean save(LoginEntity loginEntity);

    LoginEntity getEmail(String email);

    LoginEntity getPhoneNumber(String phoneNumber);

    boolean update(LoginEntity entity);
}
