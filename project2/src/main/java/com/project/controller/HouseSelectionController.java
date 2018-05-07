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
public class HouseSelectionController {

	@Autowired
	HouseSelectionService houseSelectionService;
	
	@Autowired
	CityDao cityDao;

	@RequestMapping(value="houseSelectionController", method = RequestMethod.GET)
	public ModelAndView userCheck(HttpServletRequest request) {

		String minPrice = null, maxPrice = null;
		
		if(request.getParameter("price") != null && !request.getParameter("price").equals("")) {
			minPrice = request.getParameter("price").split(",")[0];
			maxPrice = request.getParameter("price").split(",")[1];
		}
		
		String minArea = null, maxArea = null;
		
		if(request.getParameter("area") != null && !request.getParameter("area").equals("")) {
			minArea = request.getParameter("area").split(",")[0];
			maxArea = request.getParameter("area").split(",")[1];			
		}
		
		String type = request.getParameter("type");
		String E_class = request.getParameter("E_class");
		String range = request.getParameter("range");
		
		if(range == null || range.equals("") )
			range = "2";
		
		
		String city = request.getParameter("city");

		Map<String, String> parameters = new HashMap<String, String>();

		if(city != null && !city.equals("")) {
			CityEntity cityEntity = cityDao.findByName(city); 
			parameters.put("latitude", cityEntity.getLatitude() + "");
			parameters.put("longitude", cityEntity.getLongitude() + "");
		}
		else {
			parameters.put("latitude", request.getParameter("latitude"));
			parameters.put("longitude", request.getParameter("longitude"));
		}
				

		parameters.put("minPrice", minPrice);
		parameters.put("maxPrice", maxPrice);
		parameters.put("minArea", minArea);
		parameters.put("maxArea", maxArea);
		parameters.put("type", type);
		parameters.put("E_class", E_class);
		parameters.put("range", range);
		


		List<HouseEntity> houses = new ArrayList<HouseEntity>();

		houses = houseSelectionService.select(parameters);
		
		/*
		 * attenzione: se non si fa un controllo != null l'applicazione può esplodere!!!
		 */
//		System.out.println( "trovata casa con indirizzo: "+houses.get(0).getAddress() );//debug
//		System.out.println( "trovata casa con classe energetica: "+houses.get(0).getE_class() );//debug

		ModelAndView model = new ModelAndView();

		String json_house = new Gson().toJson(houses);
		model.addObject("places", json_house);
		model.addObject("lat", Double.parseDouble(parameters.get("latitude")));
		model.addObject("lng", Double.parseDouble(parameters.get("longitude")));
		model.addObject("range",Integer.parseInt(range));
		model.addObject("houses", houses);
		model.addObject("minPrice", Double.parseDouble(parameters.get("minPrice")));
		model.addObject("maxPrice", Double.parseDouble(parameters.get("maxPrice")));
		model.addObject("minArea", Double.parseDouble(parameters.get("minArea")));
		model.addObject("maxArea", Double.parseDouble(parameters.get("maxArea")));
		model.setViewName("map");

		return model;

	}
}
