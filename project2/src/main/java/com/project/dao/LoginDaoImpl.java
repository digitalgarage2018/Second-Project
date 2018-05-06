package com.project.dao;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.CannotCreateTransactionException;
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

	 public String registerUser(LoginEntity signUpBean) throws PersistenceException,CannotCreateTransactionException{
		 String query = "insert into USERS (u_username,u_pword,u_email,u_name,u_surname,u_born_date,u_born_place) values (?,?,?,?,?,?,?);";
		 
		 entityManager.createNativeQuery(query).setParameter(1, signUpBean.getUsername())
		 		.setParameter(2, signUpBean.getPassword())
		 		.setParameter(3, signUpBean.getEmail())
		 		.setParameter(4, signUpBean.getName())
		 		.setParameter(5, signUpBean.getSurname())
		 		.setParameter(6, signUpBean.getBorn_date())
		 		.setParameter(7, signUpBean.getBorn_place())
		 		.executeUpdate();		 
		 
		 return "success";
	 }
	 
}
