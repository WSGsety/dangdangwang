<%@page import="com.dangdang.dao.DataBase"%>
<%@page import="com.dangdang.daoImpl.AccountDaoImpl"%>
<%@page import="com.dangdang.daoImpl.SignonDaoImpl"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.lang.Integer"%>
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
String username=request.getParameter("username");
DataBase db=new DataBase();
boolean flag=db.deleteSignon(username);
if(flag){
	response.sendRedirect("signon.jsp");	
}else{
	response.sendRedirect("index.jsp");
}



%>
</body>
</html>