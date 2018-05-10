package com.project.service;

import com.project.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.LoginDao;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDao loginDao;

	public UserEntity getUserByID(long id_user)
	{
		return loginDao.getLoginByID(id_user);
	}

	 public UserEntity authenticateUserByEmail(UserEntity userEntity){
		 UserEntity user = loginDao.getLoginByIstitutionalEmail(userEntity.getIstitutional_email());
		 if(user != null){
			 if(user.getPassword().equals(userEntity.getPassword()) &&
					 user.getIstitutional_email().equals(userEntity.getIstitutional_email())){
			 	return user;
			 }
		 }
		 return new UserEntity();

	 }

}
