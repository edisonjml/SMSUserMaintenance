package org.blprr.proj.sms.maintenance.user.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.blprr.proj.sms.maintenance.user.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserUser extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7996700040453210264L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String pages = "pages/User.jsp";
		try{
			ApplicationContext appContext = new ClassPathXmlApplicationContext("/org/blprr/proj/sms/maintenance/user/resource/applicationContext.xml");
			
			UserService user = (UserService) appContext.getBean("userService");
			
			String username = request.getParameter("username");
			
			//some codes to check if account exists in record
			
			user.loadProfile(request, username);
		
		} catch(Exception e){
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher(pages);
			rd.forward(request, response);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		try{
			ApplicationContext appContext = new ClassPathXmlApplicationContext("/org/blprr/proj/sms/maintenance/user/resource/applicationContext.xml");
			
			UserService user = (UserService) appContext.getBean("userService");
			
			String action = request.getParameter("action");
			
			if (action.equals("update")){
				user.updateProfile(request);
			} else if (action.equals("updatePass")){
				user.updatePassword(request);
			} else if (action.equals("updateUserLogDate")){
				user.updateLogDate(request);
			}
		
		} catch(Exception e){
		}
	
	}
	
}
