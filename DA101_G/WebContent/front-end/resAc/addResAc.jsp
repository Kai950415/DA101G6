<%@page import="java.time.LocalTime"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.res.model.*,com.resac.model.*,java.text.SimpleDateFormat"%>

<%
	ResAcVO resAcVO = (ResAcVO) request.getAttribute("resAcVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料新增 - addResAc.jsp</title>

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

	<table id="table-1" width="800px">
		<tr>
			<td>
				<h3>員工資料新增 - addResAc.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="/DA101G6/front-end/resAc/resAc.jsp">
					<img src="/DA101G6/images/tomcat.png" width="100" height="100"
						border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}" >
		<font style="color: red" >請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="resAc.do" name="form1" enctype="multipart/form-data">
		<table width="1000px">
			<tr>
				<td>員工編號:</td>
				<td><input type="TEXT" name="resac_no" size="45"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_no()%>" /></td>
			</tr>
			
			<tr>
				<td>員工姓名:</td>
				<td><input type="TEXT" name="resac_name" size="45"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_name()%>" /></td>
			</tr>
			
			<tr>
				<td>員工密碼:</td>
				<td><input type="password" name="resac_pass" size="45"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_pass()%>" /></td>
			</tr>

			<tr>
				<td>密碼確認:</td>
				<td><input type="password" name="resac_pass2" size="45"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_pass()%>" /></td>
			</tr>
			<tr>
				<td>員工電話:</td>
				<td><input type="TEXT" name="resac_phone" size="45"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_phone()%>" /></td>
			</tr>

			<tr>
				<td>員工照片:</td>
				<td><input type="file" name="resac_pic" size="20" 
					accept="image/gif, image/jpeg, image/png"
					id="imgpv1"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_pic()%>" /></td>
				<td><img width="300" height="200" id="preview_img1" src="/DA101G6/images/noimg.jpg"></td>	
			</tr>

			<tr>
				<td>員工介紹:</td>
				<td><input type="TEXT" name="resac_intro" size="20"
					value="<%=(resAcVO == null) ? "" : resAcVO.getResac_intro()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
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

<script>
$("#imgpv1").change(function(){
    //當檔案改變後，做一些事 
   readURL(this);   // this代表<input id="imgInp">
 });
function readURL(input){
	  if(input.files && input.files[0]){
	    var reader = new FileReader();
	    reader.onload = function (e) {
	       $("#preview_img1").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}
</script>


</html>