package com.sabrina.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.math.BigDecimal;

@Entity
@Table(name = "menu")
public class Menu {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotBlank
    @Column(nullable = false)
    private String titolo;
    
    @NotBlank
    @Column(nullable = false, length = 500)
    private String ingredienti;
    
    @Column(name = "img")
    private String img;
    
    @NotBlank
    @Column(nullable = false)
    private String categoria;
    
    @NotNull
    @Positive
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal prezzo;
    
    @Column(nullable = false)
    private Boolean disponibile = true;
    
    // Constructors
    public Menu() {}
    
    public Menu(String titolo, String ingredienti, String img, String categoria, 
                BigDecimal prezzo, Boolean disponibile) {
        this.titolo = titolo;
        this.ingredienti = ingredienti;
        this.img = img;
        this.categoria = categoria;
        this.prezzo = prezzo;
        this.disponibile = disponibile;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getTitolo() {
        return titolo;
    }
    
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }
    
    public String getIngredienti() {
        return ingredienti;
    }
    
    public void setIngredienti(String ingredienti) {
        this.ingredienti = ingredienti;
    }
    
    public String getImg() {
        return img;
    }
    
    public void setImg(String img) {
        this.img = img;
    }
    
    public String getCategoria() {
        return categoria;
    }
    
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    public BigDecimal getPrezzo() {
        return prezzo;
    }
    
    public void setPrezzo(BigDecimal prezzo) {
        this.prezzo = prezzo;
    }
    
    public Boolean getDisponibile() {
        return disponibile;
    }
    
    public void setDisponibile(Boolean disponibile) {
        this.disponibile = disponibile;
    }
}