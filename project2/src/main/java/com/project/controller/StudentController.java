
package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import com.project.model.ExamEntity;
import com.project.service.ExamService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.UserEntity;
import com.project.service.LoginService;
import com.project.service.StudentService;

import java.util.List;


@RestController
public class StudentController
{
    @Autowired
    private StudentService studentService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private ExamService examService;
    
    
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

    @RequestMapping(value="/bookSession", method = RequestMethod.POST)
    public ModelAndView bookSession(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        long userId = (Long) request.getSession().getAttribute( "user_id" );

        UserEntity user = loginService.getUserByID( userId );

        List<ExamEntity> exams = examService.getAllExamsById(user);
        request.setAttribute( "exams", new JSONArray( exams ));

        model.setViewName("student/bookingSession");

        return model;
    }

    @RequestMapping(value="/insertBookedSession", method = RequestMethod.POST)
    public ModelAndView insertBookedSession(HttpServletRequest request, @RequestParam("id_session") String id_session,
                                            @RequestParam("id_exam") String id_exam){

        ModelAndView model = new ModelAndView();

        long userId = (Long) request.getSession().getAttribute( "user_id" );
        UserEntity user = loginService.getUserByID( userId );

        boolean x = studentService.bookSession(user,Long.parseLong(id_session), Long.parseLong(id_exam));

        request.setAttribute( "exams", new JSONArray( user.getExam_list()) );

        model.setViewName("student/bookingSession");

        return model;
    }
}