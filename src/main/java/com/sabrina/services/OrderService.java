package com.sabrina.services;

import com.sabrina.entities.Order;
import com.sabrina.entities.OrderItem;
import com.sabrina.entities.Menu;
import com.sabrina.repositories.OrderRepository;
import com.sabrina.repositories.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private MenuRepository menuRepository;

    public List<Order> getAllOrders() {
        return orderRepository.findAllByOrderByOrderDateDesc();  // ← Nuovo
    }

    public List<Order> getOrdersByStatus(Boolean evaso) {
        return orderRepository.findByEvasoOrderByOrderDateDesc(evaso);  // ← Nuovo
    }

    // Ottieni ordine per ID
    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    
    // Crea nuovo ordine
    @Transactional
    public Order createOrder(List<com.sabrina.dto.CreateOrderDTO.OrderItemDTO> itemDTOs) {
        Order order = new Order();
        BigDecimal totalCost = BigDecimal.ZERO;

        // Aggiungi ogni item all'ordine e calcola il totale
        for (com.sabrina.dto.CreateOrderDTO.OrderItemDTO itemDTO : itemDTOs) {
            // Verifica che il menu item esista
            Optional<Menu> menuItem = menuRepository.findById(itemDTO.getMenuId());
            if (menuItem.isPresent()) {
                OrderItem orderItem = new OrderItem(menuItem.get(), itemDTO.getQuantity());
                order.addItem(orderItem);
                
                // Calcola il costo per questo item (prezzo * quantità)
                BigDecimal itemCost = menuItem.get().getPrezzo()
                    .multiply(BigDecimal.valueOf(itemDTO.getQuantity()));
                totalCost = totalCost.add(itemCost);
            } else {
                throw new RuntimeException("Menu item not found with id: " + itemDTO.getMenuId());
            }
        }

        order.setTotalCost(totalCost);
        order.setOrderDate(LocalDateTime.now());
        order.setEvaso(false);

        return orderRepository.save(order);
    }

    // DTO per creare un ordine
    public static class CreateOrderItemDTO {
        private Long menuId;
        private Integer quantity;

        public CreateOrderItemDTO() {}

        public CreateOrderItemDTO(Long menuId, Integer quantity) {
            this.menuId = menuId;
            this.quantity = quantity;
        }

        public Long getMenuId() { return menuId; }
        public void setMenuId(Long menuId) { this.menuId = menuId; }
        public Integer getQuantity() { return quantity; }
        public void setQuantity(Integer quantity) { this.quantity = quantity; }
    }

    // Aggiorna stato ordine (evaso/non evaso)
    @Transactional
    public Order updateOrderStatus(Long orderId, Boolean evaso) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setEvaso(evaso);
            return orderRepository.save(order);
        } else {
            throw new RuntimeException("Order not found with id: " + orderId);
        }
    }

    // Elimina ordine
    @Transactional
    public void deleteOrder(Long id) {
        if (orderRepository.existsById(id)) {
            orderRepository.deleteById(id);
        } else {
            throw new RuntimeException("Order not found with id: " + id);
        }
    }

    // Ottieni ordini ordinati per data (più recenti prima)
    public List<Order> getOrdersByDateDesc() {
        return orderRepository.findAllByOrderByOrderDateDesc();
    }

    // Calcola totale vendite
    public BigDecimal getTotalSales() {
        return orderRepository.calculateTotalSales();
    }

    // Conta ordini per stato
    public long countOrdersByStatus(Boolean evaso) {
        return orderRepository.countByEvaso(evaso);
    }
}