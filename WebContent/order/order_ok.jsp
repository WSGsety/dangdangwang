<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 当当网</title>
		<link href="../css/global.css" rel="stylesheet" type="text/css" />
    	<link href="../css/layout.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<!-- <script>
			     setTimeout('window.location="../index.jsp"',3000)    
	    </script> -->
	</head>
	<body>
		<div id="header">
    	<iframe src="../header.jsp" height="155px" width="960px" frameborder="0"></iframe>
	</div>
		<div class="login_step">
			生成订单步骤: 1.确认订单 > 2.填写送货地址 >
			<span class="red_bold">3.订单成功</span>
		</div>


		<div class="login_success">
			<div class="login_bj">
				<div class="succ">
					<!-- <img src="../images/login_success.jpg" /> -->
				</div>
				<h5>
					订单已经生成
				</h5>
				<h6>
					<%-- 您刚刚生成的订单号是：${order.id}， --%>金额总计<fmt:formatNumber type="number" value="${sessionScope.total}" pattern="0.00"/>
				</h6>

				<ul>
					<li class="nobj">
						您现在可以：
					</li>
					<li>
						<a href="../alipay/index.jsp?WIDtotal_amount=<fmt:formatNumber type="number" value="${sessionScope.total}" pattern="0.00"/>"><img src="../images/shopping_balance.gif"/></a>
						<a href="../main/main.jsp">继续浏览并选购商品</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="footer">
    <div class="footer_top"><a href="#" target="_parent" class="footer_dull_red">公司简介</a> | <a href="#" target="_parent" class="footer_dull_red">诚证英才</a> | <a href="#" target="_parent" class="footer_dull_red">网站联盟</a> | <a href="#" target="_parent" class="footer_dull_red">百货招商</a> | <a href="#" target="_parent" class="footer_dull_red">交易条款</a></div>
    <iframe src="../footer.jsp" height="50px" width="900px" frameborder="0"></iframe>
</div>
	</body>
</html>

