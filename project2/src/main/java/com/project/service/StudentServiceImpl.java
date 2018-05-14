package com.project.service;

import com.project.dao.ExamDao;
import com.project.model.UserEntity;
import com.project.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.StudyPlanDao;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudyPlanDao studyPlanDao;

    @Autowired
    private ExamDao examDao;

    @Override
    public void insertStudyPlan(long user_id, String[] exams) {
        studyPlanDao.saveExams(user_id, exams);
    }

    @Override
    public boolean bookSession(UserEntity user, long id_session, long id_exam) {
        return examDao.bookSession(user, id_session, id_exam);
    }
}