package com.project.dao;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;

import java.util.List;

public interface ExamDao {

    public ExamEntity getExamByID(long id_exam);

    public List<ExamEntity> getAllExams();

    public List<ExamEntity> getUserExams(UserEntity user);
}
