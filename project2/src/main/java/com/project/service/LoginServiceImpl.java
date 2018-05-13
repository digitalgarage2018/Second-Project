package com.project.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.project.dao.LoginDao;
import com.project.model.UserEntity;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private JavaMailSender mailSenderObj;


	@Override
	public UserEntity getUserByID(long id_user) {
		return loginDao.getLoginByID(id_user);
	}
	
	@Override
	public UserEntity authenticateUserByEmail(UserEntity userEntity) throws MessagingException {
	    UserEntity user = loginDao.getLoginByIstitutionalEmail(userEntity.getIstitutional_email());
		if (user != null) {
		    if (user.getPassword().equals(userEntity.getPassword()) &&
			    user.getIstitutional_email().equals(userEntity.getIstitutional_email())){
		        try {
		            mailSenderObj.send(new MimeMessagePreparator() {
		                public void prepare(MimeMessage mimeMessage) throws Exception {
		                    MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                            mimeMsgHelperObj.setTo( "micheledanaila@gmail.it" );
                            mimeMsgHelperObj.setFrom( "unimarina.noreply@gmail.com" );
                            mimeMsgHelperObj.setText( "Ciao mondo!" );
                            mimeMsgHelperObj.setSubject( "First email" );
                        }
		            });
			 	}catch (Exception e) {
			 	    throw e;
			 	}
			    
			    return user;
			}
		}
		return null;
	}
}