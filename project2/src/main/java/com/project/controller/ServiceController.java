package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.ServiceEntity;
import com.project.service.ServiceService;

@Controller
public class ServiceController {

    @Autowired
    ServiceService serviceService;


    @RequestMapping(value = "serviceController", method = RequestMethod.GET)
    public ModelAndView getServices(HttpServletRequest request) {

        //  ServiceEntity serviceBean = new ServiceEntity();
        ModelAndView model = new ModelAndView();

        List<ServiceEntity> serviceList = serviceService.getServiceService();
        if (serviceList != null) {
            model.addObject("services", serviceList); // Will be available as ${products} in JSP
        } else {
            request.setAttribute("errorMessage", "Errore connessione database. Riprova più tardi");
        }
        //  request.getRequestDispatcher("/service_list.jsp").forward(request, response);
        model.setViewName("service_list");

        return model;

    }

    @RequestMapping(value = "searchController", method = RequestMethod.POST)

    public ModelAndView searchServices(HttpServletRequest request) {

        ModelAndView model = new ModelAndView();

        String keyword = request.getParameter("keyword");
        
        List<ServiceEntity> serviceList = null;
        
        System.out.println("chiave di ricerca:||"+keyword+"||");
        //if (keyword!=null &&  keyword.trim().length() > 0){
        if (keyword.equals("all")){
        	serviceList = serviceService.getServiceService();
        	//serviceList = serviceService.searchKeyWordService(keyword);
        }
        else {
        	serviceList = serviceService.searchKeyWordService(keyword);
        	//serviceList = serviceService.getServiceService();
        }

        if (serviceList != null) {
            model.addObject("services", serviceList);

        } else {
            request.setAttribute("errorMessage", "Errore connessione database. Riprova più tardi");

        }
        model.setViewName("service_list");
        return model;

    }

    /*
	private List<ServiceBean> serviceList;
	private String searchServices;

    public String getSearchServices() {
		return searchServices;
	}

	public void setSearchServices(String searchServices) {
		this.searchServices = searchServices;
	}*/
/*

public void loadServices() {

		System.out.println("ENTRO LOAD");
        serviceList.clear();

        try {
            if (searchServices != null && searchServices.trim().length() > 0) {
                // search for services by name
                serviceList = ServiceDao.searchService(searchServices);
            }
            else {
                // get all services from database
                serviceList = ServiceDao.getServices();
            }

        } catch (Exception exc) {
            // send this to server logs
          //  logger.log(Level.SEVERE, "Error loading services", exc);

            // add error message

        }
        finally {
            // reset the search info
            searchServices = null;
        }
    }*/
}
