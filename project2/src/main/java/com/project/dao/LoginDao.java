package com.project.dao;

import com.project.model.LoginEntity;

public interface LoginDao {
	//public boolean authenticateUser(LoginEntity loginBean);
	public LoginEntity getLoginById(String username);
}
