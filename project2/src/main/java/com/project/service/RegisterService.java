package com.project.service;

import com.project.model.UserEntity;


public interface RegisterService {

    boolean checkUser (UserEntity newUser);

    UserEntity insertNewUser (UserEntity newUser);
}
