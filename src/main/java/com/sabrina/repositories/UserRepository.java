package com.sabrina.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sabrina.entities.User;

public interface UserRepository extends JpaRepository<User,Long> {

}
