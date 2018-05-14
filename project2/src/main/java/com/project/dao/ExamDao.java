package com.project.dao;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;

import java.util.List;

public interface ExamDao {

    public List<ExamEntity> getAllExams();

    public boolean bookSession(UserEntity user, long id_session, long id_exam);

    public List<ExamEntity> getAllExamByProfId(long id_user);

    public List<ExamEntity> getAllExamByStudentId(long id_user);

    //public List<ExamEntity> getAllExamByUser(UserEntity user);
}