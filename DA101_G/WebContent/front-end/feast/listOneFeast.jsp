
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.feastinfo.model.*, com.myfeast.model.*,
				com.fooditem.model.*, com.mem.model.*, com.res.model.*, com.ord.model.*, com.ord_details.model.*, com.tools.*"%>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	FeastInfoVO feastInfoVO = (FeastInfoVO) request.getAttribute("feastInfoVO");

	MyFeastService myeSvc = new MyFeastService();

	List<MyFeastVO> list = myeSvc.getAllMyFeastVOsByFeaNo(feastInfoVO.getFea_no());

	FeastInfoVO feaVO = (FeastInfoVO)request.getAttribute("feastInfoVO");
	session.setAttribute("feastInfoVO", feaVO);
	pageContext.setAttribute("myeSvc", myeSvc);
	pageContext.setAttribute("list", list);
%>

<% 
 		MemVO memVO = (MemVO)session.getAttribute("memberVO");
		OrdService ordSvc = new OrdService();
		Ord_detailsService ordDSvc = new Ord_detailsService();
		FooditemService foSvc = new FooditemService();
		
		//該會員所有訂單 > 該訂單所有商品
		//餐廳所有飯局'RS000003' > 飯局所有訂單 >訂單所有商品
	    FeastInfoService feaSvc = new FeastInfoService();
	    Map<String,List<FooditemVO>> groupMap = new LinkedHashMap<String,List<FooditemVO>>();
	    
		
	    List<OrdVO> ordList = ordSvc.getAllOrdByMem(memVO.getMem_no());//該會員所有訂單

	    for (OrdVO ordVO : ordList) {
	    	List<FooditemVO> foodItemlist = new ArrayList<FooditemVO>();
	    	List<Ord_detailsVO> ordDList = ordDSvc.getAlldetByOrdno(ordVO.getOrd_no());//拿出該訂單的所有訂單明細
			for (Ord_detailsVO ord_detailsVO : ordDList) {
				FooditemVO foVO = foSvc.getOneFooditem(ord_detailsVO.getDet_fono());//拿出該訂單明細 準備加入list ==
				foVO.setFo_quantity(ord_detailsVO.getDet_quantity());
				foodItemlist.add(foVO);
			}
			groupMap.put(ordVO.getOrd_no(), foodItemlist); //key = 訂單編號
		}

		Set<String> set = groupMap.keySet();
		
		pageContext.setAttribute("memVO",memVO);
		pageContext.setAttribute("ordList",ordList);
		pageContext.setAttribute("ordSvc",ordSvc);
		pageContext.setAttribute("feaSvc",feaSvc);
		pageContext.setAttribute("groupMap",groupMap);
		pageContext.setAttribute("set",set);
%>


<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="resSvc" scope="page" class="com.res.model.ResService" />

<html lang="en">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<head>
<title>EGG飯局資料</title>
<style>
table {
	width: 800px;
	margin-top: 5px;
	margin-bottom: 5px;
}
b,h4{
	color:#0c85cf;
}
</style>

</head>

<body id="list_one_feast">
	<%@ include file="/header.jsp"%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
