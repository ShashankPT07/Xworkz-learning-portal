package com.xworkz.xworkz_loginModule.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "loginModule")
@NamedQuery(name = "findByEmail",
        query = "select entity from LoginEntity entity where lower(entity.email) = :getEmail"
)
@NamedQuery(name = "findByPhoneNumber",query = "select entity from LoginEntity entity where entity.phoneNumber=:getPhoneNumber")
public class LoginEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String surname;
    @Column(unique = true)
    private String email;
    @Column(unique = true)
    private String phoneNumber;
    private String gender;
    private String username;
    private String password;
    private int loginAttempts;
    private boolean accountLocked;
}
