package com.project.controller;


import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.EthereumServiceImpl;

@Controller
public class EthereumController{

	BigDecimal wei;
	@Autowired
    private EthereumServiceImpl ethereumService;
	

	@RequestMapping(value="ethereumController")
    protected ModelAndView checkEthValue(HttpServletRequest request) {

		HttpSession session=request.getSession();
    	String userId= (String) session.getAttribute("user");
    	String walletAddress = ethereumService.getWalletAddress(userId);
	
		wei = ethereumService.getEthValue(walletAddress);
        System.out.println(wei);
        
        ModelAndView model = new ModelAndView();
        request.setAttribute("wei", wei); // Will be available as ${wei} in JSP
        request.setAttribute("walletAddress", walletAddress);
        model.setViewName("Wallet");
        return model;
    }

}

