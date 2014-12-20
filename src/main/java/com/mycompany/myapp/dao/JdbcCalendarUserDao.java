package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.CalendarUser;

@Repository("userDao")
public class JdbcCalendarUserDao implements CalendarUserDao {
	private JdbcTemplate jdbcTemplate;

	private RowMapper<CalendarUser> rowMapper;

	// --- constructors ---
	public JdbcCalendarUserDao() {
		rowMapper = new RowMapper<CalendarUser>() {
			public CalendarUser mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				CalendarUser calendarUser = new CalendarUser();
				calendarUser.setId(rs.getInt("id"));
				calendarUser.setUser_id(rs.getString("user_id"));
				calendarUser.setName(rs.getString("name"));
				calendarUser.setPassword(rs.getString("password"));
				calendarUser.setEmail(rs.getString("email"));
				calendarUser.setLevel(rs.getInt("level"));
				calendarUser.setLogin(rs.getInt("login"));
				calendarUser.setRecommend(rs.getInt("recommend"));
				return calendarUser;
			}
		};
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// --- CalendarUserDao methods ---
	@Override
	public CalendarUser findUser(int id) {
		String sql_query = "select * from calendar_users where id = ?";
		return this.jdbcTemplate.queryForObject(sql_query, new Object[] { id },
				rowMapper);
	}

	@Override
	public CalendarUser findUserByEmail(String email) {
		String sql_query = "select * from calendar_users where email = ?";
		return this.jdbcTemplate.queryForObject(sql_query,
				new Object[] { email }, rowMapper);
	}

	@Override
	public List<CalendarUser> findUsersByEmail(String email) {
		String sql_query;
		if (email == null)
			sql_query = "select * from calendar_users";
		else
			sql_query = "select * from calendar_users where email like '%"
					+ email + "%'";

		return this.jdbcTemplate.query(sql_query, rowMapper);
	}

	@Override
	public int createUser(final CalendarUser userToAdd) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection
						.prepareStatement(
								"insert into calendar_users(user_id, name, password, email, level, login, recommend) values(?,?,?,?,?,?,?)",
								Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, userToAdd.getUser_id());
				ps.setString(2, userToAdd.getName());
				ps.setString(3, userToAdd.getPassword());
				ps.setString(4, userToAdd.getEmail());
				ps.setInt(5, userToAdd.getLevel());
				ps.setInt(6, userToAdd.getLogin());
				ps.setInt(7, userToAdd.getRecommend());

				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}

	@Override
	public List<CalendarUser> findAllusers() {
		String sql_query = "select * from calendar_users";
		return this.jdbcTemplate.query(sql_query, rowMapper);
	}

	@Override
	public void deleteAll() {
		// Assignment 2
		String sql = "delete from calendar_users";
		this.jdbcTemplate.update(sql);
	}

	@Override
	public CalendarUser findUserByUserId(String userId) {
		String sql_query = "select * from calendar_users where user_id = ?";
		return this.jdbcTemplate.queryForObject(sql_query,
				new Object[] { userId }, rowMapper);
	}

	@Override
	public void updateCalendarUser(CalendarUser calendarUser) {
		// TODO Auto-generated method stub
		String sql_query = "update calendar_users set name = ?, password = ?, email = ? where id = ?";
		this.jdbcTemplate.update(sql_query, new Object[] {calendarUser.getName(), calendarUser.getPassword(), calendarUser.getEmail(), calendarUser.getId()});
	}
}