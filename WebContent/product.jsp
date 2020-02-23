<%@page import="com.dangdang.daoImpl.ProductDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dangdang.entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>当当网商品展示页面</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/product.js"></script>
<script>
	$(function($) {

		$("#queding").click(function() {
			var pagenumber = $("#pagenumber").val();
			var str = /^\d+$/;
			if ((str.test(pagenumber))) {
				window.location = "doProduct?pageNo=" + pagenumber;
			}
		})
		var a = "";
		$("#compositor").change(function() {
			a = $(this).find("option:selected").val();

			/* alert(a); */
			$.ajax({
				type : "post",
				url : "doProduct",
				data : {
					a : a,
					action : "paixu"
				},
				success : function(data, textStatus) {
					window.location.reload();

				}
			})
		});
		/* window.onload=function($){
			alert($("#compositor").html);
			$("#compositor").val(a);
		} */
	})
</script>
</head>
<body>
	<div id="header">
		<iframe src="header.jsp" height="155px" width="960px" frameborder="0"></iframe>
	</div>
	<!--中间部分开始-->
	<div id="main">
		<div class="dd_index_top_adver">
			<img src="images/dd_index_top_adver.jpg" alt="通栏广告图片" />
		</div>
		<div class="current_place">
			您现在的位置：<a href="index.jsp">当当图书</a> &gt;&gt; 小说 &gt;&gt; 财经
		</div>

		<!--左侧菜单开始-->
		<div id="product_left">
			<div id="product_catList">
				<div class="product_catList_top">浏览同级分类</div>
				<div id="product_catList_class">
					<!--使用javaScript显示图书分类-->
				</div>
			</div>
			<div class="product_catList_end">
				<img src="images/product_01.gif" alt="shopping" /> <img
					src="images/product_02.gif" alt="shopping" />
			</div>
		</div>

		<!--右侧内容开始-->
		<div id="product_storyList">
			<div id="product_storyList_top">
				<ul>
					<li>排序方式</li>
					<li><img src="images/dd_arrow_right.gif" alt="arrow" /></li>
					<li><c:if test="${sessionScope.flag=='1' }">
							<select id="compositor">
								<option value="1" selected="selected">按出版时间 降序</option>
								<option value="2">按出版时间 升序</option>
								<option value="3">按价格 升序</option>
								<option value="4">按价格 降序</option>
								<option value="5">按折扣 升序</option>
								<option value="6">按折扣 降序</option>
							</select>
						</c:if> <c:if test="${sessionScope.flag=='2' }">
							<select id="compositor">
								<option value="1">按出版时间 降序</option>
								<option value="2" selected="selected">按出版时间 升序</option>
								<option value="3">按价格 升序</option>
								<option value="4">按价格 降序</option>
								<option value="5">按折扣 升序</option>
								<option value="6">按折扣 降序</option>
							</select>
						</c:if> <c:if test="${sessionScope.flag=='3' }">
							<select id="compositor">
								<option value="1">按出版时间 降序</option>
								<option value="2">按出版时间 升序</option>
								<option value="3" selected="selected">按价格 升序</option>
								<option value="4">按价格 降序</option>
								<option value="5">按折扣 升序</option>
								<option value="6">按折扣 降序</option>
							</select>
						</c:if> <c:if test="${sessionScope.flag=='4' }">
							<select id="compositor">
								<option value="1">按出版时间 降序</option>
								<option value="2">按出版时间 升序</option>
								<option value="3">按价格 升序</option>
								<option value="4" selected="selected">按价格 降序</option>
								<option value="5">按折扣 升序</option>
								<option value="6">按折扣 降序</option>
							</select>
						</c:if> <c:if test="${sessionScope.flag=='5' }">
							<select id="compositor">
								<option value="1">按出版时间 降序</option>
								<option value="2">按出版时间 升序</option>
								<option value="3">按价格 升序</option>
								<option value="4">按价格 降序</option>
								<option value="5" selected="selected">按折扣 升序</option>
								<option value="6">按折扣 降序</option>
							</select>
						</c:if> <c:if test="${sessionScope.flag=='6' }">
							<select id="compositor">
								<option value="1">按出版时间 降序</option>
								<option value="2">按出版时间 升序</option>
								<option value="3">按价格 升序</option>
								<option value="4">按价格 降序</option>
								<option value="5">按折扣 升序</option>
								<option value="6" selected="selected">按折扣 降序</option>
							</select>
						</c:if></li>
					<li><img src="images/product_icon_01.gif" alt="icon" /></li>
					<li><img src="images/product_icon_02.gif" alt="icon" /></li>
					<li><img src="images/product_icon_03.gif" alt="icon" /></li>
					<li><img src="images/product_icon_04.gif" alt="icon" /></li>
					<li>每页显示的数量</li>
					<li><img src="images/dd_arrow_right.gif" alt="arrow" /></li>
					<li><img src="images/product_icon_20.gif" alt="icon" /></li>
					<li><img src="images/product_icon_40.gif" alt="icon" /></li>
					<li style="float: right; padding-right: 10px;"><img
						src="images/product_page_down.gif" alt="icon" /></li>
					<li style="float: right;">第1页</li>
					<li style="float: right;"><img
						src="images/product_page_up.gif" alt="icon" /></li>
				</ul>
			</div>
			<div id="product_array">
				<a class="click" name="array" href="javascript:void(0)">列表</a> <a
					name="bigImg" href="javascript:void(0)">大图</a>
			</div>
			<!-- 列表开始 -->
			<div id="product_storyList_content" class="product_storyList_content">

				<!-- 当前图书页数 -->
				<c:set var="pageNo" scope="request" value="${request.pageNo}" />
				<!-- <iframe src="productlist.jsp" height="155px" width="960px" frameborder="0"></iframe> -->
				<!--图书排列开始-->

				<!-- 总页数 -->
				<%-- <c:set var="pageCount" scope="request" value="${request.pageCount}"/> --%>

				<c:forEach var="p" items="${plist}" begin="0" end="5">
					<div class="product_storyList_content_left">
						<img src="${p.img}" alt="图书列表" style="width: 90px; height: 90px" />
					</div>
					<div class="product_storyList_content_right">
						<ul>
							<li class="product_storyList_content_dash"><a href="#"
								class="blue_14">${p.bookname}</a></li>
							<li id="red">顾客评分：<span style="color: red">${p.score}</span>
								分
							</li>
							<li>作 者：<a href="#" class="blue_14">${p.author}</a> 著
							</li>
							<li>出版社：<a href="#" class="blue_14">${p.publish}</a></li>
							<li>出版时间：${p.pubdate}</li>
							<li>${p.descn}</li>
							<li>
								<dl class="product_content_dd">
									<dd>
										<a
											href="doCart?action=AddCart&productid=${p.productid}&username=${sessionScope.username}"><img
											src="images/product_buy_02.gif" alt="shopping" /></a>
									</dd>
									<c:if test="${sessionScope.username!=null}" var="flag">
										<dd>
											<a
												href="doOrder?action=buy&productid=${p.productid}&bookname=${p.bookname}&price=${p.price}&num=1&discount=${p.discount}"><img
												src="images/product_buy_01.gif" alt="shopping" /></a>
										</dd>
									</c:if>
									<c:if test="${not flag }">
										<dd>
											<a href="login.jsp"><img src="images/product_buy_01.gif"
												alt="shopping" /></a>
										</dd>
									</c:if>
									<dd>
										节省：￥
										<fmt:formatNumber type="number"
											value="${p.price-p.price*p.discount/100}" pattern="0.00" />
									</dd>
									<dd>
										折扣：<span>${p.discount}折</span>
									</dd>
									<dd class="footer_dull_red">
										<span>￥<fmt:formatNumber type="number"
												value="${p.price*p.discount/100}" pattern="0.00" /></span>
									</dd>
									<dd class="product_content_delete">
										<span>￥${p.price}</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="product_storyList_content_bottom"></div>
				</c:forEach>

			</div>
			<div>
				<dl class="product_content_dd">
					<!-- 确定(跳转) -->
					<dd>
						<input type="submit" id="queding" value="跳转"></input>
					</dd>
					<dd>页</dd>
					<!-- 文本框 -->
					<dd>
						<input id="pagenumber" name="page" type="text" value="1"
							style="width: 20px;" />
					</dd>
					<dd>跳转到第</dd>
					<dd>
						<a href="doProduct?flag=up&pageNo=${pageNo}"><img
							src="images/next.gif" alt="ok" /></a>
					</dd>
					<dd>
						<ul id="product_page">

							<c:forEach var="tt" begin="1" end="${sessionScope.pageCount }">
								<li><a href="doProduct?pageNo=${tt}" class="product_page">${tt }</a></li>
							</c:forEach>

						</ul>
					</dd>
					<dd>
						<a href="doProduct?flag=down&pageNo=${pageNo}"><img
							src="images/product_page_up.gif" alt="ok" /></a>
					</dd>
				</dl>
			</div>
		</div>
		<!--右侧内容结束-->
	</div>
	<!--网站版权部分开始-->
	<div id="footer">
		<div class="footer_top">
			<a href="#" target="_parent" class="footer_dull_red">公司简介</a> | <a
				href="#" target="_parent" class="footer_dull_red">诚证英才</a> | <a
				href="#" target="_parent" class="footer_dull_red">网站联盟</a> | <a
				href="#" target="_parent" class="footer_dull_red">百货招商</a> | <a
				href="#" target="_parent" class="footer_dull_red">交易条款</a>
		</div>
		<iframe src="footer.jsp" height="50px" width="900px" frameborder="0"></iframe>
	</div>
</body>
</html>