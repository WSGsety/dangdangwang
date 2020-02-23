package com.dangdang.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dangdang.daoImpl.AccountDaoImpl;
import com.dangdang.daoImpl.ProductDaoImpl;
import com.dangdang.daoImpl.SignonDaoImpl;

public class DataBase {
	public static String url = "jdbc:mysql://192.144.131.190/dangdangwang?characterEncoding=utf-8";
	public static String user = "root";
	public static String password = "dytsaj-9Fisga-qogmos";
	public static String driver = "com.mysql.jdbc.Driver";
	public static Connection conn = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;

	public DataBase() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ResultSet getResult(String sql) {
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public void getResult2(String sql) {
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void executeDML(String sql) {
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ResultSet getResult(String sql, Object[] param) {
		try {
			ps = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setObject(i + 1, param[i]);
				}
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 执行DML语句
	public void exeuteDml(String sql, Object[] param) {
		try {
			ps = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					ps.setObject(i + 1, param[i]);
				}
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 注册页面回滚机制
	public boolean exeuteDml2(String username, String password, String email, String sex, String province,
			String city) {
		SignonDaoImpl sdi = new SignonDaoImpl();
		AccountDaoImpl adi = new AccountDaoImpl();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			sdi.insertSignon(username, password);
			adi.insertAccount(username, email, sex, province, city);
			conn.commit();
			flag = true;
			System.out.println("插入成功");
		} catch (SQLException e) {
			if (conn != null)
				try {
					conn.rollback();
					System.out.println("插入失败");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			e.printStackTrace();
		}
		return flag;

	}

	public boolean deleteSignon(String username) {
		SignonDaoImpl sdi = new SignonDaoImpl();
		AccountDaoImpl adi = new AccountDaoImpl();

		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			sdi.DeleteSignon(username);
			adi.DeleteSignon(username);
			conn.commit();
			flag = true;
			System.out.println("删除成功");
		} catch (SQLException e) {
			if (conn != null)
				try {
					conn.rollback();
					System.out.println("删除失败");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			e.printStackTrace();
		}
		return flag;

	}

	public boolean deleteProduct(String productid) {
		ProductDaoImpl pdi = new ProductDaoImpl();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			pdi.DeleteProduct(productid);
			conn.commit();
			flag = true;
			// System.out.println("删除成功"+productid);
		} catch (SQLException e) {
			if (conn != null)
				try {
					conn.rollback();
					// System.out.println("删除失败");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			e.printStackTrace();
		}
		return flag;

	}

	public boolean exeuteDml3(String username, String password, String email, String sex, String province,
			String city) {
		SignonDaoImpl sdi = new SignonDaoImpl();
		AccountDaoImpl adi = new AccountDaoImpl();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			sdi.insertSignon(username, password);
			adi.insertAccount(username, email, sex, province, city);
			conn.commit();
			flag = true;
			// System.out.println("修改成功");
		} catch (SQLException e) {
			if (conn != null)
				try {
					conn.rollback();
					// System.out.println("修改失败");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			e.printStackTrace();
		}
		return flag;

	}

	public boolean exeuteDml4(String productid, String catid, String bookname, double score, String author,
			String publish, String pubdate, String descn, double price, int discount,String img,int qty) {

		ProductDaoImpl pdi = new ProductDaoImpl();
		boolean flag = false;
		try {
			conn.setAutoCommit(false);
			pdi.insertProduct(productid, catid, bookname, score, author, publish, pubdate, descn, price, discount, img,
					qty);
			conn.commit();
			flag = true;
			// System.out.println("插入图书成功"+bookname);
		} catch (SQLException e) {
			if (conn != null)
				try {
					conn.rollback();
					// System.out.println("插入图书失败");
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			e.printStackTrace();
		}
		return flag;

	}

	public void closeDd() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
