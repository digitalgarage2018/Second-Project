package com.project.dao;

import com.project.model.UserEntity;

public interface LoginDao {

	public UserEntity getLoginByIstitutionalEmail( String istEmail);
}
