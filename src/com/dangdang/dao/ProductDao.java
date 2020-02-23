package com.dangdang.dao;

import java.util.ArrayList;

import com.dangdang.entity.Cart;
import com.dangdang.entity.Product;

public interface ProductDao {
	
	//����ͼ��id���з�ҳ
	public ArrayList<Product> checkProduct(String catid,int pageNo,int pageSize,String str1,String str2);
	//ͼ��ĳ����������
	public int getCount(String bookname);
	//����ͼ��id�ҵ�ͼ��
	public ArrayList<Product> findProduct(String productid);
	
	public ArrayList<Product> findBookImg(String productid);
	
	public int getqty(String productid);
	
	public void updataqty(ArrayList<Cart> clist);
	
	public void updataqty(String num,String productid);
	
	public int getCount2();
	
	public ArrayList<Product> checkProduct2(String catid,int pageNo,int pageSize);
	
	public void DeleteProduct(String productid);
	
	public void insertProduct(String productid, String catid, String bookname, double score, String author,
			String publish, String pubdate, String descn, double price, int discount, String img,int qty);
}
