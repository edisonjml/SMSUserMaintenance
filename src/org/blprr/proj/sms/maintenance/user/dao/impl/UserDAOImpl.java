package org.blprr.proj.sms.maintenance.user.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.blprr.proj.sms.maintenance.user.dao.UserDAO;
import org.blprr.proj.sms.maintenance.user.entity.User;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UserDAOImpl implements UserDAO{
	
	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadRecord() throws SQLException {
		// TODO Auto-generated method stub
		
		List<User> users = new ArrayList<>();
		try{
			users = this.getSqlMapClient().queryForList("loadRecord");
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return users;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadRecord(String userId) throws SQLException {
		// TODO Auto-generated method stub
		
		List<User> users = new ArrayList<>();
		try{
			if(userId == "" || userId == null){
				users = this.getSqlMapClient().queryForList("loadRecord");
			} else {
				User user = new User();
				user.setUserId(userId);
				users = this.getSqlMapClient().queryForList("loadRecord", user);
			}
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		
		return users;
		
	}

	@Override
	public void insertRecord(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			
			this.getSqlMapClient().update("insertRecord", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
		
	}

	@Override
	public void updateRecord(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			
			this.getSqlMapClient().update("updateRecord", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}

	@Override
	public void updateLogDate(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			
			this.getSqlMapClient().update("updateLogDate", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadProfile(String loggedId) throws SQLException {
		List<User> users = new ArrayList<>();
		try{
			if(loggedId == "" || loggedId == null){
				users = this.getSqlMapClient().queryForList("loadProfile");
			} else {
				User user = new User();
				user.setUserId(loggedId);
				users = this.getSqlMapClient().queryForList("loadProfile", user);
			}
		} catch (SQLException e){
			System.out.println(e.getMessage());
		}
		return users;
	}

	@Override
	public void updateProfile(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			
			this.getSqlMapClient().update("updateProfile", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}

	@Override
	public void updatePassword(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			
			this.getSqlMapClient().update("updatePassword", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			System.out.println(e.getLocalizedMessage());
			this.sqlMapClient.getCurrentConnection().rollback();
		}finally{
			this.sqlMapClient.endTransaction();
		}
	}

}
