package com.sabrina.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

// DTO per login request
public class LoginDTO {
    
    @NotBlank(message = "Email è obbligatoria")
    @Email(message = "Formato email non valido")
    private String email;
    
    @NotBlank(message = "Password è obbligatoria")
    private String password;
    
    // Constructors
    public LoginDTO() {}
    
    public LoginDTO(String email, String password) {
        this.email = email;
        this.password = password;
    }
    
    // Getters and Setters
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
}

