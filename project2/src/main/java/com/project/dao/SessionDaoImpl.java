package com.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.project.model.SessionEntity;

@Repository
@Transactional
public class SessionDaoImpl implements SessionDao {

	@PersistenceContext
	public EntityManager entityManager;
	
	@Override
	public boolean insertSession(SessionEntity se) {
		//faccio la query insert con questi valori e ritorn il risultato 
		//dell'insert come booleano
		
        boolean res = false;
        try{
        	//entityManager.getTransaction();
           entityManager.persist(se);
           //entityManager.getTransaction().commit();
            
        	
        	res = true;

        }catch(Exception e){
            System.out.println(e.getStackTrace().toString());
            throw e;
        }
        return res;
	}



}
