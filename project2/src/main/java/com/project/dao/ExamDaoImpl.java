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

    //private static final String FIND_ATTEMP = "SELECT a FROM AttempEntity a WHERE a.session_fk=? AND a.exam_fk=? AND a.fk_career=?";
    private static final String FIND_ATTEMP = "SELECT id_attemp,count,exam_fk,mark,session_fk,fk_career FROM attemp WHERE session_fk=? AND exam_fk=? AND fk_career=?";
    private static final String EXAM_QUERY = "SELECT e FROM ExamEntity e";
    private static final String ALL_PROFESSOR_EXAMS="SELECT id_exam,credits,description,name FROM exam,user_exam WHERE exam.id_exam=user_exam.exam_id_fk AND user_exam.user_id_fk=?";
    private static final String ALL_STUDENT_EXAMS="SELECT * FROM session s INNER JOIN exam e ON s.fk_exam=e.id_exam WHERE e.id_exam=user_exam.exam_id_fk AND user_exam.user_id_fk=? ";

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
            exams = (List<ExamEntity>) entityManager.createNativeQuery(ALL_PROFESSOR_EXAMS, ExamEntity.class ).setParameter( 1, id_user ).getResultList();

        } catch ( Exception e ) {
            e.printStackTrace();
            throw e;
            // Empty body.
        }
        return exams;
    }

    @Override
    public List<ExamEntity> getAllExamByStudentId(long id_user) {
        List<ExamEntity>exams=null;
        try {
            exams =  entityManager.createNativeQuery(ALL_PROFESSOR_EXAMS, ExamEntity.class ).setParameter(1,id_user).getResultList();

        } catch ( Exception e ) {
            e.printStackTrace();
            throw e;
            // Empty body.
        }
        return exams;
    }


    @Override
    public boolean bookSession(UserEntity user, long id_session, long id_exam)
    {
        boolean ret = false;

        try{
            List<AttempEntity> a = entityManager.createNativeQuery(FIND_ATTEMP)
                    .setParameter(1, id_session)
                    .setParameter(2, id_exam)
                    .setParameter(3, user.getCareer().getId_career())
                    .getResultList();
            if(a.size()!=0){
                AttempEntity attemp = a.get(0);
                if(attemp.getCount()<3){

                    attemp.increment();
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
