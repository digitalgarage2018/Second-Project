package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.RegisterDao;
import com.project.model.UserEntity;


@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDao registerDao;
    
    @Override
    public boolean checkUser(UserEntity newUser) {
        Long checkedUser = registerDao.getCheckedUser(newUser);

        if(checkedUser>0){
            return false;
        }
        return true;
    }
    
    @Override
    public UserEntity insertNewUser(UserEntity newUser) {

        String mail = getNewIstitutionalEmail(newUser);
        newUser.setIstitutional_email(mail);

        UserEntity user = registerDao.insertNewUser( newUser );
        // FIXME non va
        //sendEmail( mail );
        
        return user;
    }
    
    private String getNewIstitutionalEmail(UserEntity newUser){

        String n = newUser.getName().substring(0,1);
        String s = newUser.getSurname();
        String email = ""+n+"."+s+"@studenti.unimarina.it";

        return email;
    }

}
