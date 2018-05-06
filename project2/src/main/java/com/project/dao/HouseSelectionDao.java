package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.model.HouseEntity;

public interface HouseSelectionDao {

	List<HouseEntity> findHousesBy(Map<String, String> parameters);

}
