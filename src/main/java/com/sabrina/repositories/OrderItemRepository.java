package com.sabrina.repositories;

import com.sabrina.entities.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

    // Trova tutti gli OrderItem di un ordine specifico
    List<OrderItem> findByOrderId(Long orderId);

    // Trova tutti gli OrderItem che contengono un menu specifico
    List<OrderItem> findByMenuId(Long menuId);

    // Conta quante volte un menu item è stato ordinato
    @Query("SELECT COALESCE(SUM(oi.quantity), 0) FROM OrderItem oi WHERE oi.menu.id = :menuId")
    Long countTotalQuantityByMenuId(Long menuId);

    // Trova i menu item più ordinati
    @Query("SELECT oi.menu.id, oi.menu.titolo, SUM(oi.quantity) as totalQuantity " +
           "FROM OrderItem oi " +
           "GROUP BY oi.menu.id, oi.menu.titolo " +
           "ORDER BY totalQuantity DESC")
    List<Object[]> findMostOrderedMenuItems();
}