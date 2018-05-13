package com.project.dao;

import com.project.model.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.*;

@Repository
@Transactional
public class ExamDaoImpl implements ExamDao{

    @PersistenceContext
    public EntityManager entityManager;

    private static final String EXAM_QUERY = "SELECT e FROM ExamEntity e";

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

    private static final String FIND_ATTEMP = "SELECT a FROM AttempEntity a WHERE a.session_fk=?1 AND a.exam_fk=?2";

    @Override
    public boolean bookSession(UserEntity user, long id_session, long id_exam)
    {
        boolean ret = false;

        try{
            List<AttempEntity> a = entityManager.createQuery(FIND_ATTEMP)
                    .setParameter(1, id_session)
                    .setParameter(2, id_exam)
                    .getResultList();
            if(a.size()!=0){
                if(a.get(0).getCount()<3){
                    a.get(0).increment();
                    ret = true;
                }
            }else{
                AttempEntity newA = new AttempEntity(id_exam,id_session,1);
                UniversityCareerEntity u = entityManager.find(UniversityCareerEntity.class, user.getCareer().getId_career());
                u.getAttemps_list().add(newA);
                entityManager.persist(newA);
                entityManager.persist(u);
                ret = true;
            }

        }catch(Exception e){
            throw e;
        }

        entityManager.flush();

        return ret;
    }
}
