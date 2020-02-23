package com.dangdang.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dangdang.dao.DataBase;
import com.dangdang.dao.OrderDao;
import com.dangdang.entity.Cart;
import com.dangdang.entity.Order;

public class OrderDaoImpl extends DataBase implements OrderDao{

	@Override
	public void addOrderinfo(String trade_no, String total_amount, ArrayList<Cart> clist) {
		for (Cart c : clist) {
			String sql = "insert into ordersinfo(trade_no,productid,bookname,price,discount,num,total_amount) values(?,?,?,?,?,?,?)";
			String productid=c.getProductid();
			String bookname=c.getBookname();
			double price=c.getPrice();
			int discount=c.getDiscount();
			int num=c.getNum();
			Object[] param = {trade_no,productid,bookname,price,discount,num,total_amount};
			this.exeuteDml(sql, param);
		}
	}
	
	@Override
	public void addOrderinfo(String trade_no, String total_amount, String productid,String bookname,String price,String discount,String num) {
			String sql = "insert into ordersinfo(trade_no,productid,bookname,price,discount,num,total_amount) values(?,?,?,?,?,?,?)";
			Object[] param = {trade_no,productid,bookname,price,discount,num,total_amount};
			this.exeuteDml(sql, param);
	}

	@Override
	public void addOrder(String username, String out_trade_no, String trade_no, String total_amount) {
		String sql = "insert into orders(username,out_trade_no,trade_no,total_amount) values(?,?,?,?)";
		Object[] param = {username,out_trade_no,trade_no,total_amount};
		this.exeuteDml(sql, param);
	}
	
	@Override
	public ArrayList<Order> searchOrder(String username) {
		String sql = "select trade_no,total_amount from ordersinfo where username='" + username + "'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Order> olist = new ArrayList<>();
		try {
			while (rs.next()) {
				Order o = new Order();
				o.setTrade_no(rs.getString("trade_no"));
				o.setTotal_amount(rs.getString("total_amount"));
				olist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return olist;
	}
	
	@Override
	public ArrayList<Order> searchOrderinfo(String username,ArrayList<Order> tlist) {
		ArrayList<Order> olist = new ArrayList<>();
		for (Order o : tlist) {
			String sql = "select orders.trade_no,orders.total_amount,productid,bookname,price,discount,num from orders join ordersinfo on orders.trade_no=ordersinfo.trade_no where username='"+username+"' and ordersinfo.trade_no='"+o.getTrade_no()+"'";
			ResultSet rs = this.getResult(sql);
			try {
				while (rs.next()) {
					Order o2 = new Order();
					o2.setTrade_no(rs.getString("trade_no"));
					o2.setTotal_amount(rs.getString("total_amount"));
					o2.setProductid(rs.getString("productid"));
					o2.setBookname(rs.getString("bookname"));
					o2.setPrice(rs.getDouble("price"));
					o2.setDiscount(rs.getInt("discount"));
					o2.setNum(rs.getInt("num"));
					olist.add(o2);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return olist;
	}

	@Override
	public int count(String username) {
		String sql = "SELECT COUNT(DISTINCT ordersinfo.trade_no) FROM orders JOIN ordersinfo ON orders.trade_no=ordersinfo.trade_no WHERE username='"+username+"'";
		ResultSet rs = this.getResult(sql);
		int count=0;
		try {
			while (rs.next()) {
				count=rs.getInt("COUNT(DISTINCT ordersinfo.trade_no)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public ArrayList<Order> trad_no(String username) {
		String sql="SELECT DISTINCT ordersinfo.trade_no FROM orders JOIN ordersinfo ON orders.trade_no=ordersinfo.trade_no WHERE username='"+username+"'";
		ResultSet rs = this.getResult(sql);
		ArrayList<Order> tlist=new ArrayList<>();
		try {
			while (rs.next()) {
				Order o=new Order();
				o.setTrade_no(rs.getString("trade_no"));
				tlist.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tlist;
	}

	@Override
	public ArrayList<Order> find(ArrayList<Order> tlist) {
		ArrayList<Order> total_amount=new ArrayList<>();
		for (Order o : tlist) {
			String sql="SELECT distinct total_amount,trade_no FROM orders WHERE trade_no='"+o.getTrade_no()+"'";
			ResultSet rs = this.getResult(sql);
			try {
				while (rs.next()) {
					Order o2=new Order();
					o2.setTrade_no((rs.getString("trade_no")));
					o2.setTotal_amount((rs.getString("total_amount")));
					total_amount.add(o2);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return total_amount;
	}

}
