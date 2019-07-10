<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.post.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.leavemessage.model.*"%>
<%@ page import="com.res.model.*"%>

<%
	PostService postSvc = new PostService();
	
	List<PostVO> list = postSvc.getAll();

	
	pageContext.setAttribute("list",list);
	LeaveMessageVO LeaveMessageVO = (LeaveMessageVO) request.getAttribute("LeaveMessageVO");
%>
<!doctype html>
<html lang="en">
  <head>
  
  <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <link rel="stylesheet" href="css/all.css">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  	
	
		
    <title>美麗貼文新世界</title>
    <style type="text/css">
    body{
      font-family:"微軟正黑體";
    background-color: #FAEBD7;
    }
    .title{
    	display: flex;
    	justify-content: space-between;
    }
    #postImg{
    width:728 px;
    height:728 px;
    }




.starrating > input {display: none;}  /* Remove radio buttons */

.starrating > label:before { 
  content: "\f005"; /* Star */
  margin: 5px;
  font-size: 20px;
  font-family: FontAwesome;
  display: inline-block; 
}

.starrating > label
{
  color: #222222; /* Start color when not clicked */
}

.starrating > input:checked ~ label
{ color: #ffca08 ; } /* Set yellow color when star checked */

.starrating > input:hover ~ label
{ color: #ffca08 ;  } /* Set yellow color when star hover */

.TimePost{
	display:flex;
	justify-content:space-between;

}

    </style>
 
  </head>
  <body>
  <%@ include file="/header.jsp"%>

<p><a href='<%=request.getContextPath() %>/front-end/post/addPost.jsp'>新增</a>貼文</p>
	   <%@ include file="/front-end/page1.file" %>
	<c:forEach var="PostVO" items="${list}" begin="<%=pageIndex%>"
		end="<%=pageIndex+rowsPerPage-1%>">
		<jsp:useBean id="PostVO" scope="page" class="com.post.model.PostVO" />
		<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
		<jsp:useBean id="lmSvc" scope="page"
			class="com.leavemessage.model.LeaveMessageService" />
		<jsp:useBean id="resSvc" scope="page" class="com.res.model.ResService" />

		<div class="container ">
			<section class="my-4">
				<div class="row ">
					<!-- Grid column -->
					<div class="col-lg-4 md-5">
						<!-- Card -->
						<div class="card news-card">
							<!-- Heading-->
							<div class="card-body">
								<div class="content">
									<div class="title">
										<h3 id="poster">
											<img id="MemImg" src="https://picsum.photos/50/50?random=1"
												class="rounded-circle avatar-img z-depth-1-half"> PO文者
											: ${memSvc.memFindByPrimaryKey(PostVO.post_memno).mem_name}
										</h3>

										<div class="dropdown">
											<button class="btn btn-light " type="button"
												id="dropdownMenuButton" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false" title="不喜歡這篇貼文嗎?">
												...</button>
											<div class="dropdown-menu btn btn-light"
												aria-labelledby="dropdownMenuButton" id="down">
												<a class="dropdown-item" data-toggle="modal" data-target="#modalPoll-1">檢舉</a> 
<!-- 												<a class="dropdown-item" href="#">修改</a> -->

												<FORM METHOD="post" ACTION="post.do">
													<input type="submit" value="刪除" class="dropdown-item">
													<input type="hidden" name="post_no"
														value="${PostVO.post_no}"> 
														<input type="hidden" name="action" value="delete">
												</FORM>

											</div>
										</div>

									</div>
									<div class="right-side-meta">

										<div class="TimePost" id="postTime">
											<h4>${resSvc.getOneRes(PostVO.post_res_no).res_name}</h4>
											<FORM METHOD="post" ACTION="post.do">
												<small>po文時間 :<fmt:formatDate
														value="${PostVO.post_time}" pattern="yyyy-MM-dd HH:mm" /></small>
											</FORM>
										</div>
									</div>
								</div>
							</div>
							<!--cardBody1-->
							<!-- Card image-->
							<FORM METHOD="post" ACTION="post.do">


								<c:if test="${PostVO.getPost_img()!=null }">
									<% String pic =new String(Base64.getEncoder().encode(PostVO.getPost_img()),"UTF-8"); %>
									<img class="card-img-top" id="postImg" src="data:image/jpg;base64,<%=pic %>" />
								</c:if>
								<c:if test="${PostVO.getPost_img()==null }">
									<img id="" class="card-img-top"
										src="https://mdbootstrap.com/img/Photos/Others/girl1.jpg"
										alt="你沒有放圖片喔">
								</c:if>
							</FORM>
							<div class="card-body">
								<div class="social-meta">

									<FORM METHOD="post" ACTION="post.do">
										<p id="postText">
											我的po文內容<br>${PostVO.post_text}</p>
									</FORM>

									<span style="color: #69778c;"><i style="color: #F08080;"
										class="fa fa-gratipay"></i> 餐廳回應:${PostVO.post_respon}</span>

									<p>留言內容:</p>
									<div class=" listing-block"
										style="overflow-y: scroll; height: 80px;">

										<c:forEach var="lmVO"
											items="${lmSvc.getAllLeaveMessageByPost(PostVO.post_no)}">
											<h6 style="color: #000080;">
												<i class="fa fa-comment"></i>${memSvc.memFindByPrimaryKey(lmVO.lm_memno).mem_name}
											</h6>
											<p>${lmVO.lm_text}</p>
										</c:forEach>

									</div>


									<form class="form-inline" METHOD="post" ACTION="post.do">
										<div class="form-group mb-2">
											<p>評分: ${PostVO.post_rate}</p>
										</div>
										<div
											class="starrating risingstar d-flex  flex-row-reverse form-group mx-sm-3 mb-4">
											<input type="radio" id="star5" name="rating" value="5" /><label
												for="star5" title="5 star"></label> <input type="radio"
												id="star4" name="rating" value="4" /><label for="star4"
												title="4 star"></label> <input type="radio" id="star3"
												name="rating" value="3" /><label for="star3" title="3 star"></label>
											<input type="radio" id="star2" name="rating" value="2" /><label
												for="star2" title="2 star"></label> <input type="radio"
												id="star1" name="rating" value="1" /><label for="star1"
												title="1 star"></label>
										</div>
									</form>

								</div>
								<hr>
								<!-- Comment input -->

								<div class="md-form">
									<form class="form-inline" METHOD="post"
										ACTION="leavemessage.do" name="form1">
										<div class="form-group-start mb-2">
											<input placeholder="留言.." name="lm_text" type="text"
												id="form5" class="form-control" 
												value="<%= (LeaveMessageVO==null)? "" : LeaveMessageVO.getLm_text()%>">

										</div>
										<div class="form-group-end  mx-sm-3 mb-2">
											<input type="hidden" name="lm_postno"
												value="${PostVO.post_no}"> <input type="hidden"
												name="action" value="insert"> <input type="submit"
												class="btn btn-light" value="發佈">
										</div>
									</form>
								</div>

							</div>
							<!-- Card body -->
						</div>
						<!-- Card -->
					</div>
					<!-- Grid column -->



					<!--postCard 3張範圍-->
				</div>
			</section>
		</div>
	</c:forEach>

	



<%if (pageNumber>1) {%>

<!-- 檢舉視窗: -->
<div class="modal fade right bg-default " id="modalPoll-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true" >
  <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <p class="heading lead">
        	<strong>檢舉:</strong>
        </p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">×</span>
        </button>
      </div>

      <!--Body-->
      <div class="modal-body">
        <div class="text-center">
          <i class="far fa-file-alt fa-4x mb-3 animated rotateIn"></i>
          <p>
            <strong>說出你的需求</strong>
          </p>
        </div>

        <hr>

        <!-- Radio -->
        <p class="text-center">
          <strong>你想針對此篇文章檢舉的是:</strong>
        </p>
        <div class="form-check mb-4">
          <input class="form-check-input" name="group1" type="radio" id="radio-179" value="option1" checked>
          <label class="form-check-label" for="radio-179">飯局</label>
        </div>

        <div class="form-check mb-4">
          <input class="form-check-input" name="group1" type="radio" id="radio-279" value="option2">
          <label class="form-check-label" for="radio-279">貼文內容</label>
        </div>

        <div class="form-check mb-4">
          <input class="form-check-input" name="group1" type="radio" id="radio-379" value="option3">
          <label class="form-check-label" for="radio-379">留言檢舉</label>
        </div>
       
        <!-- Radio -->

        <p class="text-center">
          <strong>歡迎提供意見</strong>
        </p>
        <!--文字欄位-->
        <div class="md-form">
          <textarea type="text" id="form79textarea" class="md-textarea form-control" rows="3"></textarea>
         
        </div>

      </div>

      <!--Footer-->
      <div class="modal-footer justify-content-center">
       <button class="btn btn-info"> 送出<i class="fa fa-paper-plane ml-1"></i></button>          
        </a>
        <button class="btn btn-outline-info " data-dismiss="modal">取消 <i class="fa fa-times"></i></button>
      </div>
    </div>
  </div>
</div>
    <%@ include file="/front-end/page2.file" %>
<%}%>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 </body>
</html>