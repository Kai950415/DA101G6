<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fooditem.model.*,com.res.model.*"%>

<%
	ResVO resVO = (ResVO) session.getAttribute("ResVO"); // "ResVO" 與 餐廳登入的"resVO" 區別
		

	FooditemService fooditemSvc = new FooditemService();
	List<FooditemVO> list = fooditemSvc.getByResNOFooditem(resVO.getRes_no());
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>

<title>Welcome to EGG !</title>

<style>
img {
	width: 300px;
	height: 150px;
}

.card {
	margin-bottom: 15px;
	margin-left: 8px;
	margin-right: 8px;
	border: 0px;
}

.card-text {
	height: 50px;
}

.card-title {
	height: 35px;
}

.div_cart {
	width: 75px;
	height:80px;
	float: right;
	position: fixed;
	right: 0px;
	bottom: 0px;
	z-index: 100;
	text-align:center;
}
#amount{
	color:#ffe6b3;
	font-size:18px;
	font-weight:bold;
}
sub{
	font-size:36px;
	font-weight:bold;
}
</style>
</head>
<body>
<%@ include file="/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-12" align="center"><%@ include file="/page1.file"%></div>
		</div>
		<div class="row">
			<c:forEach var="fooditemVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">
				<div class="col-3">
					<div class="card">
						<img
							src="<%=request.getContextPath()%>/back-end/ord/resOrdPhoto.do?fo_no=${fooditemVO.fo_no}"
							class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">${fooditemVO.fo_name}</h5>
							<p class="card-text">${fooditemVO.fo_intro}</p>
							<form name="shoppingForm" method="POST">
							<input type="hidden" name="action" value="add">	
							<input type="hidden" name="fo_no" value="${fooditemVO.fo_no}">
							<input type="hidden" name="fo_name" value="${fooditemVO.fo_name}">
							<input type="hidden" name="fo_price" value="${fooditemVO.fo_price}">
<!-- 							<input type="hidden" name="fo_quantity" value="1"> -->
							<%int quantity = 1;%>
							<select size="1" name="fo_quantity">
								<c:forEach var="quantity" begin="1" end="10" step="1">
									<option value="<%=quantity%>"><%=quantity%>
									<%++quantity; %>
								</c:forEach>
							</select>
							<button type="button" name="button" class="ord btn btn-primary">訂購</button>
							</form>
						</div>
					</div>
				
				</div>
				
			</c:forEach>
		</div>
		
	</div>
	<br>
	
	<a href="ordConfirm.jsp">
	<div class="div_cart" align="left">
	<i class="fas fa-donate fa-lg" style="color:#ffe6b3"></i>
	<span id="amount"><%=(session.getAttribute("total")==null||(int)session.getAttribute("total")==0)?"":session.getAttribute("total")%></span>
	<span style="color:#cce6ff"><i class="fa fa-cart-arrow-down fa-3x">
	</i><sub><%=(session.getAttribute("shoppingCartQuantity")==null||(int)session.getAttribute("shoppingCartQuantity")==0)?"":session.getAttribute("shoppingCartQuantity")%></sub></span></div></a>
	<%@ include file="/page2.file" %>
	
	
	<script>
	$(document).ready(function() {
		$(".ord").click(function() {
			$.ajax({
				type : "POST",
				url : "ord.do",
				data : $(this).parent().serialize(),
				dataType : "json",
				success : function(res) {
					<!--alert("已添加至購物車");-->
					alert("已添加至購物車");
					$("sub").text(res.cartQuantity);
					$("#amount").text(res.cartAmount);
				},
				error : function() {
					alert("Sorry, there was a problem!");
				}
			});
		});
	});
</script>

	
</body>
</html>