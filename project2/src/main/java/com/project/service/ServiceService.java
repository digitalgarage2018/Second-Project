package com.project.service;

import com.project.model.ServiceEntity;

import java.util.List;

public interface ServiceService {
    public List<ServiceEntity> getServiceService();
    public List<ServiceEntity> searchKeyWordService(String keyword);

}
