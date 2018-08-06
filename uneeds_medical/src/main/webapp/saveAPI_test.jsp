<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test API</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>
$(function (){
	
	$.get("SidoAPI.jsp", function(data){
		var items = $(data).find("item");
		ul = $("#z1");
		for (var i=0; i<items.length; i++){
			item=$(items[i]);
			ul.append("<li><input type='text' value='"+item.find("addrCd").text()+"' /><input type='text' value='"+item.find("addrCdNm").text()+"' /></li>");
			}
		});
	

});

</script>

<body>

<ul id="z1">
<li><h1>Test</h1></li>
 </ul>
<button type="button">저장하기</button>
</body>
</html>