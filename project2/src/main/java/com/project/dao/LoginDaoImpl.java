package com.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.model.LoginEntity;

@Repository
@Transactional
public class LoginDaoImpl implements LoginDao {

	@PersistenceContext
	 public EntityManager entityManager;
	
	 public LoginEntity getLoginById(String username) {
		return entityManager.find(LoginEntity.class, username);
	 }

/*		 public boolean authenticateUser(LoginEntity loginBean)
		 {
		 
			 String userName = loginBean.getUsername(); //Keeping user entered values in temporary variables.
			String password = loginBean.getPassword();
			
			//insert database access
			
			if(userName.equals("admin") && password.equals("password"))
			   {
			      return true; ////If the user entered values are already present in database, which means user has already registered so I will return SUCCESS message.
			   }else{
				   return false;
			   }
		 }
*/
}
