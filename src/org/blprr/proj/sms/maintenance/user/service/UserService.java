package org.blprr.proj.sms.maintenance.user.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
	void loadRecord(HttpServletRequest request) throws SQLException;
	void insertRecord(HttpServletRequest request) throws SQLException;
	void updateRecord(HttpServletRequest request) throws SQLException;
	
	void updateLogDate(HttpServletRequest request) throws SQLException;
	
	void loadProfile(HttpServletRequest request, String userId) throws SQLException;
	void updateProfile(HttpServletRequest request) throws SQLException;
	void updatePassword(HttpServletRequest request) throws SQLException;

}
