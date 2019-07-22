<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.feastinfo.model.*, com.myfeast.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
    FeastInfoVO feastInfoVO = (FeastInfoVO) request.getAttribute("feastInfoVO");

	MyFeastService myeSvc = new MyFeastService();
	
	List<MyFeastVO> list = myeSvc.getAllMyFeastVOsByFeaNo(feastInfoVO.getFea_no());
	
	
    pageContext.setAttribute("myeSvc", myeSvc);
    pageContext.setAttribute("list", list);
%>

<html lang="en">
<head></head>

<body id="list_one_feast">
<%@ include file="/header.jsp" %>
<br>
<br>
<br>
<br>
<br>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<table id="table-1">
		<tr>
			<td>
				<h3>飯局資料 - listOneFeast.jsp</h3>

			</td>
		</tr>
	</table>
	<div class="container">
		<div class="row">
				<table class="table">

					<tr>

						<td>飯局編號</td>
						<td>餐廳編號</td>
						<td>會員編號</td>
						<td>標題</td>
						<td>介紹</td>
						<td>目前人數</td>
						<td>人數上限</td>
						<td>人數下限</td>
						<td>飯局日期</td>
						<td>報名截止時間</td>
						<td>訂餐截止時間</td>
						
						
						<td>飯局類型</td>
						<div class="col-6">
						<td>飯局地點</td>
						</div>
						<td>飯局狀態</td>
						
					</tr>
					<tr>
						<td>${feastInfoVO.fea_no}</td>
						<td>${feastInfoVO.fea_resNo}</td>
						<td>${feastInfoVO.fea_memNo}</td>
						<td>${feastInfoVO.fea_title}</td>
						<td>${feastInfoVO.fea_text}</td>
						<td>${feastInfoVO.fea_number}</td>
						<td>${feastInfoVO.fea_upLim}</td>
						<td>${feastInfoVO.fea_lowLim}</td>
						<td>${feastInfoVO.fea_date}</td>
						<td>${feastInfoVO.fea_startDate}</td>
						<td>${feastInfoVO.fea_endDate}</td>
						<div class="col-6">
						<td>${feastInfoVO.fea_type}</td>
						</div>
						<td>${feastInfoVO.fea_loc}</td>
						<td>${feastInfoVO.fea_status}</td>
						
						<c:if test="${memberVO.mem_no.equals(feastInfoVO.fea_memNo)}"> 
						
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do"
								style="margin-bottom: 0px;">
								<input type="hidden" name="fea_no" value="${feastInfoVO.fea_no}"> 
								<input type="hidden" name="action" value="getOne_For_Update">
								<input type="submit" value="修改" class="btn btn-primary"> 
							</FORM>
						</td>
						</c:if> 
						<c:if test="${!list.contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no))&&(resVO==null)}"> 
						<td>
							<button class="btn btn-primary" id="joinfeast" name="mye_feano" value="${feastInfoVO.fea_no}">加入飯局</button>
								
						</td>
						</c:if> 
						
						<c:if test="${list.contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no)) && !memberVO.mem_no.equals(feastInfoVO.fea_memNo)}">
						<td>
							<button class="btn btn-primary" id="leftfeast" name="mye_feano" value="${feastInfoVO.fea_no}">退出</button> 
							
						</td>
						</c:if> 
						
						<td>
						<button type="button" class="btn btn-primary"  onclick="location.href='<%=request.getContextPath()%>/front-end/ord/ord.do?action=showFoodsInfo&res_no=${feastInfoVO.fea_resNo}'" >訂餐</button> 
						</td>
					</tr>
				</table>
			</div>
		</div>


		<div class="container" id="myfeast">
				<div class="row">
					<div class="col-sm">
						<table class="table">
							<tr>
		
								<td>飯局編號</td>
								<td>會員編號</td>

							</tr>
							
							
							
							<c:forEach var="myFeastVO" items="${list}" >
								
		
								<tr>
									<td>${myFeastVO.mye_feaNo}</td>
									<td>${myFeastVO.mye_memNo}</td>
									
									<c:if test="${memberVO.mem_no.equals(feastInfoVO.fea_memNo) && !memberVO.mem_no.equals(myFeastVO.mye_memNo)}"> 
						 
										<td>
											<button class="btn btn-primary" id="kick_from_feast" name="mye_feano" feano="${myFeastVO.mye_feaNo}" memno="${myFeastVO.mye_memNo}">踢除</button> 
										</td>
								
									</c:if> 	
								</tr>
								
							</c:forEach>
							
							
						</table>
					</div>
				</div>
			</div>
<script>
$("#joinfeast"). click(function()
{
	console.log('joinFeast')
	$.post
	(
		"<%=request.getContextPath()%>/front-end/feast/myfeast.do",
		{ "action": "joinfeast", "mye_feano": $(this).val() }
	).done(function(data)
			{

				var newDoc = document.open("text/html", "replace");
			    newDoc.write(data);
			    newDoc.close();
			}
		  )
	
});

$("#leftfeast"). click(function()
{
	console.log('leftfeast')
	$.post
	(
		"<%=request.getContextPath()%>/front-end/feast/myfeast.do",
		{ "action": "leftfeast", "mye_feano": $(this).val() }
	).done(function(data)
			{

				var newDoc = document.open("text/html", "replace");
			    newDoc.write(data);
			    newDoc.close();
			}
		  )
	
});
		
$("#kick_from_feast"). click(function()
{
	console.log('kick_from_feast')
	$.post
	(
		"<%=request.getContextPath()%>/front-end/feast/myfeast.do",
		{ "action": "kick_from_feast", "mye_feano": $('#kick_from_feast').attr('feano'), "mye_memno": $('#kick_from_feast').attr('memno') }
	).done(function(data)
			{

				var newDoc = document.open("text/html", "replace");
			    newDoc.write(data);
			    newDoc.close();
			}
		  )
	
});
		

</script>

</body>
</html>