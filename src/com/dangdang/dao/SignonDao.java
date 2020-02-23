package com.dangdang.dao;

import java.util.ArrayList;

import com.dangdang.entity.Signon;

public interface SignonDao {
	public ArrayList<Signon> getSignon(String username,String password);
	public boolean judgeSignon(String username,String password);
	public void insertSignon(String username,String password);
	boolean findSignon(String username);
	public ArrayList<Signon> CheckSignonAll();
	public void DeleteSignon(String username);
	
}
