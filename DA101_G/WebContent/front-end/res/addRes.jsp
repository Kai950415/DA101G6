<%@page import="java.time.LocalTime"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.res.model.*,java.text.SimpleDateFormat"%>

<%
	ResVO resVO = (ResVO) request.getAttribute("resVO");
%>
<% 
	String res_city = null;
	
	try{
		res_city = resVO.getRes_adrs().substring(0,3);
	}catch(Exception e){
		res_city = null;
	}

	String res_town = null;
	
	int x = 0;
	if(resVO!=null && resVO.getRes_adrs().length() !=0){
		if(resVO.getRes_adrs().indexOf("鄉", 3)==4 ||
				   resVO.getRes_adrs().indexOf("鎮", 3)==4 ||
				   resVO.getRes_adrs().indexOf("市", 3)==4 ||
				   resVO.getRes_adrs().indexOf("區", 3)==4){
					x=5;
				}else if(resVO.getRes_adrs().indexOf("鄉", 3)==5 ||
						 resVO.getRes_adrs().indexOf("鎮", 3)==5 ||
						 resVO.getRes_adrs().indexOf("市", 3)==5 ||
						 resVO.getRes_adrs().indexOf("區", 3)==5){
					x=6;
				}else if(resVO.getRes_adrs().indexOf("鄉", 3)==6 ||
						 resVO.getRes_adrs().indexOf("鎮", 3)==6 ||
						 resVO.getRes_adrs().indexOf("市", 3)==6 ||
						 resVO.getRes_adrs().indexOf("區", 3)==6 ||
						 resVO.getRes_adrs().indexOf("島", 3)==6){
					x=7;
				}else{
					x=8;
				}
			}
	
	try{
		res_town = resVO.getRes_adrs().substring(3,x);
	}catch(Exception e){
		res_town = null;
	}
%>
${resVO==null}--<%=resVO == null%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>餐廳資料新增 - addRes.jsp</title>

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
	width: 1000px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>
