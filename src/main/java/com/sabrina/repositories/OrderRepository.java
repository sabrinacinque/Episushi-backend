package com.sabrina.repositories;

import com.sabrina.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    // Trova ordini per stato (evaso/non evaso)
    List<Order> findByEvaso(Boolean evaso);

    // Trova ordini ordinati per data (più recenti prima)
    List<Order> findAllByOrderByOrderDateDesc();
    
    List<Order> findByEvasoOrderByOrderDateDesc(Boolean evaso);


    // Conta ordini per stato
    long countByEvaso(Boolean evaso);

    // Calcola il totale delle vendite (somma di tutti i totalCost degli ordini evasi)
    @Query("SELECT COALESCE(SUM(o.totalCost), 0) FROM Order o WHERE o.evaso = true")
    BigDecimal calculateTotalSales();

    // Calcola il totale delle vendite per tutti gli ordini (evasi e non)
    @Query("SELECT COALESCE(SUM(o.totalCost), 0) FROM Order o")
    BigDecimal calculateAllOrdersTotal();

    // Trova gli ultimi N ordini
    @Query("SELECT o FROM Order o ORDER BY o.orderDate DESC LIMIT :limit")
    List<Order> findTopNByOrderByOrderDateDesc(int limit);

    // Trova ordini per range di date
    @Query("SELECT o FROM Order o WHERE o.orderDate BETWEEN :startDate AND :endDate ORDER BY o.orderDate DESC")
    List<Order> findOrdersByDateRange(java.time.LocalDateTime startDate, java.time.LocalDateTime endDate);

    // Trova ordini che contengono un determinato menu item
    @Query("SELECT DISTINCT o FROM Order o JOIN o.items oi WHERE oi.menu.id = :menuId")
    List<Order> findOrdersContainingMenuItem(Long menuId);
}