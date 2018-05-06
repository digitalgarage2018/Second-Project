/*
 ============================================================================
 Name        : LoginService.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Interfaccia di servizio per funzionalità di Login
 ============================================================================
 */

package com.project.service;

import java.util.Optional;

import com.project.model.User;

public interface LoginService {
	
	public boolean authenticateUser(User userBean);
	
	public Optional<User> authenticateUser(String username, String password);

}
