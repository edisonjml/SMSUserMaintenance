package org.blprr.proj.sms.maintenance.user.entity;

import java.util.Date;

public class User {
	
	private String userId;
	private String password;
	private String firstName;
	private String lastName;
	private String middleInitial;
	private String email;
	private String activeTag;
	private String accessLevel;
	private Date entryDate;
	private Date lastLogin;
	private String lastUser;
	private Date lastUpdate;
	private int attempts;
	
	public User(String userId,
			String password,
			String firstName,
			String lastName,
			String middleInitial,
			String email,
			String activeTag,
			String accessLevel,
			Date entryDate,
			Date lastLogin,
			String lastUser,
			Date lastUpdate,
			int attempts) {
		super();
		this.userId = userId;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.middleInitial = middleInitial;
		this.email = email;
		this.activeTag = activeTag;
		this.accessLevel = accessLevel;
		this.entryDate = entryDate;
		this.lastLogin = lastLogin;
		this.lastUser = lastUser;
		this.setAttempts(attempts);
	}

	public User() {
		super();
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getMiddleInitial() {
		return middleInitial;
	}
	
	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActiveTag() {
		return activeTag;
	}
	
	public void setActiveTag(String activeTag) {
		this.activeTag = activeTag;
	}
	
	public String getAccessLevel() {
		return accessLevel;
	}
	
	public void setAccessLevel(String accessLevel) {
		this.accessLevel = accessLevel;
	}
	
	public Date getEntryDate() {
		return entryDate;
	}
	
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	
	public Date getLastLogin() {
		return lastLogin;
	}
	
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	
	public String getLastUser() {
		return lastUser;
	}
	
	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public int getAttempts() {
		return attempts;
	}

	public void setAttempts(int attempts) {
		this.attempts = attempts;
	}
}
