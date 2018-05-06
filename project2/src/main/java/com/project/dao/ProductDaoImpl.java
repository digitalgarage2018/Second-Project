package com.project.dao;

import com.project.model.ProductEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;


@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

    @PersistenceContext
    public EntityManager entityManager;

    public List<ProductEntity> printProducts() {

        Query selectAll = entityManager.createQuery("select rr from ProductEntity rr order by p_name");



        return /*(List<ProductEntity>)*/ selectAll.getResultList();
    }


}
