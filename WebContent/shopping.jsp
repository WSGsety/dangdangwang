<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>当当网购物车页面</title>
    <link href="css/global.css" rel="stylesheet" type="text/css" />
    <link href="css/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
   	<script type="text/javascript" src="js/shopping.js"></script>
   <!-- 	<script>
   	$(function(){
	   	$(".shopping_list_end_1").children("a").click(function(){
	    	alert("123");
	    	var vNow = new Date();
			var sNow = "";
			sNow += String(vNow.getFullYear());
			sNow += String(vNow.getMonth() + 1);
			sNow += String(vNow.getDate());
			sNow += String(vNow.getHours());
			sNow += String(vNow.getMinutes());
			sNow += String(vNow.getSeconds());
			sNow += String(vNow.getMilliseconds());
			var total=$("#product_total").text();
			alert(total);
			$.ajax({
				type:"get",
				url:"OrderServlet",
				data:{
					WIDout_trade_no: sNow,
					WIDsubject: "当当网订单",
					WIDtotal_amount: total,
					WIDbody: "当当网"+sNow
				}
			})
	    })
   	})

   	</script> -->
</head>

<body>
<div id="header"><iframe src="header.jsp" height="155px" width="960px" frameborder="0"></iframe></div>
<!--中间部分开始-->
<div id="main">
    <div>&nbsp;&nbsp;<img src="images/shopping_myshopping.gif" alt="shopping"/> <a href="#">全场免运费活动中</a></div>
    <!--为您推荐商品开始-->
    <div class="shopping_commend">
        <div class="shopping_commend_left"><span id="Username">${sessionScope.username}</span>根据您挑选的商品，当当为您推荐</div>
        <div class="shopping_commend_right"><img src="images/shopping_arrow_up.gif" alt="shopping" id="shopping_commend_arrow"/></div>
    </div>
    <div id="shopping_commend_sort">
        <div class="shopping_commend_sort_left">
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">JavaScript DOM编程艺术</a></li>
                <li class="shopping_commend_list_2">￥39.00</li>
                <li class="shopping_commend_list_3">￥29.30</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">解禁（当当网独家首发）</a></li>
                <li class="shopping_commend_list_2">￥28.00</li>
                <li class="shopping_commend_list_3">￥19.40</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">地王之王（金融危机下房地产行...</a></li>
                <li class="shopping_commend_list_2">￥32.80</li>
                <li class="shopping_commend_list_3">￥25.10</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">逃庄</a></li>
                <li class="shopping_commend_list_2">￥36.00</li>
                <li class="shopping_commend_list_3">￥27.70</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
        </div>
        <div class="shopping_commend_sort_mid"></div>
        <div class="shopping_commend_sort_left">
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">深入浅出MySQL数据库开发、优...</a></li>
                <li class="shopping_commend_list_2">￥59.00</li>
                <li class="shopping_commend_list_3">￥47.20</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">大玩家（马未都、王刚推荐!央...</a></li>
                <li class="shopping_commend_list_2">￥34.80</li>
                <li class="shopping_commend_list_3">￥20.60</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">都市风水师--官场风水小说：一...</a></li>
                <li class="shopping_commend_list_2">￥39.80</li>
                <li class="shopping_commend_list_3">￥30.50</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">国戏（以麻将术语解读宦海沉浮...</a></li>
                <li class="shopping_commend_list_2">￥25.00</li>
                <li class="shopping_commend_list_3">￥17.30</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
        </div>
    </div>
    <div class="shopping_list_top">您已选购以下商品</div>
    <div class="shopping_list_border">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="shopping_list_title">
                <td class="shopping_list_title_1">商品名</td>
                <td class="shopping_list_title_2">单品积分</td>
                <td class="shopping_list_title_3">市场价</td>
                <td class="shopping_list_title_4">当当价</td>
                <td class="shopping_list_title_5">数量</td>
                <td class="shopping_list_title_6">删除</td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="myTableProduct">
        <c:if test="${sessionScope.cartlist.size()!=0 }" var="flag">
	        <c:forEach var="cartlist" items="${sessionScope.cartlist }" begin="0">
	        	<tr class="shopping_product_list" id="shoppingProduct_01">
	        		<td class="shopping_product_list_0" style="display:none">${cartlist.productid}</td>
	                <td class="shopping_product_list_1"><a href="#" class="blue">${cartlist.bookname}</a></td>
	                <td class="shopping_product_list_2"><label><fmt:formatNumber type="number" value="${cartlist.price*cartlist.discount/10}" pattern="0"/></label></td>
	                <td class="shopping_product_list_3">￥<label>${cartlist.price}</label></td>
	                <td class="shopping_product_list_4">￥<label><fmt:formatNumber type="number" value="${cartlist.price*cartlist.discount/100}" pattern="0.00"/></label>(${cartlist.discount}折)</td>
	                <td class="shopping_product_list_5"><input type="text" value="${cartlist.num }"/></td>
	                <td class="shopping_product_list_6"><a href="javascript:void(0)" class="blue">删除</a></td>
	            </tr>
	        </c:forEach>
	    </c:if>
	    <c:if test="${not flag}">
	    	<div class='empty_product'><div>您还没有挑选商品，<a href='index.jsp'>去挑选看看>></a></div></div>
	    </c:if>
        </table>
        <div class="shopping_list_end">
            <div><a id="removeAllProduct" href="javascript:void(0)">清空购物车</a></div>
            <ul>
                <%-- <li class="shopping_list_end_1"><a href="alipay/index.jsp?WIDtotal_amount=<fmt:formatNumber type="number" value="${sessionScope.total}" pattern="0.00"/>"><img src="images/shopping_balance.gif"/></a></li> --%>
                <li class="shopping_list_end_1"><a href="order/order_info.jsp?bookname=null"><img src="images/shopping_balance.gif"/></a></li>
				<li class="shopping_list_end_2">￥<label id="product_total"><fmt:formatNumber type="number" value="${sessionScope.total}" pattern="0.00"/></label></li>
                <li class="shopping_list_end_3">商品金额总计：</li>
                <li  class="shopping_list_end_4">您共节省金额：￥<label class="shopping_list_end_yellow" id="product_save"><fmt:formatNumber type="number" value="${sessionScope.less}" pattern="0.00"/></label><br/>
                    可获商品积分：<label class="shopping_list_end_yellow" id="product_integral"><fmt:formatNumber type="number" value="${sessionScope.integral}" pattern="0"/></label>
                </li>
            </ul>
        </div>
    </div>
</div>

<!--网站版权部分开始-->
<div id="footer">
<iframe src="footer.jsp" height="50px" width="900px" frameborder="0"></iframe></div>
</body>
</html>