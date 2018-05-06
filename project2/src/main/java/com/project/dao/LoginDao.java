package com.project.dao;

import javax.persistence.PersistenceException;

import org.springframework.transaction.CannotCreateTransactionException;

import com.project.model.LoginEntity;

public interface LoginDao {
	//public boolean authenticateUser(LoginEntity loginBean);
	public LoginEntity getLoginById(String username);
	public String registerUser(LoginEntity signUpBean)throws PersistenceException,CannotCreateTransactionException;
}
