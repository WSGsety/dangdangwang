<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dangdang.daoImpl.ProductDaoImpl"%>
<%@page import="com.dangdang.entity.Product"%>
<%@page import="com.dangdang.dao.DataBase"%>
 

<%  
	String catid = null;
	ProductDaoImpl pdi = new ProductDaoImpl();
	int pageNo = 1, pageSize = 5;


	
	//总页数
	int pageCount = 0;
	int count = pdi.getCount2();
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
	
	

	

	session.setAttribute("pageNo", pageNo);
	session.setAttribute("pageCount", pageCount);
	ArrayList<Product> plist = pdi.checkProduct2(catid, pageNo, pageSize);
	session.setAttribute("plist", plist);
	response.sendRedirect("product.jsp?pageCount=" + pageCount+"&pageNo="+pageNo);
	 %>
	 
	