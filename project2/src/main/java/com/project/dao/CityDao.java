package com.project.dao;

import com.project.model.CityEntity;

public interface CityDao{

    CityEntity findByName(String name);
    
}
