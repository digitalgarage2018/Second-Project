package com.project.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.project.dao.RegisterDao;
import com.project.model.UserEntity;


@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterDao registerDao;
    
    @Autowired
    private JavaMailSender mailSenderObj;
    
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
        mailSenderObj.send(new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                mimeMsgHelperObj.setTo( user.getPersonal_email() );
                mimeMsgHelperObj.setFrom( "unimarina.noreply@gmail.com" );
                mimeMsgHelperObj.setText( "Ciao mondo!" );
                mimeMsgHelperObj.setSubject( "First email" );
            }
        });
        
        return user;
    }
    
    private String getNewIstitutionalEmail(UserEntity newUser){

        String n = newUser.getName().substring(0,1);
        String s = newUser.getSurname();
        String email = ""+n+"."+s+"@studenti.unimarina.it";

        return email;
    }

}
