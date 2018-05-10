
package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.UserEntity;
import com.project.service.LoginService;
import com.project.service.StudentService;


@Controller
public class StudentController
{
    @Autowired
    private StudentService studentService;

    @Autowired
    private LoginService loginService;
    
    
    @RequestMapping(value="/studyPlan", method = RequestMethod.POST)
    public ModelAndView studyPlan( HttpServletRequest request )
    {
        long user_id = (Long) request.getSession().getAttribute( "user_id" );
        String[] exams  = request.getParameterValues( "exam" );
        
        studentService.insertStudyPlan( user_id, exams );
        
        ModelAndView model = new ModelAndView();
        model.setViewName( "student/homeStudent" );
        
        return model;
    }
    
    @RequestMapping(value="/viewBooklet", method = RequestMethod.POST)
    public ModelAndView viewBooklet( HttpServletRequest request )
    {
        long userId = (Long) request.getSession().getAttribute( "user_id" );
        UserEntity user = loginService.getUserByID( userId );
        request.setAttribute( "exams", new JSONArray( user.getExam_list()) );
        
        ModelAndView model = new ModelAndView();
        model.setViewName( "student/universityBooklet" );
        
        return model;
    }
}