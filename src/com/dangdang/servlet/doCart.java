package com.dangdang.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangdang.daoImpl.CartDaoImpl;
import com.dangdang.daoImpl.ProductDaoImpl;
import com.dangdang.entity.Cart;

@WebServlet("/doCart")
public class doCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("Cart".equals(action)) {
			Cart(request, response);
		} else if ("Remove".equals(action)) {
			Remove(request, response);
		} else if ("RemoveAll".equals(action)) {
			RemoveAll(request, response);
		} else if ("Change".equals(action)) {
			Change(request, response);
		} else if ("AddCart".equals(action)) {
			AddCart(request, response);
		}
	}

	public void AddCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String username = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		String username=request.getParameter("username");
//		System.out.println("Add:"+username);
		String productid = request.getParameter("productid");
		ProductDaoImpl pdi=new ProductDaoImpl();
		int qty=pdi.getqty(productid);
		CartDaoImpl cdi = new CartDaoImpl();
		int num=cdi.getnum(productid);
		if((num+1)>qty){
			response.sendRedirect("product.jsp");
		}else{
			cdi.addCart(username, productid);
			Cart(request, response);
		}
	}

	public void Cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double total = 0;
		double less = 0;
		double integral = 0;
		HttpSession session = request.getSession();
		String username=request.getParameter("username");
		if("".equals(username)){
			response.sendRedirect("login.jsp");
		}else{
//			System.out.println("CART:"+username);
			CartDaoImpl cdi = new CartDaoImpl();
			ArrayList<Cart> clist1 = cdi.ckCart(username);
			session.setAttribute("cartlist", clist1);
			for (Cart c : clist1) {
				total = total + c.getPrice() * c.getDiscount() / 100 * c.getNum();
				less = less + c.getPrice() * (100 - c.getDiscount()) / 100 * c.getNum();
				integral = integral + c.getPrice() * c.getDiscount() / 10 * c.getNum();
			}
			session.setAttribute("total", total);
			session.setAttribute("less", less);
			session.setAttribute("integral", integral);
			response.sendRedirect("shopping.jsp");
		}
	
	}

	public void Change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		double total = 0;
		double less = 0;
		double integral = 0;
//		String username = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		String username=request.getParameter("username");
//		System.out.println("Change:"+username);
		String productid = request.getParameter("productid");
		int num = Integer.parseInt(request.getParameter("num"));
		ProductDaoImpl pdi=new ProductDaoImpl();
		int qty=pdi.getqty(productid);
		if(num>qty){
			response.sendRedirect("shopping.jsp");
		}else{
			CartDaoImpl cdi = new CartDaoImpl();
			cdi.change(username, productid, num);
			HttpSession session = request.getSession();
			ArrayList<Cart> clist1 = cdi.ckCart(username);
			session.setAttribute("cartlist", clist1);
			for (Cart c : clist1) {
				total = total + c.getPrice() * c.getDiscount() / 100 * c.getNum();
				less = less + c.getPrice() * (100 - c.getDiscount()) / 100 * c.getNum();
				integral = integral + c.getPrice() * c.getDiscount() / 10 * c.getNum();
			}
			session.setAttribute("total", total);
			session.setAttribute("less", less);
			session.setAttribute("integral", integral);
		}
	}

	public void Remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
//		System.out.println("Remove:"+username);
		String productid = request.getParameter("productid");
		CartDaoImpl cdi = new CartDaoImpl();
		cdi.remove(username, productid);
		Cart(request, response);
	}

	public void RemoveAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
//		System.out.println("RemoveAll:"+username);
		CartDaoImpl cdi = new CartDaoImpl();
		cdi.removeAll(username);
		Cart(request, response);
	}

}
