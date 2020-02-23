package com.dangdang.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangdang.daoImpl.OrderDaoImpl;
import com.dangdang.daoImpl.ProductDaoImpl;
import com.dangdang.entity.Order;

@WebServlet("/doOrder")
public class doOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action=request.getParameter("action");
		if("search".equals(action)){
			String username=(String) session.getAttribute("username");
			if(username!=null){
				OrderDaoImpl odi=new OrderDaoImpl();
				ArrayList<Order> tlist=odi.trad_no(username);
				ArrayList<Order> list=odi.find(tlist);
				ArrayList<Order> olist = odi.searchOrderinfo(username, tlist);
				session.setAttribute("olist", olist);
				session.setAttribute("list", list);
				response.sendRedirect("order.jsp");	
			}else{
				response.sendRedirect("login.jsp");	
			}
		}else if("buy".equals(action)){
			ProductDaoImpl pdi=new ProductDaoImpl();
			String productid=request.getParameter("productid");
			session.setAttribute("productid", productid);
			int qty=pdi.getqty(productid);
			if(qty>0){
				request.setCharacterEncoding("UTF-8");
				String bookname = request.getParameter("bookname");
				bookname=new String(bookname.getBytes("UTF-8"),"ISO-8859-1");
				String price = request.getParameter("price");
				String discount = request.getParameter("discount");
				response.sendRedirect("order/order_info.jsp?bookname="+bookname+"&price="+price+"&num=1&discount="+discount);	
			}else{
				response.sendRedirect("product.jsp");	
			}
		}
	}

}
