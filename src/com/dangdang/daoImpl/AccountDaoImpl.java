package com.dangdang.daoImpl;

import com.dangdang.dao.AccountDao;
import com.dangdang.dao.DataBase;

public class AccountDaoImpl extends DataBase implements AccountDao{

	@Override
	public void insertAccount(String username,String email, String sex, String province, String city) {
		String sql = "insert into Account(username,email,sex,province,city) values(?,?,?,?,?)";
		Object[] param = {username,email,sex,province,city};
		this.exeuteDml(sql, param);
//		closeDd();
	}
	
	@Override
	public void DeleteSignon(String username) {
		String sql = "delete from account where username=? ";
		Object[] param = {username};
		this.exeuteDml(sql, param);
	}

}
