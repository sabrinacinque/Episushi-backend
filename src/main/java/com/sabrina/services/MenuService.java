package com.sabrina.services;

import com.sabrina.entities.Menu;
import com.sabrina.repositories.MenuRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MenuService {
    
    @Autowired
    private MenuRepository menuRepository;
    
    // Metodo per ottenere tutti gli elementi del menu
    // Equivale al getAll() del tuo Angular
    public List<Menu> getAll() {
        return menuRepository.findAll();
    }
    
    // Metodo per ottenere un elemento per ID
    // Equivale al getById() del tuo Angular
    public Optional<Menu> getById(Long id) {
        return menuRepository.findById(id);
    }
    
    // Metodo per creare un nuovo elemento del menu
    // Equivale al create() del tuo Angular
    public Menu create(Menu menu) {
        return menuRepository.save(menu);
    }
    
    // Metodo per aggiornare un elemento esistente
    // Equivale al update() del tuo Angular
    public Menu update(Menu menu) {
        // Prima verifica che l'elemento esista
        if (menu.getId() != null && menuRepository.existsById(menu.getId())) {
            return menuRepository.save(menu);
        } else {
            throw new RuntimeException("Menu item not found with id: " + menu.getId());
        }
    }
    
    // Metodo per eliminare un elemento
    // Equivale al delete() del tuo Angular
    public void delete(Long id) {
        if (menuRepository.existsById(id)) {
            menuRepository.deleteById(id);
        } else {
            throw new RuntimeException("Menu item not found with id: " + id);
        }
    }
    
    // Metodo per verificare se un elemento esiste
    public boolean existsById(Long id) {
        return menuRepository.existsById(id);
    }
    
    // Metodo per contare tutti gli elementi
    public long count() {
        return menuRepository.count();
    }
}