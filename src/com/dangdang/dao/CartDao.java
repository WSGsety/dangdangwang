package com.dangdang.dao;

import java.util.ArrayList;

import com.dangdang.entity.Cart;

public interface CartDao {
	public ArrayList<Cart> ckCart(String username);

	public boolean removeAll(String username);

	public boolean remove(String username, String productid);

	public boolean change(String username, String productid, int num);

	public int addCart(String username, String productid);

	public boolean findProduct(String username, String productid);
	
	public int findGwcid(String username);
}
