package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ProfessorDao;
import com.project.dao.SessionDao;
import com.project.model.MaterialEntity;
import com.project.model.QuestionEntity;
import com.project.model.SessionEntity;

@Service
public class ProfessorServiceImpl implements ProfessorService {

    @Autowired
    ProfessorDao professorDao;
    @Autowired
    SessionDao sessionDao;
    public boolean insertMaterial(long exam_id, List<MaterialEntity> material){
        return professorDao.insertMaterial(exam_id, material);
    }

    @Override
    public boolean insertQuestions(long exam_id, List<QuestionEntity> questions) {
        return professorDao.insertQuestions( exam_id, questions );
    }
    @Override
	public boolean insertSession(SessionEntity se) {
		// TODO Auto-generated method stub
		return sessionDao.insertSession(se);
	}
}
