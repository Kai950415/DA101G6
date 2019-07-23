<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>


<%
  MemVO memVO = (MemVO)request.getAttribute("memVO");
%>
<%=memVO==null %>-- ${memVO==null}

<!doctype html>

<html lang="en">
<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="<%=request.getContextPath()%>/js/address.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">






<title>會員個人資料</title>

<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">



<title>個人會員資料</title>
<style type="text/css">
body {
	font-family: "微軟正黑體";
}

.title {
	display: flex;
	justify-content: space-between;
}
</style>
<script>
	$(document).ready(function() {

		var readURL = function(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('.avatar').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".file-upload").on('change', function() {
			readURL(this);
		});
	});
</script>


</head>
<body>
	<%@ include file="/header.jsp"%>
	<br>
	<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
	<jsp:useBean id="MemVO" scope="page" class="com.mem.model.MemVO" />
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h1>關於我</h1>
			</div>
			<div class="col-sm-2">
				<a href="#" class="pull-right"><img title="profile image"
					class="img-circle" src="https://picsum.photos/100/100"></a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<!--left col-->

				<div class="text-center">

					<c:if test="${memberVO.getMem_img()!=null }">
						<%
							MemVO memVOfromSession = (MemVO) session.getAttribute("memberVO");
								String pic = new String(Base64.getEncoder().encode(memVOfromSession.getMem_img()), "UTF-8");
						%>
						<img name="mem_img" class="card-img-top img-circle" id="mem_img"
							src="data:image/jpg;base64,<%=pic%>" />
					</c:if>
					<c:if test="${memberVO.getMem_img()==null }">
						<img name="mem_img" class="card-img-top img-circle"
							src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
							alt="你沒有放圖片喔">
					</c:if>

				</div>
				<br>





				<ul class="list-group">
					<li class="list-group-item text-muted">會員 <i
						class="fa fa-dashboard fa-1x"></i></li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>會員編號:</strong></span>
						${memberVO.mem_no}</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>會員狀態:</strong></span>
						${memberVO.mem_status}</li>

				</ul>




			</div>
			<!--/col-3-->
			<div class="col-sm-9">
				<ul class="nav nav-tabs" role="tablist">
					

					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#MemInfoUpdate" role="tab">會員註冊</a></li>
				</ul>

<!-- 				<br> -->
<!-- 				<div class="tab-content"> -->
<!-- 					<div role="tabpanel" class="tab-pane active" id="MemInfo"> -->

<!-- 						<div class="row"> -->
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="first_name"><h4>會員姓名</h4></label> -->
<%-- 								<p>${memberVO.mem_name}</p> --%>
<!-- 							</div> -->
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="last_name"><h4>會員性別</h4></label> -->
<%-- 								<p>${memberVO.mem_sex}</p> --%>
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="row"> -->
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="phone"><h4>出生 年/月/日</h4></label> -->
<%-- 								<p>${memberVO.mem_bd}</p> --%>
<!-- 							</div> -->
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="mobile"><h4>連絡電話</h4></label> -->
<%-- 								<p>${memberVO.mem_ph}</p> --%>
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="row"> -->
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="email"><h4>Email</h4></label> -->
<%-- 								<p>${memberVO.mem_email}</p> --%>
<!-- 							</div> -->
<!-- 							<div class="form-group col-sm-6"> -->
<!-- 								<label for="location"><h4>地址</h4></label> -->
<%-- 								<p>${memberVO.mem_adrs}</p> --%>
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="form-group"> -->
<!-- 							<div class="col-xs-12"> -->
<!-- 								<label for="AboutMe"><h4>自我介紹</h4></label> -->
<%-- 								<p>${memberVO.mem_intro}</p> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					/tab-pane -->
					<!--------------------------------------------------------------------------------------------------->
					
					
