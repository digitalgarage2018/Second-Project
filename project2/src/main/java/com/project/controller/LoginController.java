package com.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.LoginEntity;
import com.project.service.LoginService;

@Controller
public class LoginController {

	@Autowired
    private LoginService loginService;
	
	
	@RequestMapping(value="loginController", method = RequestMethod.POST)
	public ModelAndView userCheck(HttpServletRequest request) {
		String name=request.getParameter("username");
		String pwd=request.getParameter("password");

		LoginEntity loginBean = new LoginEntity();
		loginBean.setUsername(name);
		loginBean.setPassword(pwd);
		 
		
		String result = loginService.authenticateUser(loginBean);
		
		HttpSession session=request.getSession();
		ModelAndView model = new ModelAndView();
		
		if (result.equals("success")){
			
			
			//model.addObject("user", loginBean);
			session.setAttribute("user", loginBean.getUsername());
	    	model.setViewName("redirect:/index.jsp");
			
		}else if (result.equals("errorDB")){
			session.invalidate();
            request.setAttribute("errorMessage", "Errore di connessione. Riprova più tardi");
			model.setViewName("login");
		}else {
			session.invalidate();
            request.setAttribute("errorMessage", "Nome utente e/o password non validi");
			model.setViewName("login");
		}
		
    	return model;

	}
		
	@RequestMapping(value="logoutController")
    protected ModelAndView logout(HttpServletRequest request) {  

        HttpSession session=request.getSession();  
        session.invalidate();  
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/index.jsp");
        return model;
    }  
    ////////////////////////////////////
	
	@RequestMapping(value="signUpController", method = RequestMethod.POST)
	protected ModelAndView registerUser(HttpServletRequest request) throws ServletException, IOException {
 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email	= request.getParameter("email");
		String name		= request.getParameter("name");
		String surname	= request.getParameter("surname");
		String born_date	= request.getParameter("born_date");
		String born_place	= request.getParameter("born_place");
		
		LoginEntity signUpBean = new LoginEntity();
		
		signUpBean.setUsername(username);
		signUpBean.setPassword(password);
		signUpBean.setEmail(email);
		signUpBean.setName(name);
		signUpBean.setSurname(surname);
		signUpBean.setBorn_date(born_date);
		signUpBean.setBorn_place(born_place);
		
		String result = loginService.registrationUserService(signUpBean); //todo
		
		ModelAndView model = new ModelAndView();
		
		System.out.println("valore ritornato: " +result);
			
		if (result.equals("success")) {
			
			//open session for user
			HttpSession session=request.getSession();  
			session.setAttribute("user", signUpBean.getUsername());
	    	model.setViewName("redirect:/index.jsp");
			//
			
		} else if(result.equals("errorDB")){
			//session.invalidate();
            request.setAttribute("errorMessage", "Errore di connessione. Riprova più tardi");
            model.setViewName("sign_up");
		} else if(result.equals("errorSQL")){
			//session.invalidate();
            request.setAttribute("errorMessage", "Errore. Nome utente già in uso");
            model.setViewName("sign_up");
		}
		
		else {
			request.setAttribute("errorMessage", "Errore generale (si, un errore non definito come quelli di Windows10");
            model.setViewName("sign_up");
		}
		return model;
	}
	
}
