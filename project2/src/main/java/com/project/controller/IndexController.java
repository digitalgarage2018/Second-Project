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

@Controller
public class IndexController {

    
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView userCheck(HttpServletRequest request) {
		
		/*
		 * recupero i parametri dalla view
		 */


		/*
		 * ModelAndView incapsula la risposta della view
		 */
		ModelAndView model = new ModelAndView();
		
		System.out.println("sei passato da IndexController");//debug
		
		model.setViewName("index");
		
    	return model;
	}
	
	
}
