package com.dangdang.daoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.dangdang.dao.SignonDao;
import com.dangdang.entity.Signon;
import com.dangdang.dao.DataBase;

public class SignonDaoImpl extends DataBase implements SignonDao {

	@Override
	public void insertSignon(String username, String password) {
		String sql = "insert into Signon(username,password,flag) values(?,?,0)";
		Object[] param = {username,password};
		exeuteDml(sql, param);
	}
	
	@Override
	public boolean findSignon(String username) {
		String sql = "select * from Signon where username='"+username+"'";
		ResultSet rs = this.getResult(sql);
		boolean flag=true;
		try {
			while (rs.next()) {
				flag=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public ArrayList<Signon> getSignon(String uname, String password) {
		String sql = "select * from Signon where username=? and password =?";
		Object[] param  = {uname,password};
		ResultSet rs = this.getResult(sql,param);
		ArrayList<Signon> sList = new ArrayList<Signon>();
		try {
			while (rs.next()) {
				Signon signon = new Signon();
				signon.setUsername(rs.getString("username"));
				signon.setPassword(rs.getString("password"));
				sList.add(signon);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		closeDd();
		return sList;
	}
	
	@Override
	public boolean judgeSignon(String uname, String password) {
		String sql = "select * from Signon where username=? and password =?";
		Object[] param  = {uname,password};
		ResultSet rs = this.getResult(sql,param);
		int flag=0;
		try {
			while (rs.next()) {
				flag=1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		closeDd();
		if(flag==1){
			return true;
		}else{
			return false;
		}
		
	}

	public int judgeAdmin(String username) {
		String sql = "select flag from Signon where username=?";
		Object[] param  = {username};
		ResultSet rs = this.getResult(sql,param);
		int flag=0;
		try {
			while (rs.next()) {
				flag = rs.getInt("flag");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public ArrayList<Signon> CheckSignonAll() {
		String sql = "select * from Signon";
		ResultSet rs = this.getResult(sql);
		ArrayList<Signon> sList = new ArrayList<Signon>();
		try {
			while (rs.next()) {
				Signon signon = new Signon();
				signon.setUsername(rs.getString("username"));
				signon.setPassword(rs.getString("password"));
				sList.add(signon);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		closeDd();
		return sList;
	}

	@Override
	public void DeleteSignon(String username) {
		String sql = "delete from signon where username=? ";
		Object[] param = {username};
		this.exeuteDml(sql, param);
	}

}
