package com.dangdang.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dangdang.dao.ProductDao;
import com.dangdang.entity.Cart;
import com.dangdang.entity.Product;
import com.dangdang.dao.DataBase;

public class ProductDaoImpl extends DataBase implements ProductDao {

	@Override
	public ArrayList<Product> checkProduct(String catid, int pageNo, int pageSize, String str1, String str2) {
		String sql = "select productid,bookname,score,author,publish,pubdate,descn,price,discount,img from Product where category='"
				+ catid + "' order by " + str2 + " " + str1 + " limit " + (pageNo - 1) * pageSize + "," + pageSize;
		ResultSet rs = this.getResult(sql);
		ArrayList<Product> plist = new ArrayList<>();
		try {
			while (rs.next()) {
				Product pd = new Product();
				pd.setProductid(rs.getString("productid"));
				pd.setBookname(rs.getString("bookname"));
				pd.setScore(rs.getString("score"));
				pd.setAuthor(rs.getString("author"));
				pd.setPublish(rs.getString("publish"));
				pd.setPubdate(rs.getString("pubdate"));
				pd.setDescn(rs.getString("descn"));
				pd.setPrice(rs.getDouble("price"));
				pd.setDiscount(rs.getInt("discount"));
				pd.setImg(rs.getString("img"));
				plist.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}

	@Override
	public int getCount(String catid) {
		int count = 0;
		String sql = "select count(*) from Product where category=" + catid;
		ResultSet rs = this.getResult(sql);
		try {
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<Product> findProduct(String productid) {
		String sql = "select productid,bookname,descn,price from product";
		ResultSet rs = this.getResult(sql);
		ArrayList<Product> plist = new ArrayList<>();
		try {
			while (rs.next()) {
				Product pd = new Product();
				pd.setBookname(rs.getString("bookname"));
				pd.setDescn(rs.getString("descn"));
				plist.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}

	@Override
	public ArrayList<Product> findBookImg(String productid) {
		String sql = "select bookname,price,discount from product where productid='" + productid + "'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Product> plist = new ArrayList<>();
		try {
			while (rs.next()) {
				Product pd = new Product();
				pd.setBookname(rs.getString("bookname"));
				pd.setPrice(rs.getDouble("price"));
				pd.setDiscount(rs.getInt("discount"));
				plist.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}

	public int getqty(String productid) {
		String sql = "select qty from product where productid='" + productid + "'";
		ResultSet rs = this.getResult(sql);
		int qty = 0;
		try {
			while (rs.next()) {
				qty = rs.getInt("qty");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qty;
	}

	@Override
	public void updataqty(ArrayList<Cart> clist) {
		for (Cart c : clist) {
			String sql = "update product set qty=qty-" + c.getNum() + " where  productid='" + c.getProductid() + "'";
			this.executeDML(sql);
		}
	}

	@Override
	public void updataqty(String num,String productid) {
		String sql = "update product set qty=qty-" + num + " where  productid='" +productid + "'";
		this.executeDML(sql);
	}

	@Override
	public int getCount2() {
		int count = 0;
		String sql = "select count(*) from Product";
		ResultSet rs = this.getResult(sql);
		try {
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public ArrayList<Product> checkProduct2(String catid,int pageNo,int pageSize) {
		String sql = "select productid,bookname,score,author,publish,pubdate,descn,price,discount from Product"+" limit "
				+ (pageNo - 1) * pageSize + "," + pageSize;
		ResultSet rs = this.getResult(sql);
		ArrayList<Product> plist = new ArrayList<>();
		try {
			while (rs.next()) {
				Product pd = new Product();
				pd.setProductid(rs.getString("productid"));
				pd.setBookname(rs.getString("bookname"));
				pd.setScore(rs.getString("score"));
				pd.setAuthor(rs.getString("author"));
				pd.setPublish(rs.getString("publish"));
				pd.setPubdate(rs.getString("pubdate"));
				pd.setDescn(rs.getString("descn"));
				pd.setPrice(rs.getDouble("price"));
				pd.setDiscount(rs.getInt("discount"));
				plist.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	@Override
	public void DeleteProduct(String productid) {
		String sql = "delete from product where productid=? ";
		Object[] param = {productid};
		this.exeuteDml(sql, param);
	}
	
	@Override
	public void insertProduct(String productid, String catid, String bookname, double score, String author,
			String publish, String pubdate, String descn, double price, int discount,String img,int qty) {
		String sql = "insert into product(productid,category,bookname,score,author,publish,pubdate,descn,price,discount,img,qty) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = {productid,catid,bookname,score,author,publish,pubdate,descn,price,discount,img,qty};
//		System.out.println(productid+"--"+bookname);
		exeuteDml(sql, param);
	}
}
