package com.sabrina.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.math.BigDecimal;

@Entity
@Table(name = "order_items")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id")
    @JsonIgnore // Evita loop infinito nella serializzazione JSON
    private Order order;

    @ManyToOne(fetch = FetchType.EAGER) // EAGER per caricare sempre i dettagli del menu
    @JoinColumn(name = "menu_id")
    private Menu menu;

    @NotNull
    @Positive
    @Column(nullable = false)
    private Integer quantity;

    // Aggiungi questi campi per memorizzare i dettagli del menu al momento dell'ordine
    @Column(nullable = false)
    private String titolo;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal prezzo;

    // Constructors
    public OrderItem() {}

    public OrderItem(Menu menu, Integer quantity) {
        this.menu = menu;
        this.quantity = quantity;
        // Copia i dettagli del menu al momento della creazione
        if (menu != null) {
            this.titolo = menu.getTitolo();
            this.prezzo = menu.getPrezzo();
        }
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
        // Aggiorna i dettagli quando viene impostato il menu
        if (menu != null) {
            this.titolo = menu.getTitolo();
            this.prezzo = menu.getPrezzo();
        }
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public BigDecimal getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(BigDecimal prezzo) {
        this.prezzo = prezzo;
    }

    // Metodo helper per calcolare il subtotale
    public BigDecimal getSubtotal() {
        return prezzo != null ? prezzo.multiply(BigDecimal.valueOf(quantity)) : BigDecimal.ZERO;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", titolo='" + titolo + '\'' +
                ", quantity=" + quantity +
                ", prezzo=" + prezzo +
                '}';
    }
}