<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Welcome to EGG !</title>

  <!-- Bootstrap core CSS -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="css/all.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


  <!-- Custom styles for this template -->
  <link href="css/small-business.css" rel="stylesheet">
  <style>
    body{
      font-family:"微軟正黑體";
    background-color: #D9C5A8;
    }


.btn  {
  z-index: 1;
  position: relative;
  font-size: inherit;
  font-family: inherit;
  color: white;
  padding: 0.5em 1em;
  outline: none;
  border: none;
  background-color: #F4D03F;
  overflow: hidden;
  transition: color 0.4s ease-in-out;
}
.btn ::before {
  content: '';
  z-index: -1;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  background-color: #fff;
  transform-origin: center;
  transform: translate3d(-50%, -50%, 0) scale3d(0, 0, 0);
  transition: transform 0.45s ease-in-out;
}

.btn  :hover {
  cursor: pointer;
  color: #F4D03F;
}

.btn  :hover ::before {
  transform: translate3d(-50%, -50%, 0) scale3d(15, 15, 15);
}



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
.card{
  background-color: #ED8532;
}

footer{
  background-color: #ED8532; 
}

</style>

</head>

<body>

  <!-- Navigation 上方NAVBAR -->
  
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

<form id="form1">

  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">帳號</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Account" name="member_id">
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">密碼</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="mem_pwd">
    </div>
  </div>



</form>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary">確認</button>

      </div>

    </div>
  </div>
</div>




  <!--廣告牆-->
   <div class="container">
  <div class="bd-example">
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://picsum.photos/1080/500?random=1" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>第一廣告區</h5>
          <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="https://picsum.photos/1080/500?random=2" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>第二廣告區</h5>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="http://placehold.it/1080x500" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>第三廣告區</h5>
          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>



  <!-- Page Content -->
  <div class="container">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div class="col-lg-7">
        <img class="img-fluid rounded mb-4 mb-lg-0" src="https://picsum.photos/900/400?random=5" alt="">
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5">
        <h1 class="font-weight-light">來看看附近美食吧!</h1>
        <p>還在想要吃什麼嗎?加入會員，成為主揪，與他人製造美好的相遇吧!
        我是一張900*400的圖片!</p>
        
 
          <button  class="btn" href="#">點我進入美食搜尋!</button>
 
        
      </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->


    <!-- Call to Action Well -->
      <div class="card text-dark  my-5 py-4 text-center">
      <img class="img" src="https://picsum.photos/1080/450" alt="">
      <div class="card-body" >
        <p class="text-white m-0">這裡可以放網站宣傳圖片</p>

      </div>
      </div>
    </div>



    <!-- Content Row -->
    <div class="row">
    <!-- Page Content -->
    <div class="container">

      <!-- 我是飯局-->
      <h1 class="my-4">飯局瀏覽:
        <small>創造一起吃飯的樂趣吧!</small>
      </h1>

      <!-- Project One -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="https://picsum.photos/700/550?random=1" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project One</h3>

          <small>最後於<time>9:00</time>發布</small>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur beatae fugit qui voluptate, ipsam repellat aliquam magnam non rerum. Odit iusto perspiciatis rerum tempore fuga perferendis dolorem sapiente autem, ipsam fugit iste harum eius veniam exercitationem in dolorum cupiditate voluptates dignissimos ratione itaque odio qui eveniet atque? Velit at provident consequatur voluptate vel, commodi, asperiores ut ducimus saepe repellat laborum laboriosam sint cupiditate doloremque iure tenetur accusamus, rerum ad ipsum neque nulla modi. Repellendus, libero, quos odit blanditiis obcaecati voluptatibus cupiditate aliquid dicta dignissimos corporis amet nam eligendi ducimus totam cum, omnis quo numquam provident. Quos ex tenetur, nesciunt minus!</p>
          <a class="btn btn-warning" href="#">JOIN!</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Two -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="https://picsum.photos/700/550?random=2" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project Two</h3>
          <small>最後於<time>8:00</time>發布</small>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, culpa beatae deleniti mollitia temporibus accusamus facere molestiae eveniet soluta laudantium dolorum voluptatibus amet adipisci dolor nemo voluptatum fugiat. Facere necessitatibus sapiente ab quis tenetur, quisquam totam a saepe similique ea eius libero cumque deleniti iusto tempore dignissimos expedita esse. Id eos possimus quidem maxime dolorum dolorem temporibus nisi soluta ratione vitae culpa error saepe aspernatur eum iure quam similique modi fugiat officia, perferendis pariatur. Ea, esse, culpa? Suscipit nemo autem vel repellendus natus incidunt ea similique aspernatur quia porro asperiores labore enim totam ex iure, dolorum voluptatem, cumque consectetur! Iusto.</p>
          <a class="btn btn-warning" href="#">JOIN!</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Three -->
      <div class="row">
        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="https://picsum.photos/700/550?random=3" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project Three</h3>
          <small>最後於<time>9:00</time>發布</small>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora quis, laboriosam autem porro commodi delectus culpa atque placeat. Fugit, numquam. Consequuntur quaerat asperiores dolores explicabo molestias repellat velit fugiat, cupiditate sed eligendi, similique. Asperiores consequuntur autem magni ea, doloremque rem quod iusto modi, quasi ducimus nisi? Incidunt culpa obcaecati quisquam voluptatibus iusto, ut quod hic quaerat voluptatum itaque. Labore vitae quam harum eum provident at porro officiis sequi, iste distinctio optio, eveniet, voluptate saepe minus, architecto ex perferendis dolorem accusantium adipisci repudiandae facere natus exercitationem. Eius ad pariatur nostrum hic assumenda, voluptatibus similique quae quo, suscipit eaque perferendis obcaecati dolorem!</p>
          <a class="btn btn-warning" href="#">JOIN!</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Four -->
      <div class="row">

        <div class="col-md-7">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x550" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>Project Four</h3>
          <small>最後於<time>9:00</time>發布</small>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse cum autem necessitatibus. Doloribus veritatis aperiam ad rerum et, architecto itaque rem distinctio! Modi maxime deleniti illum quasi molestiae aliquid nam dignissimos tempora illo doloremque odit consequuntur sint sequi dicta, impedit rem veniam? Accusantium, magnam, quae. Doloribus, repellendus, pariatur. Dignissimos tempore eum voluptas, officiis sequi suscipit expedita molestias in quae quidem praesentium, possimus facilis aliquid aliquam. Qui, numquam, sed. Magnam necessitatibus sequi est voluptate quisquam quod cumque molestiae placeat temporibus doloribus, aliquid harum et iure itaque vel consectetur rerum eligendi iste animi error omnis accusamus soluta a expedita natus? Iure, distinctio.</p>
          <a class="btn btn-warning" href="#">JOIN!</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>
      <br>


      <!-- 底下換頁標籤 -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

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

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
