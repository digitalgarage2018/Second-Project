/*
 ============================================================================
 Name        : LoginController.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Controller per la gestione delle richieste di Login
 ============================================================================
 */

package com.project.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import com.project.model.User;
import com.project.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@Autowired
    private LoginService loginService;
    
	@RequestMapping(value="loginController", method = RequestMethod.POST)
	public ModelAndView userCheck(HttpServletRequest request) {
		
		/*
		 * recupero i parametri dalla view
		 */
		String username=request.getParameter("username"); //potrebbe contenere una mail
		String password=request.getParameter("password");

		/*
		 * tento l'autenticazione
		 */
		Optional<User> loggedUser = loginService.authenticateUser(username, password);
		
		/*
		 * ModelAndView incapsula la risposta della view
		 */
		ModelAndView model = new ModelAndView();
		if( loggedUser.isPresent() ) {			
			model.addObject("user", loggedUser.get());
			//caricato anche il wallet associato nel service authenticateUser
			model.addObject("wallet",loggedUser.get().getWallet());
			
	    	model.setViewName("initialSearch");
		}
		else {
			model.setViewName("error");
		}
		
    	return model;
	}
	
	
}
