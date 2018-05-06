package com.project.service;

import com.project.dao.ServiceDao;
import com.project.model.ServiceEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ServiceServiceImpl implements ServiceService {

    @Autowired
    ServiceDao serviceDao;


    public List<ServiceEntity> getServiceService()  {

        List<ServiceEntity> result = null;
        try{
        	result = serviceDao.printServices();
        } catch (Exception e){
        	System.out.println("Errore SQL: "+e);
        }
        
        return result;

    }

    public List<ServiceEntity> searchKeyWordService(String keyword) {


        List<ServiceEntity> result = null;
        try {
            result = serviceDao.searchKeyWord(keyword);
        } catch (Exception e) {
        	System.out.println("Errore SQL: "+e);
            //e.printStackTrace();
        }
        return result;
    }


}
