package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.model.HouseEntity;

public interface HouseSelectionService {

	List<HouseEntity> select(Map<String, String> parameters);

}
