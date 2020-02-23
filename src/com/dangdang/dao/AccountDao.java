package com.dangdang.dao;

public interface AccountDao {
	public void insertAccount(String username,String email, String sex, String province, String city);
	public void DeleteSignon(String username);
}
