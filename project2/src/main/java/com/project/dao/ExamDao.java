package com.project.dao;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;

import java.util.List;

public interface ExamDao {

	public List<ExamEntity> getAllExams();
    public List<ExamEntity> getAllExamByProfId(long id_user);

}
