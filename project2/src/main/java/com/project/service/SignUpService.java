/*
 ============================================================================
 Name        : SignUpService.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Interfaccia di servizio per funzionalitą di SignUp
 ============================================================================
 */

package com.project.service;


public interface SignUpService {
	
	public boolean createUser(String username, String email, String password);

}
