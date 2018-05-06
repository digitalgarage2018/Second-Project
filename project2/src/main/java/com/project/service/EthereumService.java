package com.project.service;

import java.math.BigDecimal;

public interface EthereumService {
	public BigDecimal getEthValue(String walletAddress);
	public String getWalletAddress(String userId);
}
