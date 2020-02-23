package com.dangdang.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dangdang.dao.CartDao;
import com.dangdang.entity.Cart;
import com.dangdang.entity.Product;
import com.dangdang.dao.DataBase;

public class CartDaoImpl extends DataBase implements CartDao {

	@Override
	public ArrayList<Cart> ckCart(String username) {
		String sql = "select productid,bookname,price,discount,num from cart where username='" + username + "'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Cart> clist = new ArrayList<>();
		try {
			while (rs.next()) {
				Cart c = new Cart();
				c.setProductid(rs.getString("productid"));
				c.setBookname(rs.getString("bookname"));
				c.setPrice(rs.getDouble("price"));
				c.setDiscount(rs.getInt("discount"));
				c.setNum(rs.getInt("num"));
				clist.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}

	@Override
	public boolean removeAll(String username) {
		String sql = "delete from cart where username='" + username + "'";
		this.executeDML(sql);
		return true;
	}

	@Override
	public boolean remove(String username, String productid) {
		String sql = "delete from cart where username='" + username + "' and productid='" + productid + "'";
		this.executeDML(sql);
		return true;
	}

	@Override
	public boolean change(String username, String productid, int num) {
		String sql = "update cart set num=" + num + " where username='" + username + "' and productid='" + productid
				+ "'";
		this.executeDML(sql);
		return true;
	}

	@Override
	public int addCart(String username, String productid) {
		boolean flag = findProduct(username, productid);
		if (flag) {
			String sql = "update cart set num=num+1 where username='" + username + "' and productid='" + productid
					+ "'";
			this.executeDML(sql);
		} else {
//			int gwcid = findGwcid(username);
			ProductDaoImpl pdi = new ProductDaoImpl();
			ArrayList<Product> plist = pdi.findBookImg(productid);
			String bookname = null;
			double price = 0;
			int discount = 0;
			for (Product p : plist) {
				bookname = p.getBookname();
				price = p.getPrice();
				discount = p.getDiscount();
			}
			String sql = "insert into cart (username,productid,bookname,price,discount,num) values (?,?,?,?,?,'1')";
			Object[] param = { username, productid, bookname, price, discount };
			this.exeuteDml(sql, param);
		}
		return 0;
	}

	@Override
	public boolean findProduct(String username, String productid) {
		String sql = "select * from cart where username='" + username + "' and productid='" + productid + "'";
		ResultSet rs = this.getResult(sql);
		boolean flag = false;
		try {
			while (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public int findGwcid(String username) {
		String sql = "select gwcid from cart where username='" + username + "'";
		ResultSet rs = this.getResult(sql);
		int gwcid = 0;
		try {
			while (rs.next()) {
				gwcid = rs.getInt("gwcid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gwcid;
	}
	
	public int getnum(String productid) {
		String sql = "select num from cart where productid='"+productid+"'";
		ResultSet rs = this.getResult(sql);
		int num=0;
		try {
			while (rs.next()) {
				num=rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

}
