package com.sabrina.dto;

import java.util.List;

public class CreateOrderDTO {
    private List<OrderItemDTO> items;
    
    public CreateOrderDTO() {}
    
    public List<OrderItemDTO> getItems() {
        return items;
    }
    
    public void setItems(List<OrderItemDTO> items) {
        this.items = items;
    }
    
    public static class OrderItemDTO {
        private Long menuId;
        private Integer quantity;
        
        public OrderItemDTO() {}
        
        public Long getMenuId() {
            return menuId;
        }
        
        public void setMenuId(Long menuId) {
            this.menuId = menuId;
        }
        
        public Integer getQuantity() {
            return quantity;
        }
        
        public void setQuantity(Integer quantity) {
            this.quantity = quantity;
        }
    }
}