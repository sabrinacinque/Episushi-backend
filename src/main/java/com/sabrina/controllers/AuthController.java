package com.sabrina.controllers;

import com.sabrina.dto.LoginDTO;
import com.sabrina.dto.UserResponseDTO;
import com.sabrina.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:4200")
public class AuthController {

    @Autowired
    private UserService userService;

    // Login solo per admin/staff cucina
    @PostMapping("/login")
    public ResponseEntity<?> loginAdmin(@Valid @RequestBody LoginDTO loginDTO) {
        try {
            boolean isValidAdmin = userService.validateAdminCredentials(
                loginDTO.getEmail(), 
                loginDTO.getPassword()
            );
            
            if (isValidAdmin) {
                UserResponseDTO response = new UserResponseDTO(
                    1L, // ID fisso admin
                    "Admin",
                    "admin@admin.com"
                );
                return ResponseEntity.ok(response);
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(new ErrorResponse("Credenziali non valide"));
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new ErrorResponse("Errore durante il login"));
        }
    }

    // Endpoint per verificare se l'utente è ancora autenticato (per JWT futuro)
    @GetMapping("/verify")
    public ResponseEntity<?> verifyAuth() {
        // Per ora ritorna sempre OK, poi implementeremo con JWT
        UserResponseDTO response = new UserResponseDTO(
            1L,
            "Admin", 
            "admin@admin.com"
        );
        return ResponseEntity.ok(response);
    }

    // Classe interna per risposte di errore
    public static class ErrorResponse {
        private String message;
        
        public ErrorResponse(String message) {
            this.message = message;
        }
        
        public String getMessage() {
            return message;
        }
        
        public void setMessage(String message) {
            this.message = message;
        }
    }
}