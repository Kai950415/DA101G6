<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.fooditem.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  FooditemVO fooditemVO = (FooditemVO) request.getAttribute("fooditemVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneFooditem.jsp</h3>
		 <h4><a href="fooditem_select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

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
		<td><%=fooditemVO.getFo_no()%></td>
		<td><%=fooditemVO.getFo_resno()%></td>
		<td><%=fooditemVO.getFo_name()%></td>
		<td><%=fooditemVO.getFo_price()%></td>
		<td><img src="<%=request.getContextPath()%>/fooditem/foimg.do?fo_no=${fooditemVO.fo_no}" width="200"></td>
		<td><%=fooditemVO.getFo_intro()%></td>
		
	</tr>
</table>

</body>
</html>