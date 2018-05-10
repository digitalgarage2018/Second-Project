package com.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.model.ExamEntity;
import com.project.model.MaterialEntity;
import com.project.model.QuestionEntity;

@Repository
@Transactional
public class ProfessorDaoImpl implements ProfessorDao{

    @PersistenceContext
    public EntityManager entityManager;
    
    @Override
    public boolean insertMaterial(long exam_id, List<MaterialEntity> material)
    {
        boolean res = false;
        try{
            ExamEntity exam = entityManager.find( ExamEntity.class, exam_id );
            exam.setMaterial_list( material );
            entityManager.flush();
            res = true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public boolean insertQuestions( long exam_id, List<QuestionEntity> questions )
    {
        boolean res = false;
        try{
            ExamEntity exam = entityManager.find( ExamEntity.class, exam_id );
            exam.setQuestion_list( questions );
            entityManager.flush();
            res = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return res;
    }
}
