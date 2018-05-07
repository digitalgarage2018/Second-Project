/*
 ============================================================================
 Name        : IndexController.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Controller per il reindirizzamento alle views
 ============================================================================
 */

package com.project.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.project.model.User;

@Controller
public class IndexController {

    
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView userCheck(HttpServletRequest request) {
		
		/*
		 * recupero i parametri dalla view:
		 * 1) controllo se è presente la sessione utente
		 */
		
		


		/*
		 * ModelAndView incapsula la risposta della view
		 */
		ModelAndView model = new ModelAndView();
		
		System.out.println("sei passato da IndexController");//debug
		
		if( request.getSession().getAttribute("loggedUser") != null ) {
			model.setViewName("initialSearch");
		}
		else {
			model.setViewName("index");
		}
		
		
		
    	return model;
	}
	
	
}
