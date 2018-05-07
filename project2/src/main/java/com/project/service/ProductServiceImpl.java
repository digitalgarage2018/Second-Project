package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.CannotCreateTransactionException;

import com.project.dao.ProductDao;
import com.project.model.ProductEntity;

@Service
public class ProductServiceImpl  implements  ProductService{

    @Autowired
    ProductDao productDao;

    public List<ProductEntity> getProducts()  {

    	List<ProductEntity> result = null;
    	try{ 
    		result = productDao.printProducts();
    	} catch (CannotCreateTransactionException e){
    		System.out.println("errore exec: "+e);
    	}

        if(result == null)
            System.out.println("lista prodotti nulla");

        return result;

    }
}
