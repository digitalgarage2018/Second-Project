package com.project.controller;


import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.EthereumService;
import com.project.service.EthereumServiceImpl;

import org.springframework.stereotype.Controller;

@Controller
public class EthereumController{

	BigDecimal wei;
	@Autowired
    private EthereumServiceImpl ethereumService;
	

	@RequestMapping(value="ethereumController")
    protected ModelAndView checkEthValue(HttpServletRequest request) {

        	wei = ethereumService.getEthValue();
            System.out.println(wei);

            ModelAndView model = new ModelAndView();
            request.setAttribute("wei", wei); // Will be available as ${wei} in JSP
            model.setViewName("Wallet");
            return model;
    }

}

