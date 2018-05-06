/*
 ============================================================================
 Name        : WalletDao.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Interfaccia Dao per il bean Wallet
 ============================================================================
 */

package com.project.dao;

import java.util.Optional;

import com.project.model.Wallet;

public interface WalletDao {

	public Optional<Wallet> getWalletById(int id);

	public Optional<Wallet> getWalletByIdUser(int idUser);
	
	/*
	 * ogni wallet è specifico di un solo utente
	 * ==> idUser
	 */
	public boolean createWallet(int idUser);


}
