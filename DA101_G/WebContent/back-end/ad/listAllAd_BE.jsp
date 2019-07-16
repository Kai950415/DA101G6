<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*"%>
<%@ page import="com.tools.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    AdService adSvc = new AdService();
    List<AdVO> list = adSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有廣告資料 - listAllAd.jsp</title>

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
		 <h3>所有廣告資料 - listAllAd.jsp</h3>
		 <h4><a href="/DA101G6/back-end/ad/ad_BE.jsp"><img src="/DA101G6/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
		<th>廣告編號</th>
		<th>餐廳編號</th>
		<th>廣告標題</th>
		<th>廣告內容</th>
		<th>廣告照片</th>
		<th>廣告開始時間</th>
		<th>廣告結束時間</th>
		<th>廣告狀態</th>
		<th>修改</th>
	</tr>
	 
	<%@ include file="/page1.file" %> 
	<c:forEach var="adVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${adVO.ad_no}</td>
			<td>${adVO.ad_resno}</td>
			<td>${adVO.ad_title}</td>
			<td>${adVO.ad_text}</td>
			<td><img src="<%=request.getContextPath()%>/back-end/resAd/resAdPhoto.do?ad_no=${adVO.ad_no}" width="300" height="200"> </td>
			<td>${adVO.ad_start}</td> 
			<td>${adVO.ad_end}</td> 
			<td>${FindCodeName.meaning(adVO.ad_status)}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/ad/ad.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ad_no"  value="${adVO.ad_no}">
			     <input type="hidden" name="action"	value="getOneResAd_For_Update_By_Admin"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="/page2.file" %>

</body>
</html>