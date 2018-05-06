package com.project.service;

import com.project.dao.ProductDao;
import com.project.model.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl  implements  ProductService{

    @Autowired
    ProductDao productDao;

    public List<ProductEntity> getProducts()  {

        List<ProductEntity> result = productDao.printProducts();

        if(result == null)
            System.out.println("lista prodotti nulla");

        return result;

    }
}