<style>
.city, .town{width: 100%;}
.f1{float:left;margin-left:5px;margin-right:5px;width:calc(5% - 10px)}
.f2{float:left;margin-left:5px;margin-right:5px;width:calc(10% - 10px)}
.f3{float:left;margin-left:5px;margin-right:5px;width:calc(15% - 10px)}
.f4{float:left;margin-left:5px;margin-right:5px;width:calc(20% - 10px)}
.f5{float:left;margin-left:5px;margin-right:5px;width:calc(25% - 10px)}
.f6{float:left;margin-left:5px;margin-right:5px;width:calc(30% - 10px)}
.f7{float:left;margin-left:5px;margin-right:5px;width:calc(35% - 10px)}
.f8{float:left;margin-left:5px;margin-right:5px;width:calc(40% - 10px)}
.f9{float:left;margin-left:5px;margin-right:5px;width:calc(45% - 10px)}
.f10{float:left;margin-left:5px;margin-right:5px;width:calc(50% - 10px)}
.f11{float:left;margin-left:5px;margin-right:5px;width:calc(55% - 10px)}
.f12{float:left;margin-left:5px;margin-right:5px;width:calc(60% - 10px)}
.f13{float:left;margin-left:5px;margin-right:5px;width:calc(65% - 10px)}
.f14{float:left;margin-left:5px;margin-right:5px;width:calc(70% - 10px)}
.f15{float:left;margin-left:5px;margin-right:5px;width:calc(75% - 10px)}
.f16{float:left;margin-left:5px;margin-right:5px;width:calc(80% - 10px)}
.f17{float:left;margin-left:5px;margin-right:5px;width:calc(85% - 10px)}
.f18{float:left;margin-left:5px;margin-right:5px;width:calc(90% - 10px)}
.f19{float:left;margin-left:5px;margin-right:5px;width:calc(95% - 10px)}
.f20{float:left;margin-left:5px;margin-right:5px;width:calc(100% - 10px)}
</style>
</head>
<body bgcolor='white'>

	<table id="table-1" width="800px">
		<tr>
			<td>
				<h3>餐廳資料新增 - addRes.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="/DA101G6/back-end/res/select_page.jsp">
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

	<FORM METHOD="post" ACTION="res.do" name="form1" enctype="multipart/form-data">
		<table width="1000px">
			<tr>
				<td>餐廳名稱:</td>
				<td><input type="TEXT" name="res_name" size="45"
					value="<%=(resVO == null) ? "" : resVO.getRes_name()%>" /></td>
			</tr>
			<tr>
				<td>餐廳地址:</td>
				<td>
				<div id="zipcode">
					<div class="f6" data-role="county"></div>
					<div class="f8" data-role="district"></div>
				</div><input name="address" type="text" class="f5 address form-control"
				value="<%=(resVO == null) ? "" : resVO.getRes_adrs().substring(x)%>"></td>
			</tr>

			<tr>
				<td>餐廳電話:</td>
				<td><input type="TEXT" name="res_ph" size="45"
					value="<%=(resVO == null) ? "" : resVO.getRes_ph()%>" /></td>
			</tr>

			<tr>
				<td>餐廳帳號:</td>
				<td><input type="TEXT" name="res_ac" size="45"
					value="<%=(resVO == null) ? "" : resVO.getRes_ac()%>" /></td>
			</tr>

			<tr>
				<td>餐廳密碼:</td>
				<td><input type="password" name="res_pass" size="45"
					value="<%=(resVO == null) ? "" : resVO.getRes_pass()%>" /></td>
			</tr>

			<tr>
				<td>密碼確認:</td>
				<td><input type="password" name="res_pass2" size="45"
					value="<%=(resVO == null) ? "" : resVO.getRes_pass()%>" /></td>
			</tr>

			<tr>
				<td>餐廳照片:</td>
				<td><input type="file" name="res_img" size="20" 
					accept="image/gif, image/jpeg, image/png"
					id="imgpv"
					value="<%=(resVO == null) ? "" : resVO.getRes_img()%>" /></td>
				<td><img width="300" height="200" id="preview_img" src="/DA101G6/images/noimg.jpg"></td>	
			</tr>

			<tr>
				<td>餐廳介紹:</td>
				<td><input type="TEXT" name="res_intro" size="20"
					value="<%=(resVO == null) ? "" : resVO.getRes_intro()%>" /></td>
			</tr>

			<tr>
				<td>營業時間:</td>
				<td><input name="res_start" id="f_date1" type="text">~
				<input name="res_end" id="f_date2" type="text"></td>
			</tr>
				<tr>
				<%int cost = 0;%>
				<%String level[] = {"Free","Inexpensive","Moderate","Expensive","Very Expensive"};
				%>
				<td>消費水準:<font color=red><b>*</b></font></td>
				<td><select size="1" name="res_cost">
			<c:forEach var="cost" begin="1" end="5" step="1">
				<option value="<%=cost%>"
				<%=(resVO != null && (resVO.getRes_cost()) == cost)? "selected" : "" %>
				><%=level[cost] %>
				<%++cost; %>
			</c:forEach>
				</select></td>
			</tr>

			<tr>
				<td>餐廳類型:</td>
				<td><input type="TEXT" name="res_type" size="20"
					value="<%=(resVO == null) ? "" : resVO.getRes_type()%>" /></td>
			</tr>


		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
<!-- =========================================以下為 datetimepicker 圖片預覽 地址 之相關設定========================================== -->

<%
	LocalTime res_start = null;
	try {
		res_start = LocalTime.parse(resVO.getRes_start());
	} catch (Exception e) {
		res_start = LocalTime.of(0, 0);
	}

	LocalTime res_end = null;
	try {
		res_end = LocalTime.parse(resVO.getRes_end());
	} catch (Exception e) {
		res_end = LocalTime.of(0, 0);
	}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       datepicker:false,
	       step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'H:i',         //format:'Y-m-d H:i:s',
		   value: '<%=res_start%>', 
	// value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});

        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       datepicker:false,
	       step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'H:i',         //format:'Y-m-d H:i:s',
		   value: '<%=res_end%>',
	// value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
	// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

	//      1.以下為某一天之前的日期無法選擇
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.以下為某一天之後的日期無法選擇
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>
<script>
$("#imgpv").change(function(){
    //當檔案改變後，做一些事 
   readURL(this);   // this代表<input id="imgInp">
 });
function readURL(input){
	  if(input.files && input.files[0]){
	    var reader = new FileReader();
	    reader.onload = function (e) {
	       $("#preview_img").attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

<script>
$("#zipcode").twzipcode({
	"countySel": '<%=res_city%>', // 城市預設值, 字串一定要用繁體的 "臺", 否則抓不到資料
	"districtSel": '<%=res_town%>', // 地區預設值
	"zipcodeIntoDistrict": true,
	"css": ["city form-control", "town form-control"],
	"countyName": "res_city", // 指定城市 select name
	"districtName": "res_town" // 指定地區 select name
	});
</script>
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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</html>