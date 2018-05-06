package com.project.dao;

import java.util.List;

import com.project.model.ServiceEntity;

public interface ServiceDao {
    //public boolean authenticateUser(LoginEntity loginBean);
    public List<ServiceEntity> printServices();
    public List<ServiceEntity> searchKeyWord(String keyword);
}
