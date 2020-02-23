<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>生成订单 - 当当网</title>
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<link href="../css/global.css" rel="stylesheet" type="text/css" />
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<style>
		
		</style>
	</head>
	<body>
	<div id="header">
    	<iframe src="../header.jsp" height="155px" width="960px" frameborder="0"></iframe>
	</div> 
		<div class="login_step">
			生成订单骤:
			<span class="red_bold">1.确认订单</span> > 2.填写送货地址 > 3.订单成功
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
				<c:if test="${param.bookname=='null'}" var="flag">
					<c:forEach items="${sessionScope.cartlist}" var="cartlist" varStatus="status">
					   <tr>
							<td valign="top">
								${status.index+1}
							</td>
							<td valign="top">
							  ${cartlist.bookname}
							</td>
							<td valign="top">
								<fmt:formatNumber type="number" value="${cartlist.price*cartlist.discount/100}" pattern="0.00"/>
							</td>
							<td valign="top">
								${cartlist.num}
							</td>
							<td valign="top">
								<fmt:formatNumber type="number" value="${cartlist.price*cartlist.discount/100*cartlist.num}" pattern="0.00"/>
							</td>
						</tr>
					</c:forEach>
					<tr>
					<td valign="top" class="w1" style="text-align: left" colspan="5">
						<b>总计：<fmt:formatNumber type="number" value="${sessionScope.total}" pattern="0.00"/></b>
					</td>
				</tr>
				</c:if>
				<c:if test="${not flag}">
					   <tr>
							<td valign="top">
								1
							</td>
							<td valign="top">
							  ${param.bookname}
							  <c:set var="name" scope="session" value="${param.bookname}"/>
							</td>
							<td valign="top">
								<fmt:formatNumber type="number" value="${param.price*param.discount/100}" pattern="0.00"/>
								<c:set var="price" scope="session" value="${param.price}"/>
								<c:set var="discount" scope="session" value="${param.discount}"/>
							</td>
							<td valign="top">
								${param.num}
								<c:set var="num" scope="session" value="${param.num}"/>
							</td>
							<td valign="top">
								<fmt:formatNumber type="number" value="${param.price*param.discount/100*param.num}" pattern="0.00"/>
							</td>
						</tr>
						<tr>
					<td valign="top" class="w1" style="text-align: left" colspan="5">
						<b>总计：<fmt:formatNumber type="number" value="${param.price*param.discount/100*param.num}" pattern="0.00"/></b>
						<c:set var="total" scope="session" value="${param.price*param.discount/100*param.num}"/>
					</td>
				</tr>
				</c:if>
				<!-- 订单结束 -->
				
			</table>
			<br />
			<br />
			<br />
			<div class="login_in">
				<a href="../doCart?action=Cart"><input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="取消" /></a>
			
				<a href="address_form.jsp"><input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="下一步" /></a>
		
			</div>

		</div>
		<div id="footer">
    <div class="footer_top"><a href="#" target="_parent" class="footer_dull_red">公司简介</a> | <a href="#" target="_parent" class="footer_dull_red">诚证英才</a> | <a href="#" target="_parent" class="footer_dull_red">网站联盟</a> | <a href="#" target="_parent" class="footer_dull_red">百货招商</a> | <a href="#" target="_parent" class="footer_dull_red">交易条款</a></div>
    <iframe src="../footer.jsp" height="50px" width="900px" frameborder="0"></iframe>
</div>

	</body>
</html>

