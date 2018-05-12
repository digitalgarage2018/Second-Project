package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.LoginDao;
import com.project.model.UserEntity;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao loginDao;

	@Override
	public UserEntity getUserByID(long id_user) {
		return loginDao.getLoginByID(id_user);
	}
	
	@Override
	public UserEntity authenticateUserByEmail(UserEntity userEntity)
	{
	    UserEntity user = loginDao.getLoginByIstitutionalEmail(userEntity.getIstitutional_email());
		if (user != null) {
		    if (user.getPassword().equals(userEntity.getPassword()) &&
			    user.getIstitutional_email().equals(userEntity.getIstitutional_email())){
			    return user;
			}
		}
		return null;
	}
}