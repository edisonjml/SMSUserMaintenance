package org.blprr.proj.sms.maintenance.user.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.blprr.proj.sms.maintenance.user.dao.UserDAO;
import org.blprr.proj.sms.maintenance.user.service.UserService;

public class UserServiceImpl implements UserService {
	
	private UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public void loadRecord(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		request.setAttribute("record",userDAO.loadRecord(request.getParameter("search")));
		
	}

	@Override
	public void insertRecord(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		
		Map<String, Object> params = new HashMap<>();

		params.put("userId", request.getParameter("userId"));
		params.put("password", request.getParameter("password"));
		params.put("firstName", request.getParameter("firstName"));
		params.put("lastName", request.getParameter("lastName"));
		params.put("middleInitial", request.getParameter("middleInitial"));
		params.put("email", request.getParameter("email"));
		params.put("activeTag", request.getParameter("activeTag"));
		params.put("accessLevel", request.getParameter("accessLevel"));
		params.put("entryDate", request.getParameter("entryDate"));
		params.put("lastLogin", request.getParameter("lastLogin"));
		params.put("lastUser", request.getParameter("lastUser"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.userDAO.insertRecord(params);
		
	}

	@Override
	public void updateRecord(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		
		Map<String, Object> params = new HashMap<>();

		params.put("userId", request.getParameter("userId"));
		params.put("password", request.getParameter("password"));
		params.put("firstName", request.getParameter("firstName"));
		params.put("lastName", request.getParameter("lastName"));
		params.put("middleInitial", request.getParameter("middleInitial"));
		params.put("email", request.getParameter("email"));
		params.put("activeTag", request.getParameter("activeTag"));
		params.put("accessLevel", request.getParameter("accessLevel"));
		params.put("lastUser", request.getParameter("lastUser"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.userDAO.updateRecord(params);
		
	}
	
	@Override
	public void updateLogDate(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		
		Map<String, Object> params = new HashMap<>();

		params.put("userId", request.getParameter("userId"));
		params.put("lastLogin", request.getParameter("lastLogin"));
		
		this.userDAO.updateLogDate(params);
		
	}

	@Override
	public void loadProfile(HttpServletRequest request, String userId) throws SQLException {
		// TODO Auto-generated method stub
		request.setAttribute("profile",userDAO.loadProfile(userId));
	}

	@Override
	public void updateProfile(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		
		Map<String, Object> params = new HashMap<>();

		params.put("userId", request.getParameter("userId"));
		params.put("firstName", request.getParameter("firstName"));
		params.put("lastName", request.getParameter("lastName"));
		params.put("middleInitial", request.getParameter("middleInitial"));
		params.put("email", request.getParameter("email"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.userDAO.updateProfile(params);
	}

	@Override
	public void updatePassword(HttpServletRequest request) throws SQLException {
		// TODO Auto-generated method stub
		
		Map<String, Object> params = new HashMap<>();

		params.put("userId", request.getParameter("userId"));
		params.put("password", request.getParameter("password"));
		params.put("lastUpdate", request.getParameter("lastUpdate"));
		
		this.userDAO.updatePassword(params);
		
	}

}
