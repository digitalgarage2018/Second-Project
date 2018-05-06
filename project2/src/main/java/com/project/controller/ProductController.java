package com.project.controller;

import com.project.model.ProductEntity;
import com.project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;


    @RequestMapping(value="productController", method = RequestMethod.GET)
    public ModelAndView getProducts(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView model = new ModelAndView();

        List<ProductEntity> productList = productService.getProducts();

        if(productList != null){
            model.addObject("products", productList);
        }
        else {
            request.setAttribute("errorMessage", "Errore connessione database. Riprova più tardi");
        }
        model.setViewName("product_list");

        return model;
    }

}
