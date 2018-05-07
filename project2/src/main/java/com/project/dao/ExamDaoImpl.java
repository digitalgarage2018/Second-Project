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

    private final static String GET_ALL_EXAMS = "SELECT e FROM ExamEntity e ";
    private final static String GET_USER_EXAMS = "SELECT exam_list_id_exam FROM user_exam WHERE user_list_id_user=?";


    public ExamEntity getExamByID(long id_exam){

        ExamEntity exam = entityManager.find(ExamEntity.class, id_exam);

        return exam;
    }

    public List<ExamEntity> getAllExams(){

        List<ExamEntity> exams = entityManager.createNamedQuery(GET_ALL_EXAMS).getResultList();

        return exams;
    }

    public List<ExamEntity> getUserExams(UserEntity user){

        List<ExamEntity> res = new ArrayList<ExamEntity>();

        List<BigInteger> list = entityManager.createNativeQuery(GET_USER_EXAMS).setParameter(1,user.getId_user()).getResultList();

        /*for(int i=0;i<list.size();i++)
        {
            list.get(i).
            res.add(getExamByID(list.get(i)));
        }*/

        return res;
    }
}
