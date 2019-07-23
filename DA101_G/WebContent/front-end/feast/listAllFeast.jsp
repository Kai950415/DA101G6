<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.feastinfo.model.*, com.tools.FindCodeName"%>

<%
    FeastInfoService feaSvc = new FeastInfoService();
    List<FeastInfoVO> historyList = feaSvc.getAllHistoryFeastInfo();
    pageContext.setAttribute("historyList", historyList);
    
    List<FeastInfoVO> currentList = feaSvc.getAllCurrentFeastInfo();
    pageContext.setAttribute("currentList", currentList);
%>
<jsp:useBean id="myeSvc" scope="page" class="com.myfeast.model.MyFeastService" />
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>列出所有飯局</title>
</head>



<body>

	<%@ include file="/header.jsp"%>
	
	<h4>此頁練習採用 EL 的寫法取值:</h4>

	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>


<div>
				<ul class="nav nav-tabs justify-content-center" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#historyFeast" role="tab">歷史飯局</a></li>

					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#feasting" role="tab">參加中</a></li>
				</ul>
</div>
<div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="historyFeast">
		<!-- Content Row -->
		<div class="row">
			<!-- Page Content -->
			<div class="container">

				<!-- 我是飯局-->
				<h1 class="my-4">
					歷史飯局瀏覽: <small>創造一起吃飯的樂趣吧!</small>
				</h1>





				<c:forEach var="feastInfoVO" items="${historyList}">
					
					<c:if test="${myeSvc.getAllMyFeastVOsByFeaNo(feastInfoVO.getFea_no()).contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no))}">
						<!-- Project One -->
						<div class="row">
							<div class="col-md-7">

								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do">

									<input type="hidden" class="form-check-input" name="action"
										value="getOne_For_Display"> <input type="hidden"
										class="form-check-input" name="fea_no"
										value="${feastInfoVO.fea_no}">
									<button type="submit" style="background-color: #D9C5A8;width: 80%;background: transparent;border-color: #D9C5A8;border-style: solid;">
										<img class="img-fluid rounded mb-3 mb-md-0"
											src="https://picsum.photos/700/550?random=1" alt="">
									</button>
								</form>

							</div>
							<div class="col-md-5">
								<h3>標題:${feastInfoVO.fea_title}</h3>

								<p>${feastInfoVO.fea_text}</p>
								<p>發起人:${memSvc.memFindByPrimaryKey(feastInfoVO.fea_memNo).mem_name}</p>
								<p>現在人數:${feastInfoVO.fea_number}</p>
								<p>
									開團時間:
									<fmt:formatDate value="${feastInfoVO.fea_date}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
								<p>類型:${feastInfoVO.fea_type}</p>
								<p>地址:${feastInfoVO.fea_loc}</p>

								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do">

									<input type="hidden" class="form-check-input" name="action"
										value="getOne_For_Display"> <input type="hidden"
										class="form-check-input" name="fea_no"
										value="${feastInfoVO.fea_no}">
									<button type="submit" class="btn btn-primary">JOIN!</button>
								</form>
							</div>
						</div>
						<!-- /.row -->
					</c:if>
				</c:forEach>

				<hr>


			</div>
			<!-- /.container -->

			<!-- /.col-md-4 -->

</div>
		</div>

<div role="tabpanel" class="tab-pane" id="feasting">
		<!-- Content Row -->
		<div class="row">
			<!-- Page Content -->
			<div class="container">

				<!-- 我是飯局-->
				<h1 class="my-4">
					參加中飯局瀏覽: <small>創造一起吃飯的樂趣吧!</small>
				</h1>





				<c:forEach var="feastInfoVO" items="${currentList}">
					
					<c:if test="${myeSvc.getAllMyFeastVOsByFeaNo(feastInfoVO.getFea_no()).contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no))}">
						<!-- Project One -->
						<div class="row">
							<div class="col-md-7">

								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do">

									<input type="hidden" class="form-check-input" name="action"
										value="getOne_For_Display"> <input type="hidden"
										class="form-check-input" name="fea_no"
										value="${feastInfoVO.fea_no}">
									<button type="submit" style="background-color: #D9C5A8;width: 80%;background: transparent;border-color: #D9C5A8;border-style: solid;">
										<img class="img-fluid rounded mb-3 mb-md-0"
											src="https://picsum.photos/700/550?random=1" alt="">
									</button>
								</form>

							</div>
							<div class="col-md-5">
								<h3>標題:${feastInfoVO.fea_title}</h3>

								<p>${feastInfoVO.fea_text}</p>
								<p>發起人:${memSvc.memFindByPrimaryKey(feastInfoVO.fea_memNo).mem_name}</p>
								<p>現在人數:${feastInfoVO.fea_number}</p>
								<p>
									開團時間:
									<fmt:formatDate value="${feastInfoVO.fea_date}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
								<p>類型:${feastInfoVO.fea_type}</p>
								<p>地址:${feastInfoVO.fea_loc}</p>

								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do">

									<input type="hidden" class="form-check-input" name="action"
										value="getOne_For_Display"> <input type="hidden"
										class="form-check-input" name="fea_no"
										value="${feastInfoVO.fea_no}">
									<button type="submit" class="btn btn-primary">JOIN!</button>
								</form>
							</div>
						</div>
						<!-- /.row -->
					</c:if>
				</c:forEach>

				<hr>

			</div>
</div>
		</div>
</div>
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
</body>
</html>