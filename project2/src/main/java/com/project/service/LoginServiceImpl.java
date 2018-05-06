package com.project.service;

import javax.persistence.PersistenceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.CannotCreateTransactionException;

import com.project.dao.LoginDao;
import com.project.model.LoginEntity;


@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDao loginDao;
	
	 public String authenticateUser(LoginEntity loginEntity){
		 try{
			 LoginEntity login = loginDao.getLoginById(loginEntity.getUsername());
		 
		 if(login!=null){
			 if(login.getPassword().equals(loginEntity.getPassword()) && login.getUsername().equals(loginEntity.getUsername())){
				 return "success";
			 }
		 }
		 }catch (Exception e){
			 System.out.println("Connection failed!!\n" + e);
			 return "errorDB";
		 }
		 finally{
			 
		 }
		 return "failure";
	 }

	 public String registrationUserService(LoginEntity signUpBean) {
		 
		 try{
			String result = loginDao.registerUser(signUpBean);
			if (result.equals("success")){
				return "success";
			}
		 }catch (PersistenceException e){
			 System.out.println("Connection failed!!\n" + e);
			 return "errorSQL";
		 }catch (CannotCreateTransactionException e){
			 System.out.println("Connection failed!!\n" + e);
			 return "errorDB";
		 }finally{
			 
		 }
		return "failure";			
		}
}
