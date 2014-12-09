package com.mycompany.myapp.domain;

public class UserRole {
	int id;
	int userId;
	String role;
	
	public UserRole() {
	}
	
	public UserRole(int userId, String role) {
		super();
		this.userId = userId;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
