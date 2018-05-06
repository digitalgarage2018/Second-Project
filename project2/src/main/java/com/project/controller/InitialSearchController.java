package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.dao.CityDao;
import com.project.model.CityEntity;
import com.project.model.HouseEntity;
import com.project.service.HouseSelectionService;

@Controller
public class InitialSearchController {

	@Autowired
	HouseSelectionService houseSelectionService;
	
	@Autowired
	CityDao cityDao;
	
	@RequestMapping(value="initialSearchController", method = RequestMethod.GET)
	public ModelAndView userCheck(HttpServletRequest request) {
		
		String city = request.getParameter("city");

		CityEntity cityEntity = cityDao.findByName(city); 
				
		System.out.println(cityEntity.getLatitude() + "," + cityEntity.getLongitude());
		
		Map<String, String> parameters = new HashMap<String, String>();				

		parameters.put("latitude", cityEntity.getLatitude() + "");
		parameters.put("longitude", cityEntity.getLongitude() + "");

		List<HouseEntity> houses = new ArrayList<HouseEntity>();

		houses = houseSelectionService.select(parameters);

		ModelAndView model = new ModelAndView();

		String json_house = new Gson().toJson(houses);
		model.addObject("places", json_house);
		model.addObject("lat", parameters.get("latitude"));
		model.addObject("lng", parameters.get("longitude"));		
		model.addObject("houses", houses);
		model.setViewName("map");

		return model;

	}
}
