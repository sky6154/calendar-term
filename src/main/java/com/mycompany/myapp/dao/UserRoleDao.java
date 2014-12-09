package com.mycompany.myapp.dao;

import com.mycompany.myapp.domain.UserRole;

public interface UserRoleDao {
	void add(UserRole userRole);
	UserRole get(String userId);
	void update(UserRole userRole);
}