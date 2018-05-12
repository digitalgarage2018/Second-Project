package com.project.service;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;

import java.util.List;

public interface ExamService {

    public List<ExamEntity> getAllExams();

    public List<ExamEntity> getAllExamsById( long userId );
}