<!----資料修改---------------------------------------------------------------------------------->
					<div role="tabpanel" class="tab-pane fade" id="MemInfoUpdate">

						<form class="form" action="<%=request.getContextPath()%>/front-end/mem/mem.do" method="post"
							id="registrationForm" enctype="multipart/form-data">
							<input type="hidden" name="action" value="insert">
							<div class="row">
								<div class="form-group col-sm-6">
									<label for="first_name"><h4>會員姓名</h4></label> <input
										class="form-control" name="mem_name" id="first_name"
										placeholder="你的名字" title="enter your  name ."
										value="${memberVO.mem_name}">
								</div>
								<div class="form-group col-sm-6">
									<label for="last_name"><h4>會員性別</h4></label> <input type="text"
										class="form-control" name="mem_sex" id="last_name"
										placeholder="如:男性、女性" title="sex" value="${memberVO.mem_sex}">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6">
									<label for="phone"><h4>出生 年/月/日</h4></label> <input type="date"
										class="form-control" name="mem_bd" id="phone"
										placeholder="年/月/日" title="Birthday"
										value="${memberVO.mem_bd}">
								</div>
								<div class="form-group col-sm-6">
									<label for="mobile"><h4>連絡電話</h4></label> <input type="number"
										class="form-control" name="mem_ph" id="mobile"
										placeholder="你的電話號碼" title="PhoneNumber"
										value="${memberVO.mem_ph}">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6">
									<label for="email"><h4>Email</h4></label> <input type="email"
										class="form-control" name="mem_email" id="email"
										placeholder="you@email.com" title="enter your email."
										value="${memberVO.mem_email}">
								</div>
								
								<div class="form-group col-sm-6">
									<label for="location"><h4>地址</h4></label> <br>
<!-- 									<input type="text" -->
<!-- 										class="form-control" name="mem_adrs" id="location" placeholder="某地" -->
<%-- 										title="enter a location" value="${memberVO.mem_adrs}"> --%>
										
									<select id="zone1"  name="zone1" style="width: 110px;"></select>
									<select id="zone2"  name="zone2" style="width: 110px;"></select>
							        <input	type="text" id="zipcode" name="zipcode" style="width: 40px;"  readonly='true'/>
							        <input	type="text" name="address" value="中正路一段一號1樓" style="width: 268px;"><p>

								</div>
							</div>

							<div class="row">
								<div class="form-group col-sm-6">
									<label for="ac"><h4>帳號</h4></label> <input type="text"
										class="form-control" name="mem_ac" id="ac" placeholder="你的帳號"
										title="enter your password." value="${memberVO.mem_ac}">
								</div>

								<div class="form-group col-sm-6">

									<label for="password2"><h4>密碼</h4></label> <input
										type="password" class="form-control" name="mem_pass"
										id="password2" placeholder="你的密碼"
										title="enter your password2." value="${memberVO.mem_pass}">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-12">

									<label for="AboutMe"><h4>自我介紹</h4></label>
									<textarea name="mem_intro" class="form-control"
										placeholder="Say~Something" id="AboutMe"
										style="height: 150px;">
								${memberVO.mem_intro}
								</textarea>
								</div>
								<div class="col-xs-3">
									<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
										class="avatar img-circle-top" alt="avatar">
									<h6>會員大頭照</h6>
									<input name="mem_img" type="file"
										class="text-center center-block file-upload">

								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-3">
									<br>
									<button class="btn btn-lg btn-outline-success" type="submit">
										<i class="glyphicon glyphicon-ok-sign">完成</a></i> 
									</button>>
									<button class="btn btn-lg btn-outline-secondary" type="reset">
										<i class="glyphicon glyphicon-repeat"></i> 回上頁
									</button>
								</div>
							</div>
						</form>

					</div>
					<!--/tab-pane-->
					<!---------------------------------------------------------------------->
				</div>
			</div>
		</div>
	</div>

	</div>
	<!--/tab-pane-->
	</div>
	<!--/tab-content-->

	</div>
	<!--/col-9-->
	</div>
	<!--/row-->


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script type="text/javascript">
		$(function() {
			init_address();
			$("#zone1").val('桃園縣'); //縣市
			for ( var i in zip['桃園縣']) {
				o = document.createElement('option');
				o.text = i;
				o.value = i;
				zone2.options.add(o);
			}
			$("#zone2").val('新屋鄉'); //鄉鎮市區
			$("input[name='zipcode']").val('327'); //郵遞區號
		})
	</script>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		
		<input type="hidden" name="action" value="insert">
</body>
</html>