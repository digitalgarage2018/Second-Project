package com.project.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.project.model.CityEntity;

@Repository
@Transactional
public class CityDaoImpl implements CityDao{

	@PersistenceContext
	public EntityManager entityManager;
	
	public CityEntity findByName(String name) {
		TypedQuery<CityEntity> query = entityManager.createQuery("SELECT c FROM CityEntity c WHERE c.name = :name", CityEntity.class);
        
		query.setParameter("name", name);
		
		return query.getSingleResult();
	}
}
