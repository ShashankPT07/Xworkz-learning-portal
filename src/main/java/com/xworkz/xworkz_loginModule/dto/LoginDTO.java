package com.xworkz.xworkz_loginModule.dto;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginDTO {

    private int id;
    @NotNull
    @Pattern(regexp = "^[A-Z][a-zA-Z]*(\\s[A-Z][a-zA-Z]*)*$", message = "enter valid name")
    private String name;
    @NotNull
    private String surname;
    @NotNull
    @Pattern(regexp = "^[a-zA-Z0-9._]+@gmail\\.com$",message ="Must end with @gmail.com")
    private String email;
    @NotNull
    @Pattern(regexp = "^[6-9][0-9]{9}$", message = "Invalid phone number")
    private String phoneNumber;
    private String gender;
    @NotNull
    private String username;
    @NotNull
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[@$!%*#?&]).{8,}$",
            message = "Weak password"
    )
    private String password;
    @NotNull
    private String confirmPassword;

}
