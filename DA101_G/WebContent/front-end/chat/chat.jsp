<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*"%>

<%
	MemVO memVO = (MemVO) session.getAttribute("memberVO");
	pageContext.setAttribute("memVO",memVO);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Chat Room</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="chat_css/styles.css" type="text/css"/>
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    </head>
    
    <body onload="connect();" onunload="disconnect();">
    	<%@ include file="/header.jsp"%>
        <h1> Chat Room </h1>
	    <h3 id="statusOutput" class="statusOutput"></h3>
	    <div id="fileHolder"></div>
	    <div id="messagesArea"></div>
        <div class="panel input-area">
            <input id="userName" class="text-field" type="text" placeholder="使用者名稱"  value="${memVO.mem_name}" readonly="readonly"/>
            <input id="message"  class="text-field" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/>
            <input type="submit" id="sendMessage" class="button" value="送出" onclick="sendMessage();"/>
		    <input type="button" id="connect"     class="button" value="連線" onclick="connect();"/>
		    <input type="button" id="disconnect"  class="button" value="離線" onclick="disconnect();"/>
	    </div>
	    <%@ include file="/footer.jsp"%>
    </body>
    
<script>
    
    var MyPoint = "/MyEchoServer";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			updateStatus("WebSocket 成功連線");
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connect').disabled = true;
			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
	        var jsonObj = JSON.parse(event.data);
	        var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";
	        messagesArea.innerHTML = messagesArea.innerHTML +message+ "<br>";
	        messagesArea.scrollTop = messagesArea.scrollHeight;
		};

		webSocket.onclose = function(event) {
			updateStatus("WebSocket 已離線");
		};
	}
	
	
	var inputUserName = document.getElementById("userName");
	inputUserName.focus();
	
	function sendMessage() {
	    var userName = inputUserName.value.trim();
	    if (userName === ""){
	        alert ("使用者名稱請勿空白!");
	        inputUserName.focus();	
			return;
	    }
	    
	    var inputMessage = document.getElementById("message");
	    var message = inputMessage.value.trim();
	    
	    if (message === ""){
	        alert ("訊息請勿空白!");
	        inputMessage.focus();	
	    }else{
	        var jsonObj = {"userName" : userName, "message" : message};
	        webSocket.send(JSON.stringify(jsonObj));
	        inputMessage.value = "";
	        inputMessage.focus();
	    }
	}
	
	
	function disconnect () {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}

	
	function updateStatus(newStatus) {
		statusOutput.innerHTML = newStatus;
	}
    
</script>

<script>

var filereader_support = typeof FileReader != 'undefined';
if(!filereader_support) {
	 alert("No FileReader support");
}
var dnd_support = 'draggable' in document.createElement('span');
if(!dnd_support) {
	 alert("No draggable support");
}
var fileHolder = document.getElementById('fileHolder');
 
acceptedTypes = {
  'image/png': true,
  'image/jpeg': true,
  'image/gif': true
};

document.addEventListener("dragover", function(event) {
	event.preventDefault();
    event.target.className = 'hover';
},false);

document.addEventListener("drop", function(event) {
	event.preventDefault();
    event.target.className = '';
    readfiles(event.dataTransfer.files);
});


function readfiles(files) {
  for (var i = 0; i < files.length; i++) {
     previewfile(files[i]);
  }
 
}

function previewfile(file) {
	  if (filereader_support === true && acceptedTypes[file.type] === true) {
	       var reader = new FileReader();
	       reader.onload = function (event) {
	          var image = new Image();
	          image.src = event.target.result;
	          fileHolder.appendChild(image);
	          
	          var userName = inputUserName.value.trim();
			  if (userName === ""){
			      alert ("使用者名稱請勿空白!");
			      inputUserName.focus();	
			      return;
			  }
			    	    
			  var message = '<img src='+event.target.result+'>';
			  var jsonObj = {"userName" : userName, "message" : message};
			  webSocket.send(JSON.stringify(jsonObj));
	          
	       };
	       reader.readAsDataURL(file);

	      
	       
	       
	  } else {
	       alert(file.type);
	  }
}
	
</script>

</html>
