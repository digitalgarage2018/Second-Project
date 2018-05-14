package com.project.service;

import java.util.List;

import com.project.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ExamDao;
import com.project.model.ExamEntity;

@Service
public class ExamServiceImpl implements ExamService {

    @Autowired
    ExamDao examDao;

    @Override
    public List<ExamEntity> getAllExams()
    {
        List<ExamEntity> exams = examDao.getAllExams();
        return exams;
    }

    @Override
    public List<ExamEntity> getAllExamsById(UserEntity user )
    {
        List<ExamEntity> exams = (user.getType().equals(UserEntity.PROFESSOR)) ? examDao.getAllExamByProfId(user.getId_user()) : examDao.getAllExamByStudentId(user.getId_user());

        return exams;
    }

}
