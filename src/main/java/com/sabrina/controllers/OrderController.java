package com.sabrina.controllers;

import com.sabrina.entities.Order;
import com.sabrina.entities.OrderItem;
import com.sabrina.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin(origins = "http://localhost:4200") // Per Angular dev server
public class OrderController {

    @Autowired
    private OrderService orderService;

    // GET /api/orders - Ottieni tutti gli ordini
    @GetMapping
    public ResponseEntity<List<Order>> getAllOrders() {
        try {
            List<Order> orders = orderService.getAllOrders();
            return ResponseEntity.ok(orders);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // GET /api/orders/{id} - Ottieni ordine per ID
    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrderById(@PathVariable Long id) {
        try {
            Optional<Order> order = orderService.getOrderById(id);
            return order.map(ResponseEntity::ok)
                       .orElse(ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // GET /api/orders/status/{evaso} - Ottieni ordini per stato
    @GetMapping("/status/{evaso}")
    public ResponseEntity<List<Order>> getOrdersByStatus(@PathVariable Boolean evaso) {
        try {
            List<Order> orders = orderService.getOrdersByStatus(evaso);
            return ResponseEntity.ok(orders);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // GET /api/orders/pending - Ottieni ordini non evasi (scorciatoia)
    @GetMapping("/pending")
    public ResponseEntity<List<Order>> getPendingOrders() {
        return getOrdersByStatus(false);
    }

    // GET /api/orders/completed - Ottieni ordini evasi (scorciatoia)
    @GetMapping("/completed")
    public ResponseEntity<List<Order>> getCompletedOrders() {
        return getOrdersByStatus(true);
    }

    // GET /api/orders/recent - Ottieni ordini ordinati per data
    @GetMapping("/recent")
    public ResponseEntity<List<Order>> getRecentOrders() {
        try {
            List<Order> orders = orderService.getOrdersByDateDesc();
            return ResponseEntity.ok(orders);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // POST /api/orders - Crea nuovo ordine
    @PostMapping
    public ResponseEntity<Order> createOrder(@RequestBody com.sabrina.dto.CreateOrderDTO request) {
        try {
            Order order = orderService.createOrder(request.getItems());
            return ResponseEntity.status(HttpStatus.CREATED).body(order);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // PUT /api/orders/{id}/status - Aggiorna stato ordine
    @PutMapping("/{id}/status")
    public ResponseEntity<Order> updateOrderStatus(@PathVariable Long id, @RequestBody UpdateStatusRequest request) {
        try {
            Order updatedOrder = orderService.updateOrderStatus(id, request.getEvaso());
            return ResponseEntity.ok(updatedOrder);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // PUT /api/orders/{id}/complete - Marca ordine come evaso (scorciatoia)
    @PutMapping("/{id}/complete")
    public ResponseEntity<Order> completeOrder(@PathVariable Long id) {
        return updateOrderStatus(id, new UpdateStatusRequest(true));
    }

    // DELETE /api/orders/{id} - Elimina ordine
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable Long id) {
        try {
            orderService.deleteOrder(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // GET /api/orders/stats/total-sales - Statistiche vendite totali
    @GetMapping("/stats/total-sales")
    public ResponseEntity<BigDecimal> getTotalSales() {
        try {
            BigDecimal totalSales = orderService.getTotalSales();
            return ResponseEntity.ok(totalSales);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // GET /api/orders/stats/count/{evaso} - Conta ordini per stato
    @GetMapping("/stats/count/{evaso}")
    public ResponseEntity<Long> getOrderCountByStatus(@PathVariable Boolean evaso) {
        try {
            long count = orderService.countOrdersByStatus(evaso);
            return ResponseEntity.ok(count);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // DTO Classes
    public static class CreateOrderRequest {
        private List<OrderItem> items;

        public CreateOrderRequest() {}

        public List<OrderItem> getItems() {
            return items;
        }

        public void setItems(List<OrderItem> items) {
            this.items = items;
        }
    }

    public static class UpdateStatusRequest {
        private Boolean evaso;

        public UpdateStatusRequest() {}

        public UpdateStatusRequest(Boolean evaso) {
            this.evaso = evaso;
        }

        public Boolean getEvaso() {
            return evaso;
        }

        public void setEvaso(Boolean evaso) {
            this.evaso = evaso;
        }
    }
}