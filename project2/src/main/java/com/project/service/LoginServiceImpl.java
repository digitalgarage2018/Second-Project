/*
 ============================================================================
 Name        : LoginServiceImpl.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Implementazione dell'interfaccia 
 ============================================================================
 */

package com.project.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project.dao.UserDao;
import com.project.dao.WalletDao;
import com.project.model.User;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	WalletDao walletDao;
	
	
	/*
	 * non utilizzato al momento
	 */
	 public boolean authenticateUser(User user){
		 
		 /*
		  * primissima versione... non tiene neanche conto della mail
		  */
		 Optional<User> registeredUser = userDao.getUserByUsername(user.getUsername());
		 if(registeredUser.isPresent()){
			 if(registeredUser.get().getPassword().equals(user.getPassword()) && registeredUser.get().getUsername().equals(user.getUsername())){
				 return true;
			 }
		 }
		 
		 return false;
	 }

	 
	 
	public Optional<User> authenticateUser(String username, String password) {
		/*
		 * Username può contenere una password oppure una username, entrambi 
		 * contemplati ai fini del login
		 */
		
		Optional<User> result = Optional.empty();
		
		result = userDao.getUserByUsername(username);
		
		if(!result.isPresent())
			result = userDao.getUserByEmail(username);
		
		if( result.isPresent() ){
			 if( !(result.get().getPassword().equals(password) && ( result.get().getUsername().equals(username) || result.get().getEmail().equals(username) )) ){
				 /*
				  * utente senza privilegi!
				  */
				 result = Optional.empty();
			 }
			 else {
				 /*
				  * allaccio anche il wallet ad esso associato:
				  * per ora non gestisco una possibile casistica di errore
				  * ma sarebbe da fare!
				  */
				 result.get().setWallet( walletDao.getWalletByIdUser(result.get().getId()).get() );
			 }//else wallet
		 }
		
		return result;
	}



}
