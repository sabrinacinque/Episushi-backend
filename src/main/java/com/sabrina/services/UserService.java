package com.sabrina.services;

import org.springframework.stereotype.Service;

@Service
public class UserService {

    // Credenziali hardcoded per admin/staff cucina
    private static final String ADMIN_EMAIL = "admin@admin.com";
    private static final String ADMIN_PASSWORD = "admin";

    /**
     * Valida le credenziali dell'admin
     * @param email email inserita
     * @param password password inserita
     * @return true se credenziali corrette, false altrimenti
     */
    public boolean validateAdminCredentials(String email, String password) {
        if (email == null || password == null) {
            return false;
        }
        
        return ADMIN_EMAIL.equals(email.trim()) && ADMIN_PASSWORD.equals(password);
    }

    /**
     * Verifica se l'email è quella dell'admin
     * @param email email da verificare
     * @return true se è l'admin
     */
    public boolean isAdminEmail(String email) {
        return ADMIN_EMAIL.equals(email);
    }

    /**
     * Ottiene le info dell'admin (per future implementazioni)
     * @return oggetto con dati admin
     */
    public AdminInfo getAdminInfo() {
        return new AdminInfo(1L, "Admin", ADMIN_EMAIL);
    }

    // Classe per rappresentare le info admin
    public static class AdminInfo {
        private Long id;
        private String name;
        private String email;

        public AdminInfo(Long id, String name, String email) {
            this.id = id;
            this.name = name;
            this.email = email;
        }

        // Getters
        public Long getId() { return id; }
        public String getName() { return name; }
        public String getEmail() { return email; }

        // Setters
        public void setId(Long id) { this.id = id; }
        public void setName(String name) { this.name = name; }
        public void setEmail(String email) { this.email = email; }
    }
}