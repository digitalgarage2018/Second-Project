package com.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.ExamEntity;
import com.project.model.MaterialEntity;
import com.project.model.QuestionEntity;
import com.project.model.SessionEntity;
import com.project.service.ExamService;
import com.project.service.ProfessorService;

@RestController
public class ProfessorController
{
    @Autowired
    private ProfessorService professor_service;
    @Autowired
	private ExamService examService;
    @RequestMapping(value="/uploadController", method=RequestMethod.POST)
    public String upLoadMaterial( HttpServletRequest request,
                                  @RequestParam("idE")    long id_exam,
                                  @RequestParam("nameE")  String examName,
                                  @RequestParam("videos") String videos,
                                  @RequestParam("notes")  String notes )
    {
        System.out.println( "ID_EXAM: " + id_exam + ", EXAM_NAME: " + examName + ", " +
                            "VIDEOS: " + videos + ", NOTES: " + notes );
        
        request.getSession().setAttribute( "id_exam", id_exam );
        
        List<MaterialEntity> materials = new ArrayList<>();
        JSONObject jObj = new JSONObject( videos );
        JSONArray jVideos = jObj.getJSONArray( "videos" );
        for (int i = 0; i < jVideos.length(); i++) {
            materials.add( new MaterialEntity( jVideos.getString( i ), MaterialEntity.VIDEO ) );
        }
        
        jObj = new JSONObject( notes );
        JSONArray jNotes = jObj.getJSONArray( "notes" );
        for (int i = 0; i < jNotes.length(); i++) {
            materials.add( new MaterialEntity( jNotes.getString( i ), MaterialEntity.NOTE ) );
        }
        
        if (professor_service.insertMaterial( id_exam, materials )) {
            return "OK";
        } else {
            return "NO";
        }
    }
    
    @RequestMapping(value="/uploadQuestions", method = RequestMethod.POST)
    public String saveQuestion( HttpServletRequest request,
                                @RequestParam("exam_id") long id_exam,
                                @RequestParam("questions") String qList )
    {
        List<QuestionEntity> questions = new ArrayList<>();
        JSONObject jObj = new JSONObject( qList );
        JSONArray jQuestions = jObj.getJSONArray( "questions" );
        for (int i = 0; i < jQuestions.length(); i++) {
            JSONObject value = jQuestions.getJSONObject( i );
            String question = value.getString( "question" );
            int weight = value.getInt( "weight" );
            JSONArray answers = value.getJSONArray( "answers" );
            String answer1 = answers.getString( 0 );
            String answer2 = answers.getString( 1 );
            String answer3 = answers.getString( 2 );
            String answer4 = answers.getString( 3 );
            int correct_answer = value.getInt( "correct" );
            questions.add( new QuestionEntity( question, weight, answer1, answer2, answer3, answer4, correct_answer ) );
        }
        
        if (professor_service.insertQuestions( id_exam, questions )) {
            return "OK";
        } else {
            return "NO";
        }
    }
    @RequestMapping(value = "/uploadControllerSession", method = RequestMethod.POST)
	public ModelAndView createSession(HttpServletRequest request) {
		Date date_start = new Date();
		String dateStart = request.getParameter("begindate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");

		try {
			date_start = sdf.parse(dateStart);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Date date_end = new Date();
		String dateEnd = request.getParameter("finaldate");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-mm-dd");

		try {
			date_end = sdf2.parse(dateEnd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String idexam = request.getParameter("exams");
		long idE = Long.parseLong(idexam);
		ModelAndView model = new ModelAndView();
		SessionEntity sessionNew = new SessionEntity(idE, date_start, date_end, false);
		model.addObject("begindate", dateStart);
		model.addObject("finaldate", dateEnd);

		boolean appelloInserito = professor_service.insertSession(sessionNew);
		if (appelloInserito) {
			model.setViewName("success");
		} else {
			model.setViewName("error");
		}
		return model;
	}
	
	
	
	@RequestMapping(value = "/uploadSession", method = RequestMethod.GET)
	public ModelAndView caricaSession(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		long professorId=(long) request.getSession().getAttribute("user_id");
		List <ExamEntity>list=examService.getAllExamsById(professorId);
		model.addObject("exam",new JSONArray(list));
		model.setViewName("professor/createSession");
		return model;
	}
}
