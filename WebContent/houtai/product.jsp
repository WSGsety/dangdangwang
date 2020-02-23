<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.dangdang.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dangdang.daoImpl.ProductDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书信息管理系统界面</title>
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
<body style="overflow-x: hidden; overflow-y: auto;">
	
	
	<div class="container">
     <div class="main_top">
          <div class="main_center fl span10">
              
                <div class="box_border">
                  <div class="box_top" align="center">
                   <h2>图书信息管理</h2>
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
     <h3>请输入新增图书信息</h3><hr>
     </div>
     <div class="box_center">
     <form class="form-horizontal" role="form" action="doaddBook.jsp" method="post">
     	<table width="25%" border="1" cellpadding="0" cellspacing="0" class="list_table">
     					
                        <tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">图书id:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="productid"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">类别id:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="catid"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">图书名称:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="bookname"><br></td>
			     		</tr>
          
						<tr>
							<td><span class="col-sm-4 control-label">评分:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputpassword" name="score"><br></td>
							
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">作者:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputemail" name="author"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">出版社:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputsex"  name="publish"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">发行日期:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="pubdate"><br></td>
						</tr>
						
			     		<tr>
							<td><span class="col-sm-4 control-label">图书详细信息:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="descn"><br></td>
						</tr>
					
						
						
						<tr>
							<td><span class="col-sm-4 control-label">原价:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="price"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">当当价:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="discount"><br></td>
			       		</tr>
			       		<tr>
							<td><span class="col-sm-4 control-label">图片:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="img"><br></td>
			       		</tr>
			       		<tr>
							<td><span class="col-sm-4 control-label">库存量:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="qty"><br></td>
			       		</tr>
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
                	
					<div class="box_center">
				<form class="form-horizontal" role="form" action="domodifyProduct.jsp" method="post">
						<div class="box_top">
								          <div class="box_top"><b class="pl15">请输入需要修改的图书id：</b>
								              <input type="text" name="xgid" class="input-text lh25" size="10"></div>
							</div>
					<table width="25%" border="1" cellpadding="0" cellspacing="0" class="list_table">
						   <tr>
							<td><label for="inputuserid" class="col-sm-4 control-label">图书id:</label></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="productid"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">类别id:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="catid"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">图书名称:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="bookname"><br></td>
			     		</tr>
          
						<tr>
							<td><span class="col-sm-4 control-label">评分:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputpassword" name="score"><br></td>
							
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">作者:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputemail" name="author"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">出版社:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputsex"  name="publish"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">发行日期:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="pubdate"><br></td>
						</tr>
						
			     		<tr>
							<td><span class="col-sm-4 control-label">图书详细信息:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputusername"  name="descn"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">原价:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="price"><br></td>
						</tr>
						<tr>
							<td><span class="col-sm-4 control-label">当当价:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="discount"><br></td>
			       		</tr>
			       		<tr>
							<td><span class="col-sm-4 control-label">图片:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="img"><br></td>
			       		</tr>
			       		<tr>
							<td><span class="col-sm-4 control-label">库存量:</span></td>
							<td><input type="text" class="input-text lh30" size="35" id="inputaddress" name="qty"><br></td>
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
				  <form class="form-horizontal" role="form" action="DodeleteProduct.jsp" method="post">
					    <label for="inputuserid" class="col-sm-4 control-label">请输入删除的图书id:</label>
						<input type="text" class="input-text lh30" size="35" id="inputID" name="productid"><br>
						<input type="submit" class="ext_btn ext_btn_submit" value="删除图书">
				       <hr> 
				  </form>     
							  
							</div>
 
	
	
	
	
		
				<div class="box span10 oh">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
						<tr>
							<th colspan="10">图书信息表</th>
						</tr>
						<tr>
							<th width="30">勾选</th>
							<th width="100">书本ID</th>
							<th width="100">名称</th>
							<th width="100">评分</th>
							<th width="100">作者</th>
							<th width="100">出版社</th>
							<th width="100">出版日期</th>
							<th width="100">类别(备注)</th>
							<th width="100">价格</th>
							<th width="100">折扣</th>
						</tr>

						<%
	                
	                    
	                    int pageCount=(Integer)session.getAttribute("pageCount");
	                    int pageNo=(Integer)session.getAttribute("pageNo");
	                    ArrayList<Product> plist=(ArrayList<Product>)session.getAttribute("plist");
						for(Product p:plist){
						%>
						<tr class="tr">
							<td class="td_center"><input type="checkbox"></td>
							<td><%= p.getProductid() %></td>
							<td><%= p.getBookname() %></td>
							<td><%= p.getScore() %></td>
							<td><%= p.getAuthor() %></td>
							<td><%= p.getPublish() %></td>
							<td><%= p.getPubdate() %></td>
							<td><%= p.getDescn() %></td>
							<td><%= p.getPrice() %></td>
							<td><%= p.getDiscount() %></td>
						</tr>
						<%
        	  			}
               			 %>

					</table>
					<div class="page mt10">
						<div class="pagination">
							<ul>

								<!--  <li class="first-child"><a href="index.jsp">首页</a></li> -->
								<li><a href="doProduct.jsp?flag=down&pageNo=<%=pageNo%>">上一页</a></li>
								<%
			                   for(int i=1;i<=pageCount;i++){
			                   %>
									<li class="active"><a href="doProduct.jsp?pageNo=<%=i%>" class="product_page"><%=i %></a></li>
							   <%
			                   }
			                   %>
								<li><a href="doProduct.jsp?flag=up&pageNo=<%=pageNo%>">下一页</a></li>
								<!-- <li class="last-child"><a href="#">末页</a></li> -->
							</ul>
						</div>
					</div>
						</div>
					</div>


		
</body>
</html>
