/*
 ============================================================================
 Name        : SpecsController.java
 Author      : Alessio Onori
 Version     : 1.0
 Copyright   : Your copyright notice
 Description : Controller per la creazione di una pagina dinamica della specifica casa
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
public class SpecsController {

    
	@RequestMapping(value="specsController", method = RequestMethod.GET)
	public ModelAndView userCheck(HttpServletRequest request) {
		
		/*
		 * recupero i parametri dalla view
		 */
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String price = request.getParameter("price");
		String area = request.getParameter("area");

		System.out.println("ricevuto il parametro nome: "+name);
		
		/*
		 * ModelAndView incapsula la risposta della view
		 */
		ModelAndView model = new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("type", type);
		model.addObject("price", price);
		model.addObject("area", area);
		
		model.setViewName("houseSpecific");
		
    	return model;
	}
	
	
}
