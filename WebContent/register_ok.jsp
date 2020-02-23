<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>当当网注册页面</title>
    <link href="css/global.css" rel="stylesheet" type="text/css" />
    <link href="css/layout.css" rel="stylesheet" type="text/css" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
		<link href="css/page_bottom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
</head>

<body>
<div id="header">
    <div id="register_header">
        <div class="register_header_left"><img src="images/logo.gif" alt="logo"/></div>
        <div class="register_header_right"><a href="index.jsp" class="blue">首页</a> | <a href="product.jsp" class="blue">商品展示页</a>  | <a href="shopping.jsp" class="blue">购物车</a> |  <a href="login.jsp" class="blue">登录</a></div>
    </div>
</div>
<div id="main">
    <div class="register_content">
        <div class="register_top_bg"></div>
        <div class="register_mid_bg">
            <ul>
                <li class="register_mid_left">1. 填写注册信息</li>
                <li class="register_mid_mid">2. 等待验证</li>
                <li class="register_mid_right">3. 完成注册</li>
            </ul>
        </div>
        <div class="register_top_bg_mid">
            <div class="register_top_bg_two_left"></div>
            <div class="register_top_bg_two_right"></div>
            <div class="register_title_bg"><img src="images/register_pic_02.gif" alt="欢迎注册"/><br/>您所提供的资料不会做其他用途，敬请安心填写。</div>
        </div>
        <div class="register_dotted_bg"></div>
        <div class="register_message">
            <div class="login_success">
			<div class="login_bj">
				<div class="succ">
					<img src="${pageContext.request.contextPath}/images/login_success.jpg" />
				</div>
				<h5>
					${param.username }，欢迎加入当当网
				</h5>
				<h6>
					请牢记您的登录邮件地址：${param.email }
				</h6>

				<ul>
					<li class="nobj">
						您现在可以：
					</li>
					<li>
						进入“
						<a href="#">我的当当</a>”查看并管理您的个人信息
					</li>
					<li>
						<a href="../main/main.jsp">浏览并选购商品</a>
					</li>
				</ul>
			</div>
		</div>
        </div>
    </div>
</div>
<!--网站版权部分开始-->
<div id="footer">
    <iframe src="footer.jsp" height="50px" width="900px" frameborder="0"></iframe>
</div>
</body>
</html>