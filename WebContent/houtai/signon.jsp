<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.dangdang.entity.*" %>
    <%@ page import="com.dangdang.daoImpl.SignonDaoImpl" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息管理系统界面</title>
 <head>
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
   
   <script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); 
        
      }); 
   </script>
  
 </head>
 <body style="overflow-x:hidden;overflow-y:auto;">
 <%
 SignonDaoImpl sdi=new SignonDaoImpl();
 ArrayList<Signon> clist= sdi.CheckSignonAll();
 request.setAttribute("clist",clist);
 %>
          
  <div class="container">
     <div class="main_top">
          <div class="main_center fl span10">
              
                <div class="box_border">
                  <div class="box_top" align="center">
                   <h2>用户信息管理</h2>
                  </div>
                  
                </div>
             
          </div>


          <div class="clear"></div>
     </div>
      

     <div class="container">
     <div class="main_top">
          <div class="main_left fl span5">
              <div class="box pr5">
                <div class="box_border">
                  <div class="box_top">
  
    <!--  <div class="form-group"> -->
     <h3>请输入新增用户信息</h3><hr>
     </div>
     <div class="box_center">
     <form class="form-horizontal" role="form" action="DoRegist.jsp" method="post">
     	<table width="25%" border="1" cellpadding="0" cellspacing="0" class="list_table">
     		<tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">用户名:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="username"><br></td>
			</tr>
			<tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">密码:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputpassword" name="password">
				<br></td>
			</tr>
			<tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">电子邮件:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputemail" name="email"><br></td>
			</tr>
			<tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">性别:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputsex"  name="sex"><br></td>
			</tr>
			<tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">省份:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="province"><br></td>
			</tr>
			<tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">城市:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="city"><br></td>
			</tr>
			<!-- <tr>
				<td><label for="inputuserid" class="col-sm-4 control-label">address:</label></td>
				<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="address"><br></td>
       		<td width="2%"> -->
       		<tr>	
       			<td colspan="2" align="center"><button type="submit" class="btn btn82 btn_add">新增</button></td>
   			</tr>
       	</table>
      </form></div>
       				</div>
              </div>
          </div>
       	<div class="main_right fr span5">
          
              <div class="box pl5">
                <div class="box_border">
                	<!-- <div class="box_top">
					<form class="form-horizontal" role="form" action="Domodify.jsp" method="post">
						          <div class="box_top"><b class="pl15">请输入修改用户的用户名：</b>
						              <input type="text" name="name" class="input-text lh25" size="10"></div>
						             
					</form>
					</div> -->
					<div class="box_center">
				<form class="form-horizontal" role="form" action="Domodify.jsp" method="post">
							<!-- 搜索 -->
							 <div class="box_top">
									          <div class="box_top"><b class="pl15">请输入修改用户的用户名：</b>
									              <input type="text" name="name" class="input-text lh25" size="10"></div>
								</div>
					<table width="25%" border="1" cellpadding="0" cellspacing="0" class="list_table">
			     		<tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">用户名:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="username"><br></td>
						</tr>
						<tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">密码:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputpassword" name="password"><br></td>
							
						</tr>
						<tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">电子邮件:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputemail" name="email"><br></td>
						</tr>
						<tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">性别:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputsex"  name="sex"><br></td>
						</tr>
						<tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">省份:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="province"><br></td>
						</tr>
						<tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">城市:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="city"><br></td>
						</tr>
						<tr>
			       			<td colspan="2" align="center"><button type="submit" class="btn btn82 btn_add">修改</button></td>
			       		</tr>
			       	</table>
	
			  </form> 
			  </div>
			  </div>
              </div>
        
          </div>

          <div class="clear"></div>
			  
			  </br>
							<div>
							  <form class="form-horizontal" role="form" action="DoSignon.jsp" method="post">
							      <label for="inputuserid" class="col-sm-4 control-label">请输入删除的用户名:</label>
								<input type="text" class="input-text lh30" size="35" id="inputID" name="username"><br>
							       <input type="submit" class="ext_btn ext_btn_submit" value="删除">
							
							       <hr> 
							  </form>     
							  
							</div>
 
    <div class="span3 fl pt10">
          <div class="box pr5">
          <div class="box_border">
            <div class="box_top"><center>用户密码表</center></div>
          </div>
        </div>
        
     <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
 
						<tr>
						<td>option</td>
						<td>用户名</td>
						<td>密码</td>
						</tr>
		
                 <c:forEach var="c" items="${clist}" begin="0">
                   <tr class="tr">
                  <td class="td_center"><input type="checkbox"></td>
						<td>${c.username }</td>
						<td>${c.password }</td>
						</tr>
					</c:forEach>
                 
              
              </table>
              <div class="page mt10">
                <div class="pagination">
                  <ul>
                      <li class="first-child"><a href="#">首页</a></li>
                      <li class="disabled"><span>上一页</span></li>
                      <li class="active"><span>1</span></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">下一页</a></li>
                      <li class="last-child"><a href="#">末页</a></li>
                  </ul>
                </div>

              </div>
        </div>
     </div>
     
   </div> 
 </body>
 </html>
  