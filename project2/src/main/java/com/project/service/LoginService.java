package com.project.service;

import com.project.model.UserEntity;

import javax.mail.MessagingException;

public interface LoginService {
	

	public UserEntity authenticateUserByEmail(UserEntity userEntity) throws MessagingException;

	public UserEntity getUserByID(long id_user);

}

