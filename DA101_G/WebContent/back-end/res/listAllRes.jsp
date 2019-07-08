<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.res.model.*"%>
<%@ page import="com.tools.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ResService resSvc = new ResService();
    List<ResVO> list = resSvc.getAll();
    pageContext.setAttribute("list",list);
    
	String level[] = {"Free","Inexpensive","Moderate","Expensive","Very Expensive"};
	pageContext.setAttribute("level",level);
			
//     ResVO resvo = (ResVO) request.getAttribute("res_img");
%>


<html>
<head>
<title>所有餐廳資料 - listAllRes.jsp</title>

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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1" width="1600px">
	<tr><td>
		 <h3>所有餐廳資料 - listAllRes.jsp</h3>
		 <h4><a href="/DA101G6/back-end/res/select_page.jsp"><img src="/DA101G6/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<%@ include file="page1.file" %> 
	<c:forEach var="resVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
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
			<td>${(resVO.res_cost == 0)? level[0]:''}
				${(resVO.res_cost == 1)? level[1]:''}
				${(resVO.res_cost == 2)? level[2]:''}
				${(resVO.res_cost == 3)? level[3]:''}
				${(resVO.res_cost == 4)? level[4]:''}
			</td>
			<td>${resVO.res_type}</td> 
			<td>${FindCodeName.meaning(resVO.res_status)}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/res/res.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="res_no"  value="${resVO.res_no}">
			     <input type="hidden" name="action"	value="getOneRes_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/res/res.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="res_no"  value="${resVO.res_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>