package com.project.service;

import com.project.model.LoginEntity;

public interface LoginService {
	
	public boolean authenticateUser(LoginEntity loginBean);

}