<br>
	<div class="container">
		
		



	</div>

	<div class="container" id="myfeast">
		<div class="row">
				<div class="col-9">
				<div class="card text-center">
						<div class="card-header" style="display:inline-flex;flex-direction: row;justify-content: space-between;">
						<c:if test="${(resVO==null) && memberVO.mem_no ne (feastInfoVO.fea_memNo) && !list.contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no)) && feastInfoVO.fea_number < feastInfoVO.fea_upLim}">
							<button class="btn btn-outline-success" id="joinfeast" name="mye_feano"value="${feastInfoVO.fea_no}"
							 style="align-content:flex-start;">加入飯局</button>		 
						</c:if>
						<c:if test="${(resVO==null) && memberVO.mem_no.equals(feastInfoVO.fea_memNo)}">
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do"
									style="margin-bottom: 0px; ">
									<input type="hidden" name="fea_no" value="${feastInfoVO.fea_no}">
									<input type="hidden" name="action" value="getOne_For_Update">
									<input type="submit" value="修改" class="btn btn-outline-info">
								</FORM>
						</c:if>

						
							<h3 style=" align-items:center;"><label><h4>標題</h4></label> ${feastInfoVO.fea_title}</h3>
							<h3 style=" align-items:flex-end;"><p> <b>主揪 :</b>${memSvc.memFindByPrimaryKey(feastInfoVO.fea_memNo).mem_name}</p></h3>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="form-group col-sm-6">
									<label><h4>標題</h4></label>
									<p class="card-text">${feastInfoVO.fea_title}</p>
								</div>
								<div class="form-group col-sm-6">
									<label><h4>介紹</h4></label>
									<p>${feastInfoVO.fea_text}</p>
								</div>
							</div>
							<div class="row">

								<div class="form-group col-sm-6">
									<p>
										<b>餐廳名稱 :</b>${resSvc.getOneRes(feastInfoVO.fea_resNo).res_name}</p>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-sm-4">
									<p><b>目前人數 :</b>${feastInfoVO.fea_number}</p>
								</div>
								<div class="form-group col-sm-4">
									<p><b>人數上限 :</b>${feastInfoVO.fea_upLim}</p>
								</div>
								<div class="form-group col-sm-4">
									<p><b>人數下限 :</b>${feastInfoVO.fea_lowLim}</p>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-sm-4">
									<p><b>飯局類型 :</b>${feastInfoVO.fea_type}</p>
								</div>
								<div class="form-group col-sm-4">
									<p><b>飯局地點 :</b>${feastInfoVO.fea_loc}</p>
								</div>
								<div class="form-group col-sm-4">
									<p><b>飯局狀態 :</b>${FindCodeName.meaning(feastInfoVO.fea_status)}</p>
								</div>
							</div>
							
							<c:if test="${feastInfoVO.fea_type ne \"內用\"}">
							<div class="row">
								<div class="form-group col-sm-4">
									<label><h4>飯局日期 :</h4></label>
									<p><fmt:formatDate value="${feastInfoVO.fea_date}" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
								<div class="form-group col-sm-4">
									<label><h4>報名截止時間 :</h4></label>
									<p><fmt:formatDate value="${feastInfoVO.fea_startDate}" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
								<div class="form-group col-sm-4">
									<label><h4>訂餐截止時間 :</h4></label>
									<p><fmt:formatDate value="${feastInfoVO.fea_endDate}" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
							</div>
							</c:if>
							
							<c:if test="${feastInfoVO.fea_type.equals(\"內用\")}">
							<div class="row">
								<div class="form-group col-sm-6">
									<label><h4>飯局日期 :</h4></label>
									<p><fmt:formatDate value="${feastInfoVO.fea_date}" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
								<div class="form-group col-sm-6">
									<label><h4>報名截止時間 :</h4></label>
									<p><fmt:formatDate value="${feastInfoVO.fea_startDate}" pattern="yyyy-MM-dd HH:mm"/></p>
								</div>
							</div>
							</c:if>
							
						</div>
						<div class="card-footer text-muted">

						
						<c:if test="${(resVO==null) && !ordSvc.isMemOrdInFea(feastInfoVO.fea_no, memberVO.mem_no) &&  list.contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no))}">
							<button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/front-end/ord/ord.do?action=showFoodsInfo&res_no=${feastInfoVO.fea_resNo}'">訂餐</button>
						</c:if>								
							<c:if test="${(resVO==null) && memberVO.mem_no ne (feastInfoVO.fea_memNo) && list.contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no))}">
							<button class="btn btn-outline-secondary" id="leftfeast"
								name="mye_feano" value="${feastInfoVO.fea_no}">退出</button>
							</c:if>
						</div>
					</div>
					</div>
					
					<div class="col-3">
					<table class="table" sytle="border-style:none;">
					
					<tr sytle="border-style:none;"><td width="30%">參加者:</td>
					
					</tr>
					
					<c:forEach var="myFeastVO" items="${list}">
						<c:if test="${(resVO==null) && feastInfoVO.fea_memNo ne myFeastVO.mye_memNo}"> 
						<tr sytle="border-style:none;">
					
							
							<td>${memSvc.memFindByPrimaryKey(myFeastVO.mye_memNo).mem_name}</td>

							<c:if test="${(resVO==null) && memberVO.mem_no.equals(feastInfoVO.fea_memNo) && memberVO.mem_no ne myFeastVO.mye_memNo}"> 
						 
										<td width="30%">
											<button class="btn btn-outline-danger kick_from_feast" name="mye_feano" feano="${myFeastVO.mye_feaNo}" memno="${myFeastVO.mye_memNo}">踢</button> 
										</td>
							</c:if> 
									<jsp:useBean id="FLSvc" scope="page" class="com.friendlist.model.FriendListService" />
									
<%-- 									<c:if test="${FLSvc.getAll(memberVO.mem_no).contains(FLSvc.findByTwoPrimaryKey(memberVO.mem_no, myFeastVO.mye_memNo))}"> --%>
										<td width="70%">
											<button class="btn btn-primary add_friend_feast" name="mye_feano" feano="${myFeastVO.mye_feaNo}" memno="${myFeastVO.mye_memNo}">加好友</button> 
										</td>
<%-- 									</c:if> 	 --%>
									
						</tr>
						</c:if>
					</c:forEach>
					</table>
					</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
		


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
		
$(".kick_from_feast"). click(function()
		{
			console.log('kick_from_feast');
			console.log($(this).attr('feano'))
			console.log($(this).attr('memno'))
			$.post
			(
				"<%=request.getContextPath()%>/front-end/feast/myfeast.do",
				{ "action": "kick_from_feast", "mye_feano": $(this).attr('feano'), "mye_memno": $(this).attr('memno') }
			).done(function(data)
					{
						var newDoc = document.open("text/html", "replace");
					    newDoc.write(data);
					    newDoc.close();
					}
				  )
			
		});

$(".add_friend_feast"). click(function()
		{
			console.log('add_friend_feast')
			$.post
			(
				"<%=request.getContextPath()%>/front-end/friendlist/friendlist.do",
				{ "action": "insert", "mye_feano": $(this).attr('feano'),  "f_memno": $(this).attr('memno'),  }
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