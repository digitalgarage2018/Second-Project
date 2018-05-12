package com.project.dao;

import com.project.model.UserEntity;

import java.util.List;

public interface RegisterDao {

    public Long getCheckedUser(UserEntity newUser);

    public UserEntity insertNewUser(UserEntity userEntity);
}
