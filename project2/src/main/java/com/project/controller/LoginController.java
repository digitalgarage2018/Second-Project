package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import com.project.model.LoginEntity;
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
		String name=request.getParameter("username");
		String pwd=request.getParameter("password");

		LoginEntity loginBean = new LoginEntity();
		loginBean.setUsername(name);
		loginBean.setPassword(pwd);
		 
		
		boolean result = loginService.authenticateUser(loginBean);
		
		ModelAndView model = new ModelAndView();
		
		if (result){
			model.addObject("user", loginBean);
	    	//model.setViewName("success");
	    	model.setViewName("initialSearch");
			
		}else{
			model.setViewName("error");
		}
		
    	return model;

	}
}
