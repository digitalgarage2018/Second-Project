package com.project.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.model.HouseEntity;

@Repository
@Transactional
public class HouseSelectionDaoImpl implements HouseSelectionDao{
      
    private static final String SELECT = "SELECT b FROM HouseEntity b WHERE 1 = 1";
    
	
    @PersistenceContext
	 public EntityManager entityManager;
	
	public List<HouseEntity> findHousesBy(Map<String, String> parameters) {
        
		TypedQuery<HouseEntity> query = entityManager.createQuery(queryBuilder(parameters), HouseEntity.class);
        
		return query.getResultList();
	}
	
	private String queryBuilder(Map<String, String> parameters) {
        String minPrice, maxPrice, minArea, maxArea, type, E_class, range, latitude, longitude;

        minPrice = parameters.get("minPrice");
        maxPrice = parameters.get("maxPrice");
        minArea = parameters.get("minArea");
        maxArea = parameters.get("maxArea");
        type = parameters.get("type");
        E_class = parameters.get("E_class");
        range = parameters.get("range");
        latitude = parameters.get("latitude");
        longitude = parameters.get("longitude");

        StringBuilder query = new StringBuilder();

        query.append(SELECT);

        if(minPrice != null && maxPrice != null && !minPrice.equals("") && !maxPrice.equals("")) {
            query.append(" and");
            query.append(" b.price>" + minPrice);
            query.append(" and");
            query.append(" b.price<" + maxPrice);
        }

        if(minArea != null && maxArea != null && !minArea.equals("") && !maxArea.equals("")) {
            query.append(" and");
            query.append(" b.area>" + minArea);
            query.append(" and");
            query.append(" b.area<" + maxArea);
        }

        if(type != null && !type.equals(""))
            query.append(" and b.type='" + type + "'");

        if(E_class != null && !E_class.equals(""))
            query.append(" and b.E_class='" + E_class + "'");

        if(range != null && !range.equals(""))
            query.append(zoneQueryBuilder(longitude, latitude, range));
        else
            query.append(zoneQueryBuilder(longitude, latitude, "2"));

        return query.toString();
	}
	
	private String zoneQueryBuilder(String longitude, String latitude, String range) {
		return " and (POW ( ( 69.1 * ( b.longitude - " + longitude + " ) * cos( " + latitude + " / 57.3 ) ) , 2 ) " +
                "+ POW( ( 69.1 * ( b.latitude - " + latitude + " ) ) , 2 ) ) < " + range;
        //return " and 6371 * acos ( cos ( radians("+latitude+") ) * cos( radians( b.latitude ) ) * cos( radians( b.longitude ) - radians("+longitude+") ) + sin ( radians("+latitude+") ) * sin( radians( b.latitude ) ) < " + range;

	}
}
