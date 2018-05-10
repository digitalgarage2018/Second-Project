package com.project.dao;

import java.util.List;

import com.project.model.MaterialEntity;
import com.project.model.QuestionEntity;

public interface ProfessorDao
{
    public boolean insertMaterial(long exam_id, List<MaterialEntity> material);

    public boolean insertQuestions( long exam_id, List<QuestionEntity> question );
}