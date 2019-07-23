<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*,com.mem.model.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
	MemVO memVO = (MemVO)session.getAttribute("memberVO");
	
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Insert title here</title>
</head>


<style type="text/css">
.container {
	background-color: WHITE;
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	padding-right: 100px;
	padding-left: 100px;
}

.custom-control-input:checked ~.custom-control-label::before {
	background-color: #00BBFF;
	border-color: #fa0;
}
</style>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

<!-- 		<div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!-- 			<ul class="navbar-nav mr-auto"> -->
<!-- 				<li class="nav-item active"><a class="nav-link" href="#">首頁 -->
<!-- 						<span class="sr-only">(current)</span> -->
<!-- 				</a></li> -->

<!-- 				<li class="nav-item dropdown"><a -->
<!-- 					class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
<!-- 					role="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 					aria-expanded="false"> 會員 </a> -->
<!-- 					<div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!-- 						<a class="dropdown-item" href="#">Action</a> <a -->
<!-- 							class="dropdown-item" href="#">Another action</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">Something else here</a> -->
<!-- 					</div></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" href="#">直播</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" href="#">拍賣</a></li> -->
<!-- 			</ul> -->
<!-- 			<form class="form-inline my-2 my-lg-0"> -->
<!-- 				<input class="form-control mr-sm-2" type="search" -->
<!-- 					placeholder="Search" aria-label="Search"> -->
<!-- 				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
<!-- 			</form> -->
		</div>
	</nav>


	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="https://picsum.photos/2000/300?random=1"
					class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="https://picsum.photos/2000/300?random=2"
					class="d-block w-100">
			</div>
			<div class="carousel-item">
				<img src="https://picsum.photos/2000/300?random=3"
					class="d-block w-100">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>


	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			
			<li class="breadcrumb-item"><a href="mem.jsp">會員中心</a></li>
			<li class="breadcrumb-item active" aria-current="page">儲值點數</li>
		</ol>
	</nav>
<form action="pointtransaction.do" method="post">
		
		<div class="container">
			<div class="row">

				<div class="col-12">
					<div class="card">
						<div class="card-body">

							<font size="5"
								style="display: flex; align-items: center; justify-content: center; height: 100%;">儲值點數</font>
							<hr>
							<div style="text-align: center">請輸入您的信用卡卡號</div>
							<br>
							<div class="form-group form-row">
								<div class="col-sm-3">
									<input type="text" id="f1" class="form-control"
										onkeydown="change(1)">
								</div>
								<p>_</p>
								<div class="col">
									<input type="text" id="f2" class="form-control" maxlength="4">
								</div>
								<p>_</p>
								<div class="col">
									<input type="text" id="f3" class="form-control" maxlength="4">
								</div>
								<p>_</p>
								<div class="col">
									<input type="text" id="f4" class="form-control" maxlength="4">
								</div>
							</div>

							卡片有效期限<select style="margin-left: 12px" name="Select_Month"
								id="Select_Month"></select>月
							<script>
								var Select_Month = document
										.getElementById("Select_Month")
								var Month_Start = 1 //起始月 
								var Month_End = 12 //結束月 
								var Month_Len = Month_End - Month_Start + 1;
								Select_Month.options.length = Month_Len;
								for (var i = 0; i < Month_Len; i++) {
									Select_Month.options[i].text = Select_Month.options[i].value = Month_Start
											+ i;
								}
							</script>

							<select name="Select_Year" id="Select_Year"></select>年
							<script>
								var Select_Year = document
										.getElementById("Select_Year")
								var Year_Start = 2019 //起始年 
								var Year_End = 2030 //結束年 
								var Year_Len = Year_End - Year_Start + 1;
								Select_Year.options.length = Year_Len;
								for (var i = 0; i < Year_Len; i++) {
									Select_Year.options[i].text = Select_Year.options[i].value = Year_Start
											+ i;
								}
							</script>
							<br> <br>
							<div>
								<ul class="pagination justify-content-left">
									信用卡驗証碼
									<input name="depositValue" class="title"
										placeholder="請輸入您的信用卡驗証碼" maxlength="3"
										style="margin-left: 12px">
								</ul>
							</div>

							請選擇您要儲值的點數金額 <br> 
							<input style="margin-left: 15px" type="radio" name="point" value="100">100點<br> 
							<input style="margin-left: 15px" type="radio" name="point" value="500">500點<br>
							<input style="margin-left: 15px" type="radio" name="point" value="1000">1000點<br>
							<input style="margin-left: 15px" type="radio" name="point" value="3000">3000點<br>
							<input style="margin-left: 15px" type="radio" name="point" value="5000">5000點<br>
						</div>
					</div>

					<br>

					<div class="col-12">
						<ul class="pagination justify-content-center">
						<input type="hidden" value="${memberVO.mem_no}" name="mem_no">
						<input type="hidden" value="addpoint" name="action">
							<input class="page-link" type="submit" value="儲值">
						</ul>
					</div>
</form>
				</div>
			</div>
		</div>

	</form>

	<script>
		function change(id1) {
			if ($("#f" + id1).val().length == 4) {
				changeNext(id1 + 1);
			}
		}

		function changeNext(id2) {
			var v = "#f" + id2;
			$(v).focus();
			$(v).keyup(function focus2() {
				if ($("#f" + id2).val().length == 4) {
					changeNext(id2 + 1);
				}
			});
			if ($("#f" + 4).val().length == 4) {
				alert("輸入完成");
			}
		}
	</script>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
</body>
</html>