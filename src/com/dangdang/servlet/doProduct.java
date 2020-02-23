package com.dangdang.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangdang.daoImpl.ProductDaoImpl;
import com.dangdang.entity.Product;

/**
 * Servlet implementation class doProduct
 */
@WebServlet("/doProduct")
public class doProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int pageCount = 0;
	int pageNo = 1, pageSize = 4;
	String catid = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action=request.getParameter("action");
		if("paixu".equals(action)){
			paixu(request,response);
		}else{
			nopaixu(request,response);
		}	
	}


	private void nopaixu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ProductDaoImpl pdi = new ProductDaoImpl();
		HttpSession session=request.getSession();
		if (request.getParameter("catid") != null) {
			catid = request.getParameter("catid");
			session.setAttribute("category", catid);
		} else {
			catid = (String) session.getAttribute("category");
		}
		
		//总页数
		
		int count = pdi.getCount(catid);
		//System.out.print("count"+count);
		if (count % pageSize == 0) {
			pageCount = count / pageSize;
		} else {
			pageCount = count / pageSize + 1;
		}
		
		
		int pageno=0;
		if (session.getAttribute("pageNo") == null || request.getParameter("catid") != null) {
			pageNo = 1;
		} else {
			pageNo = (Integer)session.getAttribute("pageNo");
			pageno=pageNo;
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} 
		
		if(pageNo>pageCount || pageNo<1){
			pageNo=pageno;
		}
		
		
		//上下页
		String flag = request.getParameter("flag");
		
		if ("up".equals(flag)) {
			if (pageNo < pageCount) {
				pageNo++;
			} else {
				pageNo = pageCount;
			}
		} else if ("down".equals(flag)) {
			if (pageNo > 1) {
				pageNo--;
			} else {
				pageNo = 1;
			}
		}
		
		/* System.out.print("pageCount"+pageCount);
		System.out.print("pageNo"+pageNo); */
		session.setAttribute("pageNo", pageNo);
		String str1="";
		String str2="price";
		String a=request.getParameter("a");
//		if("1".equals(a)){
//			str1="";
//			str2="price";
//		}else if("2".equals(a)){
//			str1="desc";
//			str2="price";
//		}else if("3".equals(a)){
//			str1="";
//			str2="discount";
//		}else if("4".equals(a)){
//			str1="desc";
//			str2="discount";
//		}else if("5".equals(a)){
//			str1="";
//			str2="pubdate";
//		}else{
//			str1="desc";
//			str2="pubdate";
//		}
//		
		
		ArrayList<Product> plist = pdi.checkProduct(catid, pageNo, pageSize,str1,str2);
		session.setAttribute("plist", plist);
		session.setAttribute("pageCount", pageCount);
		response.sendRedirect("product.jsp?pageCount=" + pageCount+"&pageNo="+pageNo);
	}


	public void paixu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ProductDaoImpl pdi = new ProductDaoImpl();
		HttpSession session=request.getSession();
		String a=request.getParameter("a");
		String str1="desc";
		String str2="pubdate";
		if("1".equals(a)){
			str1="desc";
			str2="pubdate";
			session.setAttribute("flag", 1);
		}else if("2".equals(a)){
			str1="";
			str2="pubdate";
			session.setAttribute("flag", 2);
		}else if("3".equals(a)){
			str1="";
			str2="price*discount/100";
			session.setAttribute("flag", 3);
		}else if("4".equals(a)){
			str1="desc";
			str2="price*discount/100";
			session.setAttribute("flag", 4);
		}else if("5".equals(a)){
			str1="";
			str2="discount";
			session.setAttribute("flag", 5);
		}else{
			str1="desc";
			str2="discount";
			session.setAttribute("flag", 6);
		}
		
		System.out.println("a:"+a);
		System.out.println("str2:"+str2);
		System.out.println("str1:"+str1);
		System.out.println("-----------------");
		
		ArrayList<Product> plist = pdi.checkProduct(catid, pageNo, pageSize,str1,str2);
		session.setAttribute("plist", plist);
//		response.sendRedirect("product.jsp?pageCount=" + pageCount+"&pageNo="+pageNo);
//		response.sendRedirect("productlist.jsp");
//		nopaixu(request,response);
	}

}
