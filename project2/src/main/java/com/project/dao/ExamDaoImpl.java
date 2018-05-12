package com.project.dao;

import com.project.model.ExamEntity;
import com.project.model.UserEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.math.BigInteger;
import java.util.*;

@Repository
@Transactional
public class ExamDaoImpl implements ExamDao{

    @PersistenceContext
    public EntityManager entityManager;

    private static final String EXAM_QUERY = "SELECT e FROM ExamEntity e";
    private static final String ALL_PROFESSOR_EXAMS="SELECT id_exam,credits,description,name FROM exam,user_exam WHERE exam.id_exam=user_exam.exam_list_id_exam AND user_exam.user_list_id_user=?";
    
    @Override
    public List<ExamEntity> getAllExams()
    {
        List<ExamEntity> exams = null;
        try {
            exams = entityManager.createQuery( EXAM_QUERY, ExamEntity.class )
                                 .getResultList();
        } catch ( Exception e ) {
            e.printStackTrace();
            throw e;
            // Empty body.
        }
        return exams;
    }
    @Override
   	public List<ExamEntity> getAllExamByProfId(long id_user) {
   		List<ExamEntity>exams=null;
   	        try {
   	            exams =(List<ExamEntity>) entityManager.createNativeQuery(ALL_PROFESSOR_EXAMS, ExamEntity.class ).setParameter( 1, id_user ).getResultList();
   	            
   	        } catch ( Exception e ) {
   	            e.printStackTrace();
   	            throw e;
   	            // Empty body.
   	        }
   	        return exams;
   	}

}
