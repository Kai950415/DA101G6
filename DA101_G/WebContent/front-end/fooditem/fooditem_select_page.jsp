<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- fooditem_select_page ���� -->
<html>
<head>
<title>FoodItem: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>FoodItem: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for FoodItem: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllFooditem.jsp'>List</a> all FoodItem.  <br><br></li>

  
  
  
  <li>
    <FORM METHOD="post" ACTION="fooditem.do" >
        <b>��J�\�I�s�� (�pFO000001):</b>
        <input type="text" name="fo_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

<%--   <jsp:useBean id="fooditemSvc" scope="page" class="com.fooditem.model.FooditemService" /> --%>
   
<!--   <li> -->
<!--      <FORM METHOD="post" ACTION="fooditem.do" > -->
<!--        <b>����\�I�s��:</b> -->
<!--        <select size="1" name="fo_no"> -->
<%--          <c:forEach var="fooditemVO" items="${fooditemSvc.all}" >  --%>
<%--           <option value="${fooditemVO.fo_no}">${fooditemVO.fo_no} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--     </FORM> -->
<!--   </li> -->
  
<!--   <li> -->
<!--      <FORM METHOD="post" ACTION="fooditem.do" > -->
<!--        <b>��ܭ��u�m�W:</b> -->
<!--        <select size="1" name="fo_no"> -->
<%--          <c:forEach var="fooditemVO" items="${fooditemSvc.all}" >  --%>
<%--           <option value="${fooditemVO.fo_no}">${fooditemVO.ename} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--      </FORM> -->
<!--   </li> -->
</ul>


<h3>�\�I�޲z</h3>

<ul>
  <li><a href='addFooditem.jsp'>Add</a> a new Fooditem.</li>
</ul>

</body>
</html>