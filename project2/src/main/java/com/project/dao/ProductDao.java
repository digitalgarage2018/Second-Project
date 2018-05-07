package com.project.dao;

import java.util.List;

import org.springframework.transaction.CannotCreateTransactionException;

import com.project.model.ProductEntity;

public interface ProductDao {

    public List<ProductEntity> printProducts() throws CannotCreateTransactionException;

}
