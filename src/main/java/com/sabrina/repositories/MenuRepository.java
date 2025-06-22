package com.sabrina.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sabrina.entities.Menu;

public interface MenuRepository extends JpaRepository<Menu,Long> {

}
