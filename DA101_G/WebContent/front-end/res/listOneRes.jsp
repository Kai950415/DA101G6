<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.res.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  ResVO resVO = (ResVO) request.getAttribute("resVO"); //ResServlet.java(Concroller), 存入req的resVO物件
%>

<html>
<head>
<title>餐廳資料 - listOneRes.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 1600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1" width="1600px">
	<tr><td>
		 	<h3>員工資料 - ListOneRes.jsp</h3>
		 </td>
		 <td>
		 	<h4><a href="/DA101G6/back-end/res/select_page.jsp">
		 		<img src="/DA101G6/images/tomcat.png" width="100" height="100" border="0">回首頁</a>
		 	</h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>餐廳編號</th>
		<th>餐廳地址</th>
		<th>餐廳名稱</th>
		<th>餐廳電話</th>
		<th>餐廳點數</th>
		<th>餐廳帳號</th>
		<th>餐廳密碼</th>
		<th>餐廳照片</th>
		<th>餐廳介紹</th>
		<th>餐廳營業時間</th>
		<th>餐廳緯度</th>
		<th>餐廳經度</th>
		<th>餐廳評分</th>
		<th>評分人次</th>
		<th>餐廳消費水準</th>
		<th>餐廳類型</th>
		<th>餐廳狀態</th>
	</tr>
	<tr>
			<td>${resVO.res_no}</td>
			<td>${resVO.res_adrs}</td>
			<td>${resVO.res_name}</td>
			<td>${resVO.res_ph}</td>
			<td>${resVO.res_point}</td>
			<td>${resVO.res_ac}</td> 
			<td>${resVO.res_pass}</td>
			<td><img width="300" height="200" src="<%=request.getContextPath()%>/back-end/res/resPhoto.do?res_no=${resVO.res_no}"> </td>
			<td>${resVO.res_intro}</td>
			<td>${resVO.res_start}~${resVO.res_end}</td>
			<td>${resVO.res_lat}</td>
			<td>${resVO.res_lot}</td>
			<td>${resVO.res_score}</td> 
			<td>${resVO.res_comcount}</td>
			<td>${resVO.res_cost}</td>
			<td>${resVO.res_type}</td> 
			<td>${resVO.res_status}</td>
	</tr>
</table>

</body>
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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</html>