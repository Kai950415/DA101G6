<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.feastinfo.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
    FeastInfoVO feastInfoVO = (FeastInfoVO) request.getAttribute("feastInfoVO");
%>


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

:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>飯局資料 - listOneFeast.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
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
						<td>修改</td>
						<td>刪除</td>
						
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
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/feastinfo.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="修改"> <input type="hidden"
									name="fea_no" value="${feastInfoVO.fea_no}"> <input
									type="hidden" name="action" value="getOne_For_Update">
							</FORM>
						</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/feastinfo.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="刪除"> <input type="hidden"
									name="fea_no" value="${feastInfoVO.fea_no}"> <input
									type="hidden" name="action" value="delete">
							</FORM>
						</td>
					</tr>
				</table>
			</div>
		</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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