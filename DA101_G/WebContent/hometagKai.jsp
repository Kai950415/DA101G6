<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.feastinfo.model.*, com.myfeast.model.*"%>

<%
    FeastInfoService feaSvc = new FeastInfoService();
    MyFeastService myeSvc = new MyFeastService();
    
    List<FeastInfoVO> list = feaSvc.getAllFeastInfoVOsRandomly();
    
    pageContext.setAttribute("myeSvc", myeSvc);
    pageContext.setAttribute("list", list);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<!DOCTYPE html>
<html lang="en">

<head>


<title>Welcome to EGG !</title>

<!-- Bootstrap core CSS -->

</head>

<body>

	<!-- Navigation 上方NAVBAR -->
	<%@ include file="header.jsp"%>


	<!--廣告牆-->
	<div class="container">
		<div class="bd-example">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://picsum.photos/1080/500?random=1"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>第一廣告區</h5>
							<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="https://picsum.photos/1080/500?random=2"
							class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>第二廣告區</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="http://placehold.it/1080x500" class="d-block w-100"
							alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>第三廣告區</h5>
							<p>Praesent commodo cursus magna, vel scelerisque nisl
								consectetur.</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>



		<!-- Page Content -->
		<div class="container">

			<!-- Heading Row -->
			<div class="row align-items-center my-5">
				<div class="col-lg-7">
					<img class="img-fluid rounded mb-4 mb-lg-0"
						src="https://picsum.photos/900/400?random=5" alt="">
				</div>
				<!-- /.col-lg-8 -->
				<div class="col-lg-5">
					<h1 class="font-weight-light">來看看附近美食吧!</h1>
					<p>還在想要吃什麼嗎?加入會員，成為主揪，與他人製造美好的相遇吧! 我是一張900*400的圖片!</p>


					<a class="btn" href="<%=request.getContextPath()%>/restaurant.jsp">點我進入美食搜尋!</a>


				</div>
				<!-- /.col-md-4 -->
			</div>
			<!-- /.row -->


			<!-- Call to Action Well -->
			<div class="card text-dark  my-5 py-4 text-center">
				<img class="img" src="https://picsum.photos/1080/450" alt="">
				<div class="card-body">
					<p class="text-white m-0">這裡可以放網站宣傳圖片</p>

				</div>
			</div>
		</div>



		<!-- Content Row -->
		<div class="row">
			<!-- Page Content -->
			<div class="container">

				<!-- 我是飯局-->
				<h1 class="my-4">
					飯局瀏覽: <small>創造一起吃飯的樂趣吧!</small>
				</h1>



				<%@ include file="/front-end/page1.file"%>

				<c:forEach var="feastInfoVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					
<%-- 					<c:if test="${!myeSvc.getAllMyFeastVOsByFeaNo(feastInfoVO.getFea_no()).contains(myeSvc.getOneMyFeast(feastInfoVO.fea_no, memberVO.mem_no))}"> --%>
						<!-- Project One -->
						<div class="row">
							<div class="col-md-7">

								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/feast/feastinfo.do">

									<input type="hidden" class="form-check-input" name="action"
										value="getOne_For_Display"> <input type="hidden"
										class="form-check-input" name="fea_no"
										value="${feastInfoVO.fea_no}">
									<button type="submit">
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
									<button type="submit" class="btn btn-primary" id="join">JOIN!</button>
								</form>
							</div>
						</div>
						<!-- /.row -->
<%-- 					</c:if> --%>
				</c:forEach>

				<hr>
				<%@ include file="/front-end/page2.file"%>


			</div>
			<!-- /.container -->

			<!-- /.col-md-4 -->


		</div>

	</div>
	</div>
	<br>
	<br>



	<!-- Footer -->
	<footer class="page-footer font-small  pt-4">

		<!-- Footer Elements -->
		<div class="container">

			<!-- Call to action -->
			<ul class="list-unstyled list-inline text-center py-2">
				<li class="list-inline-item">
					<h2 class="mb-1">EAT GROUP&GOOD</h2>
				</li>

			</ul>
			<!-- Call to action -->

		</div>
		<!-- Footer Elements -->

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">© 2019 Copyright:
		</div>
		<!-- Copyright -->

	</footer>
	<!-- Footer -->




</body>

</html>
