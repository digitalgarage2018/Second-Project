package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.HouseSelectionDao;
import com.project.model.HouseEntity;

@Service
public class HouseSelectionServiceImpl implements HouseSelectionService{

	@Autowired
	HouseSelectionDao houseSelectionDao;
	
	public List<HouseEntity> select(Map<String, String> parameters) {
				
		return houseSelectionDao.findHousesBy(parameters);
	
	}
}
