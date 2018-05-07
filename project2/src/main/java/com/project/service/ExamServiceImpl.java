package com.project.service;

import com.project.dao.ExamDao;
import com.project.model.ExamEntity;
import com.project.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamServiceImpl implements ExamService {

    @Autowired
    ExamDao examDao;

    public List<ExamEntity> getUserExams(UserEntity user){

        return examDao.getUserExams(user);
    }
}
