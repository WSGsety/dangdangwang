package com.dangdang.dao;

import java.util.ArrayList;

import com.dangdang.entity.Cart;
import com.dangdang.entity.Order;

public interface OrderDao {
	void addOrder(String username, String out_trade_no, String trade_no, String total_amount);

	void addOrderinfo(String trade_no, String total_amount, ArrayList<Cart> clist);

	public ArrayList<Order> searchOrder(String username);

	public ArrayList<Order> searchOrderinfo(String trade_no, ArrayList<Order> tlist);

	public int count(String username);

	public ArrayList<Order> trad_no(String username);

	public ArrayList<Order> find(ArrayList<Order> tlist);

	public void addOrderinfo(String trade_no, String total_amount,
			String productid, String bookname, String price, String discount, String num);

}
