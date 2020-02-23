<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>我的订单 - 当当网</title>
		<link href="css/page_bottom.css" rel="stylesheet" type="text/css" />
		<link href="css/global.css" rel="stylesheet" type="text/css" />
		<link href="css/login.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div id="header">
    	<iframe src="header.jsp" height="155px" width="960px" frameborder="0"></iframe>
	</div> 
		<div class="fill_message">

			<table class="tab_login">
			
				<tr>
					<td valign="top" class="w1" style="text-align: left">
						<b>序号</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品名称</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品单价</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品数量</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>小计</b>
					</td>
				</tr>

				<!-- 订单开始 -->
				<c:forEach var="i" items="${sessionScope.list }">
				<tr>
					<td valign="top" class="w1" style="text-align: left" colspan="5">
						<b>订单编号：${i.trade_no}</b>
					</td>
				</tr>
				<%-- <c:set var="flag" scope="page" value="${i.trade_no}" /> --%>
				<c:set var="index" scope="page" value="1"/>
				<c:forEach items="${sessionScope.olist}" var="o" varStatus="status">
				<c:if test="${i.trade_no==o.trade_no}">
				
				   <tr>
						<td valign="top">
							${index}
							<c:set var="index" scope="page" value="${index+1}"/>
						</td>
						<td valign="top">
						  ${o.bookname}
						</td>
						<td valign="top">
							<fmt:formatNumber type="number" value="${o.price*o.discount/100}" pattern="0.00"/>
						</td>
						<td valign="top">
							${o.num}
						</td>
						<td valign="top">
							<fmt:formatNumber type="number" value="${o.price*o.discount/100*o.num}" pattern="0.00"/>
						</td>
					</tr>
				<%-- <c:set var="flag" scope="page" value="2" /> --%>
				</c:if>
				</c:forEach>	
				<tr>
					<td valign="top" class="w1" style="text-align: left" colspan="5">
						<b>总计：<fmt:formatNumber type="number" value="${i.total_amount}" pattern="0.00"/></b>
					</td>
				</tr>
			</c:forEach>
				<!-- 订单结束 -->
			</table>
			<br />
			<br />
			<br />
			

		</div>
		<div id="footer">
    <div class="footer_top"><a href="#" target="_parent" class="footer_dull_red">公司简介</a> | <a href="#" target="_parent" class="footer_dull_red">诚证英才</a> | <a href="#" target="_parent" class="footer_dull_red">网站联盟</a> | <a href="#" target="_parent" class="footer_dull_red">百货招商</a> | <a href="#" target="_parent" class="footer_dull_red">交易条款</a></div>
    <iframe src="footer.jsp" height="50px" width="900px" frameborder="0"></iframe>
</div>

	</body>
</html>

