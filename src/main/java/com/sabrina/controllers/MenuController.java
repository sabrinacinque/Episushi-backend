package com.sabrina.controllers;

import com.sabrina.entities.Menu;
import com.sabrina.services.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/menu")
@CrossOrigin(origins = "http://localhost:4200")
public class MenuController {
    
    @Autowired
    private MenuService menuService;
    
    // GET /api/menu - Ottieni tutti gli elementi del menu
    // Equivale al getAll() del tuo Angular
    @GetMapping
    public ResponseEntity<List<Menu>> getAllMenu() {
        List<Menu> menuItems = menuService.getAll();
        return ResponseEntity.ok(menuItems);
    }
    
    // GET /api/menu/{id} - Ottieni un elemento per ID
    // Equivale al getById() del tuo Angular
    @GetMapping("/{id}")
    public ResponseEntity<Menu> getMenuById(@PathVariable Long id) {
        Optional<Menu> menuItem = menuService.getById(id);
        
        if (menuItem.isPresent()) {
            return ResponseEntity.ok(menuItem.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    
    // POST /api/menu - Crea un nuovo elemento del menu
    // Equivale al create() del tuo Angular
    @PostMapping
    public ResponseEntity<Menu> createMenu(@RequestBody Menu menu) {
        try {
            Menu createdMenu = menuService.create(menu);
            return ResponseEntity.status(HttpStatus.CREATED).body(createdMenu);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    // PUT /api/menu/{id} - Aggiorna un elemento esistente
    // Equivale al update() del tuo Angular
    @PutMapping("/{id}")
    public ResponseEntity<Menu> updateMenu(@PathVariable Long id, @RequestBody Menu menu) {
        try {
            menu.setId(id); // Assicurati che l'ID sia quello del path
            Menu updatedMenu = menuService.update(menu);
            return ResponseEntity.ok(updatedMenu);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    // DELETE /api/menu/{id} - Elimina un elemento
    // Equivale al delete() del tuo Angular
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMenu(@PathVariable Long id) {
        try {
            menuService.delete(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
    
    // GET /api/menu/count - Conta tutti gli elementi
    @GetMapping("/count")
    public ResponseEntity<Long> getMenuCount() {
        long count = menuService.count();
        return ResponseEntity.ok(count);
    }
    
    // GET /api/menu/exists/{id} - Verifica se un elemento esiste
    @GetMapping("/exists/{id}")
    public ResponseEntity<Boolean> menuExists(@PathVariable Long id) {
        boolean exists = menuService.existsById(id);
        return ResponseEntity.ok(exists);
    }
}