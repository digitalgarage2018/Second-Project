package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;
import com.project.service.ExamService;
import com.project.service.LoginService;

import org.json.JSONArray;
import org.json.JSONObject;
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

		if (user != null) {
		    request.getSession().setAttribute( "user_id", user.getId_user() );

			if (user.getType().equals( UserEntity.STUDENT )) {
				model.addObject( "user", user  );
			    if (user.getExam_list().isEmpty()) {
			        List<ExamEntity> exams = examService.getAllExams();
	                model.addObject( "exams", new JSONArray( exams ) );
			        model.setViewName( "student/studyPlan" );
                } else { // STUDENT_COMPLETE.
                    model.setViewName( "student/homeStudent" );
                }
			} else {
				model.addObject( "user", new JSONObject( user ) );
			    model.setViewName( "professor/welcomeDocente" );
			}
		} else {
			model.setViewName( "error" );
		}
		
    	return model;

	}
}
