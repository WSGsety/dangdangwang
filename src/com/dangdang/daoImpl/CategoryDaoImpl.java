package com.dangdang.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dangdang.dao.CategoryDao;
import com.dangdang.entity.Category;
import com.dangdang.dao.DataBase;
public class CategoryDaoImpl extends DataBase implements CategoryDao {
//��ߵ�����
	@Override
	public ArrayList<Category> checkCategory() {
		String sql = "select catid,name2 from category";
		ResultSet rs = this.getResult(sql);
		ArrayList<Category> clist = new ArrayList<>();
		try {
			while(rs.next()){
				Category c = new Category();
				c.setCatid(rs.getString("catid"));
				c.setName(rs.getString("name2"));
				clist.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		closeDd();
		return clist;
	}

	@Override
	public ArrayList<Category> checkCategory1() {
		String sql = "select catid,name,name2 from category where name='С˵'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Category> clist = new ArrayList<>();
		try {
			while(rs.next()){
				Category c = new Category();
				c.setCatid(rs.getString("catid"));
				c.setName(rs.getString("name2"));
				clist.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		closeDd();
		return clist;
	}

	@Override
	public ArrayList<Category> checkCategory2() {
		String sql = "select catid,name,name2 from category where name='����'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Category> clist = new ArrayList<>();
		try {
			while(rs.next()){
				Category c = new Category();
				c.setCatid(rs.getString("catid"));
				c.setName(rs.getString("name2"));
				clist.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		closeDd();
		return clist;
	}

	@Override
	public ArrayList<Category> checkCategory3() {
		String sql = "select catid,name,name2 from category where name='�ഺ'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Category> clist = new ArrayList<>();
		try {
			while(rs.next()){
				Category c = new Category();
				c.setCatid(rs.getString("catid"));
				c.setName(rs.getString("name2"));
				clist.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		closeDd();
		return clist;
	}

}
