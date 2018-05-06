/*
 ============================================================================
 Name        : UserDao.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Interfaccia Dao per il bean User
 ============================================================================
 */

package com.project.dao;

import java.util.Optional;

import com.project.model.User;

public interface UserDao {
	
	public Optional<User> getUserById(int id);

	public Optional<User> getUserByUsername(String username);

	public Optional<User> getUserByEmail(String email);
	
	public boolean createUser(String username, String email, String password);
	
}
