package com.project.service;

import java.util.List;

import com.project.model.MaterialEntity;
import com.project.model.QuestionEntity;
import com.project.model.SessionEntity;

public interface ProfessorService
{
    public boolean insertMaterial(long exam_id, List<MaterialEntity> material);

    public boolean insertQuestions( long exam_id, List<QuestionEntity> questions );
    public boolean insertSession(SessionEntity sessionNew);
}