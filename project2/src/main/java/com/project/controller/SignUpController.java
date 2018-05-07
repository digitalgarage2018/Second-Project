/*
 ============================================================================
 Name        : SignUpController.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Controller per la gestione delle richieste di registrazione
 ============================================================================
 */

package com.project.controller;


import javax.servlet.http.HttpServletRequest;

import com.project.service.SignUpService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUpController {

	@Autowired
    private SignUpService signUpService;
    
	@RequestMapping(value="signUpController", method = RequestMethod.POST)
	public ModelAndView userCheck(HttpServletRequest request) {
		
		/*
		 * recupero i parametri dalla view
		 */
		String username=request.getParameter("username"); 
		String email=request.getParameter("email"); 
		String password=request.getParameter("password");

		/*
		 * tento la creazione dell'user e del suo wallet
		 */
		boolean result = signUpService.createUser(username, email, password);
		
		/*
		 * ModelAndView incapsula la risposta della view
		 */
		ModelAndView model = new ModelAndView();
		if( result == true ) {
	    	
			// attributo per attivare un alert lato view... migliorabile
//			model.addObject("authenticated", true);
			request.setAttribute("authenticated", true);
			
			/*
			 * vorrei puntare a index ma sembra non essere possibile in quanto tale jsp
			 * è in una cartella superiore rispetto a WEB-INF, per cui non raggiungibile data la 
			 * attuale configurazione... faccio puntare alla jsp initialSearch 
			 * come se avessi effettuato un login con successo 
			 */
//			model.setViewName("indexController");
			model.setViewName("index");//in quanto è anche la pagina di default
		}
		else {
			model.setViewName("error");
		}
		
    	return model;
	}
	
	
}
