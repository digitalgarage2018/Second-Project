package com.project.dao;

import java.math.BigInteger;
import java.util.concurrent.ExecutionException;

import org.web3j.exceptions.MessageDecodingException;

import com.project.model.LoginEntity;

public interface EthereumDao {

	public BigInteger getEth(String walletAddress) throws ExecutionException, InterruptedException, MessageDecodingException;
	public LoginEntity getLoginById(String username);
}
