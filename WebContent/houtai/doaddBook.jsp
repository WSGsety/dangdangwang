<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
 <%@page import="com.dangdang.dao.DataBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String bookname=request.getParameter("bookname");
	String productid=request.getParameter("productid");
	String catid=request.getParameter("catid");
	String descn=request.getParameter("descn");
	String score1=request.getParameter("score");
	double score=Integer.parseInt(score1);
	String author=request.getParameter("author");
	String publish=request.getParameter("publish");
	String pubdate=request.getParameter("pubdate");
	String price1=request.getParameter("price");
	double price=Integer.parseInt(price1);
	String discount1=request.getParameter("discount");
	int discount=Integer.parseInt(discount1);
	String img=request.getParameter("img");
	String qty1=request.getParameter("qty");
	int qty=Integer.parseInt(qty1);
	
	DataBase db=new DataBase();
	boolean flag=db.exeuteDml4(productid,catid,bookname,score,author,publish,pubdate,descn,price,discount,img,qty);
	if(flag){	
		//如果跳入doproduct.jsp页面,则会报错
		response.sendRedirect("product.jsp");	
	}else{
		response.sendRedirect("index.jsp");
	}



	%>
</body>
</html>