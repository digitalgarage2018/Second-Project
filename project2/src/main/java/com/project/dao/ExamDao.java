package com.project.dao;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;

import java.util.List;

public interface ExamDao {

    public List<ExamEntity> getAllExams();

    public boolean bookSession(UserEntity user, long id_session, long id_exam);

}
