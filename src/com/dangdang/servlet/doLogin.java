package com.dangdang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dangdang.daoImpl.SignonDaoImpl;

/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/doLogin")
public class doLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		String username=request.getParameter("Username");
		String password=request.getParameter("Password");
		SignonDaoImpl sdi=new SignonDaoImpl();
		boolean flag=sdi.judgeSignon(username, password);
		int i=sdi.judgeAdmin(username);
		if(flag){
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			if(i==0){
				response.sendRedirect("index.jsp");	
			}else{
				response.sendRedirect("houtai/index.jsp");
			}
		}else{
			response.sendRedirect("login.jsp");
		}
    }

}
