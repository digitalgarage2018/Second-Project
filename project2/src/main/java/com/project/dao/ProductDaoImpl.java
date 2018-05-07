package com.project.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.CannotCreateTransactionException;

import com.project.model.ProductEntity;


@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

    @PersistenceContext
    public EntityManager entityManager;

    public List<ProductEntity> printProducts() throws CannotCreateTransactionException {

        Query selectAll = entityManager.createQuery("select rr from ProductEntity rr order by p_name");

        return /*(List<ProductEntity>)*/ selectAll.getResultList();
    }


}
