<%@page import="com.dangdang.dao.DataBase"%>
<%@page import="com.dangdang.daoImpl.AccountDaoImpl"%>
<%@page import="com.dangdang.daoImpl.SignonDaoImpl"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.lang.String"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String username1=request.getParameter("name");
String username=request.getParameter("username");
String password=request.getParameter("password");
String email=request.getParameter("email");
String sex=request.getParameter("sex");
String province=request.getParameter("province");
String city=request.getParameter("city");


DataBase db=new DataBase();
db.deleteSignon(username1);
boolean flag=db.exeuteDml3(username,password,email,sex,province,city);
if(flag){
	response.sendRedirect("signon.jsp");	
}else{
	response.sendRedirect("index.jsp");
}



%>
</body>
</html>