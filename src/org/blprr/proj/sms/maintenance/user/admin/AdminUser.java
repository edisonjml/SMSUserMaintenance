package org.blprr.proj.sms.maintenance.user.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.blprr.proj.sms.maintenance.user.dao.impl.UserDAOImpl;
import org.blprr.proj.sms.maintenance.user.entity.User;
import org.blprr.proj.sms.maintenance.user.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdminUser extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3372886910022804393L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String pages = "pages/Admin.jsp";
		try{
			
			ApplicationContext appContext = new ClassPathXmlApplicationContext("/org/blprr/proj/sms/maintenance/user/resource/applicationContext.xml");
			
			UserService user = (UserService) appContext.getBean("userService");
			
			String username = request.getParameter("username");
			
			user.loadRecord(request);
			
			//some codes to check if account exists in record
			request.setAttribute("loggedIdAdmin", username);
			
			user.loadRecord(request);
		
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
				user.updateRecord(request);
			} else if (action.equals("insert")){
				user.insertRecord(request);
			} else if (action.equals("updateAdminLogDate")){
				user.updateLogDate(request);
			}
		
		} catch(Exception e){
		}
		
	}

}
