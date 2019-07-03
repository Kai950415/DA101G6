<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="css/all.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  
  <!-- Navigation 上方NAVBAR -->
  
  <style>
  .navbar .navbar-nav .nav-item .nav-link{
  position: relative;
}

.navbar .navbar-nav .nav-item .nav-link::before {
  content: '';
  position: absolute;
  left: 50%;
  width: 100%;
  height: 2px;
  background-color: #3cefff;
  transform-origin: center;
  transform: translateX(-50%) scaleX(0);
  transition: transform 0.4s ease;
}

.navbar .navbar-nav .nav-item .nav-link::before {
  top: 90%;
}

.navbar .navbar-nav .nav-item .nav-link::after {
  bottom: 0%;
}

.navbar .navbar-nav .nav-item .nav-link:hover::before, span:hover::after {
  transform: translateX(-50%) scaleX(1);
}

.navbar {
  background-color: #ea771b;
}
.navbar .navbar-brand {
  color: #603514;
}
.navbar .navbar-brand:hover,
.navbar .navbar-brand:focus {
  color: #fff;
}
.navbar .navbar-text {
  color: #603514;
}
.navbar .navbar-text a {
  color: #4e237e;
}
.navbar .navbar-text a:hover,
.navbar .navbar-text a:focus {
  color: #4e237e; 
}
.navbar .navbar-nav .nav-link {
  color: #603514;
  border-radius: .25rem;
  margin: 0 0.25em;
}
.navbar .navbar-nav .nav-link:not(.disabled):hover,
.navbar .navbar-nav .nav-link:not(.disabled):focus {
  color: #fff;
}
  
  </style>
  
  <nav class="navbar navbar-expand-lg navbar-default bg-default fixed-top" >
    <div class="container">
    
      <a class="navbar-brand" href="#">Start For EGG!</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">登入
    <!-- -->
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">好友</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">餐廳</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">飯局</a>
          </li>
         
        </ul>

      </div>
    </div>
  </nav>
  <br>


<!-- 登入跳出視窗 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">會員登入</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

<form id="form1" action="<%=request.getContextPath()%>/loginhandler" method="post">

  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">帳號</label>
    <div class="col-sm-10">
      <input class="form-control mr-sm-2 bg-white" type="text" placeholder="member_id" name="member_id">
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">密碼</label>
    <div class="col-sm-10">
      <input class="form-control mr-sm-2 bg-white" type="password" placeholder="password" name="mem_pwd">
    </div>
  </div>

  <div class="form-group row">
    <div class="col-sm-2">記住我</div>
    <div class="col-sm-10">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck1">
        <label class="form-check-label" for="gridCheck1">
          不建議在公共電腦上點選
        </label>
      </div>
    </div>
  </div>
</form>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="submit" class="btn btn-primary">確認</button>

      </div>

    </div>
  </div>
</div>