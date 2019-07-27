<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.friendlist.model.*"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MemService memSv = new MemService();
	FriendListService friSvc = new FriendListService();
	
	//MemVO memVO = (MemVO) session.getAttribute("memVO"); 因為現在沒有會員資料
    MemVO memVO=memSv.memFindByPrimaryKey("ME000001");	  //塞會員假資料進去
    List<MemVO> list = friSvc.match(memVO.getMem_no());
    pageContext.setAttribute("list",list);
    pageContext.setAttribute("memVO",memVO);
%>


<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <style type="text/css">
    body{
    	margin-top:20px;
    	background:#FAFAFA;    
	}
	.people-nearby .google-maps{
  		background: #f8f8f8;
  		border-radius: 4px;
  		border: 1px solid #f1f2f2;
 	 	padding: 20px;
  		margin-bottom: 20px;
	}

	.people-nearby .google-maps .map{
	    height: 300px;
  	    width: 100%;
  	    border: none;
	}

	.people-nearby .nearby-user{
  		padding: 20px 0;
  		border-top: 1px solid #f1f2f2;
 	    border-bottom: 1px solid #f1f2f2;
        margin-bottom: 20px;
	}

	img.profile-photo-lg{
  		height: 80px;
  		width: 80px;
  		border-radius: 50%;
	}

    </style>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body bgcolor='white'>
<%@ include file="/header.jsp"%>
<table id="table-1">
	<tr>
		<td><h4><a href="select_page.jsp">回首頁</a></h4></td>   
		<td><h4><a href="select_page.jsp">好友列表</a></h4></td> 
		<td><h4><a href="select_page.jsp">交友邀請</a></h4></td> 
	</tr>
</table>
	<h1>好友配對</h1>
	<%@ include file="page1.file" %> 
	
	<jsp:useBean id="FriendListVO" scope="page" class="com.friendlist.model.FriendListVO"/>
	<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService"/>

	<div class="container">
    <div class="row">
        <div class="col-md-12" align="center">
            <div class="people-nearby">
              
              <div class="nearby-user">
                <div class="row">
                  <div class="col-md-2 col-sm-2">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="user" class="profile-photo-lg">
                   </div>
                   
                   <c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                  		<div class="col-md-7 col-sm-7">
                  		
                    		<h5>姓名:${memVO.getMem_name()}</h5>
                    		<h5>性別:${memVO.getMem_sex()}</h5>
                    		<h5>自我介紹:${memVO.getMem_intro()}</h5>
                    	</div>
                  </c:forEach>
                  <div class="col-md-3 col-sm-3">
                    <button class="btn btn-primary pull-right">送出邀請</button>
                  </div>
                </div>
              </div>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<%-- <%-- 錯誤表列 --%> 
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">請修正以下錯誤:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>

<%@ include file="page2.file"%>

</body>
</html>