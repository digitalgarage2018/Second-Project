package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;
import com.project.service.ExamService;
import com.project.service.LoginService;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController{

	@Autowired
    private LoginService loginService;

	@Autowired
	private UserEntity userEntity;

	@Autowired
	private ExamService examService;


	@RequestMapping(value="/loginController", method = RequestMethod.POST)
	public ModelAndView userCheck(HttpServletRequest request) {
		String email = request.getParameter("username");
		String pwd = request.getParameter("password");


		userEntity.setIstitutional_email(email);
		userEntity.setPassword(pwd);

		UserEntity user = loginService.authenticateUserByEmail(userEntity);

		for ( ExamEntity corsoStudio : user.getExam_list() ) {
			System.out.println( corsoStudio.getName() );
		}

		ModelAndView model = new ModelAndView();

		if (!user.equals(null) && user.getType().equals("D")){
			//user.setExam_list(examService.getUserExams(user));
			model.addObject("examsPlan", new JSONArray( user.getExam_list()));
			model.addObject("professor", user);
			request.getSession().setAttribute("professor", user);
			model.setViewName("professorWelcome");

			
		}else{

			model.setViewName("studentWelcome");

		}
		
    	return model;

	}
}
