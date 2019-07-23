<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reportlm.model.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EGGBackStage</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<!-- Custom styles for this template -->
<link href="css/simple-sidebar.css" rel="stylesheet">

</head>

<body>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2">
				<div class="nav flex-column nav-pills" id="v-pills-tab"
					role="tablist" aria-orientation="vertical">
					<a class="nav-link" id="v-pills-home-tab" data-toggle="pill"
						href="#v-pills-home" role="tab" aria-controls="v-pills-home"
						aria-selected="true">首頁</a> <a class="nav-link"
						id="v-pills-shop-tab" data-toggle="pill" href="#v-pills-shop"
						role="tab" aria-controls="v-pills-shop" aria-selected="false">店家管理</a>
					<a class="nav-link" id="v-pills-point-tab" data-toggle="pill"
						href="#v-pills-point" role="tab" aria-controls="v-pills-point"
						aria-selected="false">點數管理</a> <a class="nav-link"
						id="v-pills-settings-tab" data-toggle="pill"
						href="#v-pills-settings" role="tab"
						aria-controls="v-pills-settings" aria-selected="false">廣告管理</a> <a
						class="nav-link" id="v-pills-report-tab" data-toggle="pill"
						href="#v-pills-report" role="tab" aria-controls="v-pills-report"
						aria-selected="false">檢舉管理</a>
				</div>
			</div>
			<div class="col-10">
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home"
						role="tabpanel" aria-labelledby="v-pills-home-tab">
						<h1 class="mt-8">EGG後臺網</h1>
						<p>歡迎來到EGG後台頁面,請點選左方選單操作</p>
					</div>
					<div class="tab-pane fade" id="v-pills-shop" role="tabpanel"
						aria-labelledby="v-pills-shop-tab">店家商店店家</div>
					<div class="tab-pane fade" id="v-pills-point" role="tabpanel"
						aria-labelledby="v-pills-point-tab">點數點數</div>
					<div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
						aria-labelledby="v-pills-settings-tab">廣告廣告</div>
					<div class="tab-pane fade" id="v-pills-report" role="tabpanel"
						aria-labelledby="v-pills-report-tab"><%@ include
							file="/back-end/reportlm/reportLm.jsp"%></div>
				</div>
			</div>
		</div>
	</div>
	</div>
<%-- 	--updateSuccess--${updateSuccess} --%>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	<c:if test="${update.equals(\"true\")}" var="flag" scope="request">
		<%
			session.removeAttribute("updateSuccess");
		%>
		<script>
			$(function() {
				$('#v-pills-report-tab').trigger('click');
			});
		</script>
	</c:if>
</body>



</html>
