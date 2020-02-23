package com.dangdang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dangdang.dao.DataBase;
import com.dangdang.daoImpl.SignonDaoImpl;

@WebServlet("/doRegist")
public class doRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String email=request.getParameter("email"); 
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sex=request.getParameter("sex");
		String province="";
		if("请选择省/城市".equals(request.getParameter("province"))){
			province="";
		}else{
			province=request.getParameter("province");
		}
		String city="";
		if("请选择城市/地区".equals(request.getParameter("city"))){
			city="";
		}else{
			city=request.getParameter("city");
		}
		boolean flag=new SignonDaoImpl().findSignon(username);
		if(flag){
			DataBase db=new DataBase();
			boolean flag2=db.exeuteDml2(email,username,password,sex,province,city);
			if(flag2){
				response.sendRedirect("register_ok.jsp?username="+username+"&email="+email);	
			}else{
				response.sendRedirect("register.jsp");
			}
		}else{
			response.sendRedirect("register.jsp");
		}
	}

}
