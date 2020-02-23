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
String productid=request.getParameter("productid");
DataBase db=new DataBase();
boolean flag=db.deleteProduct(productid);
if(flag){
	response.sendRedirect("signon.jsp");	
}else{
	response.sendRedirect("index.jsp");
}



%>
</body>
</html>