<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.fooditem.model.*, com.res.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>


<jsp:useBean id="foodItemSvc" scope="page" class="com.fooditem.model.FooditemService" />
<html>
<head>
<title>�\�I��� - listOneFooditem.jsp</title>

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
	width: 600px;
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
<%@ include file="/header.jsp"%>
<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>

	<c:forEach var="fooditemVO" items="${foodItemSvc.getAllfooditemVOByFooditem(resVO.res_no)}">
<table>
	<tr>
		<th>�\�I�s��</th>
		<th>�\�U�s��</th>
		<th>�W��</th>
		<th>����</th>
		<th>�Ϥ�</th>
		<th>����</th>
		<th>���A</th>
	</tr>
	<tr>
		<td>${fooditemVO.fo_no}</td>
		<td>${fooditemVO.fo_resno}</td>
		<td>${fooditemVO.getFo_name()}</td>
		<td>${fooditemVO.getFo_price()}</td>
		<td><img src="<%=request.getContextPath()%>/back-end/ord/resOrdPhoto.do?fo_no=${fooditemVO.fo_no}" width="200"></td>
		<td>${fooditemVO.getFo_intro()}</td>
		<td>${fooditemVO.getFo_status()}</td>
		
		
	</tr>
</table>
</c:forEach>
</body>
</html>