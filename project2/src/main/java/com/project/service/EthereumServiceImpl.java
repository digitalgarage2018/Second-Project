package com.project.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.web3j.exceptions.MessageDecodingException;
import org.web3j.utils.Convert;

import com.project.dao.EthereumDaoImpl;
import com.project.model.LoginEntity;


@Service
public class EthereumServiceImpl implements EthereumService {
	@Autowired
    private EthereumDaoImpl ethereumDao;
	
		public BigDecimal getEthValue(String walletAddress) {
			 BigInteger wei = null;
			 BigDecimal wei2= null;
 
			 try{
				 wei = ethereumDao.getEth(walletAddress);
				 wei2= Convert.fromWei(wei.toString(), Convert.Unit.ETHER);
				 
			 } 
			 catch (InterruptedException e){
				 System.out.println("errore interr: "+e);
			 } catch (ExecutionException e){
				 System.out.println("errore exec: "+e);
			 } catch (MessageDecodingException e){
				 System.out.println("errore exec: "+e);
			 }
			 /*catch (InterruptedException|ExecutionException e) {
	         e.printStackTrace();
	  			} */ 
			 finally {
		    	 
		     }
			return wei2;		 
		 }
		
	public String getWalletAddress(String userId){
		
		LoginEntity user = ethereumDao.getLoginById(userId);
		String walletAddress = user.getWalletAddress();
		return walletAddress;
		
	}
}
