<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dangdang.daoImpl.CategoryDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dangdang.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>当当网站导航部分</title>
    <link href="css/global.css" rel="stylesheet" type="text/css" />
    <link href="css/template.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/header.js"></script>
</head>
<body>
<!--顶部开始-->
<div class="header_top">
    <div class="header_top_left">您好！欢迎光临当当网 
	    <c:if test="${ sessionScope.username!=null}" var="flag">
				[<a href="doInvalidate" target="_parent">注销</a> | welcome <a href="#" id="username">${ sessionScope.username}</a>]
		</c:if>
		<c:if test="${not flag}">
	            [<a href="register.jsp" target="_parent">注册</a> | <a href="login.jsp" target="_parent">登录</a>]
		</c:if>
    </div>
    <div class="header_top_right">
        <ul>
            <li><a href="#" target="_self">帮助</a></li>
            <li>|</li>
            <li id="menu"><a href="#" target="_self">我的当当</a> <img src="images/dd_arrow_down.gif" alt="arrow" />
                <div id="dd_menu_top_down">
                    <a href="doOrder?action=search" target="_parent">我的订单</a><br />
                    <a href="#" target="_self">账户余额</a><br />
                    <a href="#" target="_self">购物礼券</a><br />
                    <a href="#" target="_self">我的会员积分</a><br />
                </div>
            </li>
            <li>|</li>
            <li><a href="#" target="_self">团购</a></li>
            <li>|</li>
            <li><a href="#" target="_self">礼品卡</a></li>
            <li>|</li>
            <li><a href="#" target="_self">个性化推荐</a></li>
            <li>|</li>
            <li><a href="doCart?action=Cart&username=${sessionScope.username}" target="_parent">购物车</a></li>
            <li><img src="images/dd_header_shop.gif" alt="shopping"/></li>
        </ul>
    </div>
</div>
<!--导航开始-->
<div class="header_middle">
    <div class="logo"><img src="images/dd_logo.gif" alt="logo"/></div>
    <div class="menu_left">
        <dl>
            <dd class="menu_left_first"></dd>
        </dl>
        
        
        <!-- 上面导航栏 -->
        <ul id="menu_left_bold">
        <li><a href="index.jsp" target="_parent" class="bold">首页</a></li>
            <li>|</li>
        <%
            CategoryDaoImpl cdi = new CategoryDaoImpl();
	  		ArrayList<Category> clist= cdi.checkCategory();
	  		request.setAttribute("clist",clist);
	  	%>
	  	<c:set var="flag" scope="session" value="1"/>
	  	<c:forEach var="c" items="${clist}" begin="0" end="11">
			<li><a href="doProduct?catid=${c.catid}" target="_parent" class="bold">${c.name }</a></li>
			<li>|</li>
		</c:forEach>
        </ul>
        
        
        
        <dl>
            <dd class="menu_left_end"></dd>
        </dl>
    </div>
    <div class="menu_right" id="menu_dull_red">
        <ul>
            <li class="menu_right_1"><a href="#" target="_self">商店街</a></li>
            <li class="menu_right_2"><a href="#" target="_self">促销</a></li>
            <li class="menu_right_3"><a href="#" target="_self">当当<img src="images/dd_header_top.png" alt="榜" /></a>
            </li>
            <li class="menu_right_2"><a href="#" target="_self">社区</a></li>
            <li class="menu_right_3"><a href="#" target="_self">在线读书</a></li>
        </ul>
    </div>
    <div class="menu">
        <div class="menu_first"></div>
        <div id="menu_white">
  
        
        <%
            CategoryDaoImpl cdi1 = new CategoryDaoImpl();
	  		ArrayList<Category> clist1= cdi1.checkCategory();
	  		request.setAttribute("clist1",clist1);
	  	%>
	  	<c:forEach var="c" items="${clist1}" begin="0" end="11">
			<a href="doProduct?catid=${c.catid}"  target="_parent" class="menu_mid_white">${c.name }</a>|
	
		</c:forEach>
       <a href="#" target="_self" class="menu_mid_white">图书促销</a>|
            <a href="#" target="_self" class="menu_mid_white">所有图书分类</a>
        </div>
        <div class="menu_end"></div>
    </div>
</div>
<!--搜索开始-->
<div class="header_search">
    <div class="header_serach_left"></div>
    <div class="header_serach_mid">
        <ul id="header_serach_mid_menu">
            <li><input id="header_serach" type="text" class="header_input_search" /></li>
            <li><input type="image" class="header_secrch_btn" src="images/dd_header_search_btn.jpg" /></li>
            <li><img src="images/dd_arrow_right.gif" alt="arrow"/> <a href="#" target="_self">高级搜索</a></li>
            <li>|</li>
            <li><img src="images/dd_header_search_top.jpg" alt="搜索风云榜"/></li>
            <li><a href="#" target="_self">雅思</a></li>
            <li>|</li>
            <li><a href="#" target="_self">建造师</a></li>
            <li>|</li>
            <li><a href="#" target="_self">中里巴人</a></li>
            <li>|</li>
            <li><a href="#" target="_self">注会</a></li>
            <li>|</li>
            <li><a href="#" target="_self">新概念英语</a></li>
            <li>|</li>
            <li><a href="#" target="_self">更多&gt;&gt;</a></li>
        </ul>


    </div>
    <div class="header_serach_right"></div>
</div>
</body>
</html>