<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fooditem.model.*"%>

<%
	FooditemVO	fooditemVO = (FooditemVO) request.getAttribute("fooditemVO");

%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�\�I��Ʒs�W - addFooditem.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>
<%@ include file="/header.jsp"%>
<table id="table-1">
	<tr><td>
		 <h3>��Ʒs�W - addFooditem.jsp</h3></td><td>
		 <h4><a href="fooditem_select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="fooditem.do" name="form1" enctype="multipart/form-data">
<table>
	
	<tr>
		<td>�\�U�s��:</td>
		<td><input type="TEXT" name="fo_resno" size="45" 
			 value="<%= (fooditemVO == null)? "RS00000" : fooditemVO.getFo_resno()%>" /></td>
	</tr>
	
	<tr>
		<td>�\�I�W��:</td>
		<td><input type="TEXT" name="fo_name" size="45" 
			 value="<%= (fooditemVO==null)? "�W��" : fooditemVO.getFo_name()%>" /></td>
	</tr>
	<tr>
		<td>����:</td>
		<td><input type="TEXT" name="fo_price" size="45"
			 value="<%= (fooditemVO==null)? "0" : fooditemVO.getFo_price()%>" /></td>
	</tr>
	<tr>
		<td>�Ϥ�::</td>
		<td><input type="file" name="fo_img" size="45"
			 value="<%= (fooditemVO==null)? "�Ϥ�" : fooditemVO.getFo_img()%>" /></td>
	</tr>
	<tr>
		<td>����:</td>
		<td><input type="TEXT" name="fo_intro" size="45"
			 value="<%= (fooditemVO==null)? "10000" : fooditemVO.getFo_intro()%>" /></td>
	</tr>
	<tr>	
		<td>���A:</td>
		<td><input type="TEXT" name="fo_status" size="45"
			 value="<%= (fooditemVO==null)? "100" : fooditemVO.getFo_status()%>" /></td>
	</tr>

</table>
<br>

<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>


</html>