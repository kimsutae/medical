<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hospital</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" >
    var today = new Date();//오늘 날짜
 
 
    function prevClaendar(){//이전 달력
      today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
      buildCalendar();
    }
    //다음 달력을 오늘을 저장하고 달력에 뿌려줌
    function nextCalendar(){
      today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
      buildCalendar();
 
    }
    
    function buildCalendar(){
      var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
      var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
      var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
      var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
      tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
 
      //기존에 테이블에 잇던 달력 내용 삭제
      while(tblCalendar.rows.length>2){
        tblCalendar.deleteRow(tblCalendar.rows.length -1);
      }
      var row = null;
      row =tblCalendar.insertRow();
      var cnt =0;
      // 1일이 시작되는 칸을 맞추어줌
 
      for ( i=0; i <nMonth.getDay(); i++) {
        cell =row.insertCell();
        cnt = cnt + 1;
    }
      
      var day =null
      
      //달력 출력
      for(i=1; i<=lastDate.getDate(); i++){
        cell = row.insertCell();
        day = "<span class='choice' data-index="+i+"><a href='#'>";
        day += i;
        day +="</a></span>";
		cell.innerHTML = day;
        cnt = cnt + 1;
        if (cnt%7 == 0)    //1주=7일
         row = calendar.insertRow();
 
      }
    }

    </script>
    
    <script>
    $(function(){
        $("#choice").on("click",function(){
        	var ind = $(this).data("index");
        	consolo.log(ind);
        	alert(ind);
        });
       });
    
    </script>
<body>
<table id="calendar"  border="3" align="center" width="800" height="500"  >
      <tr >
        <td align ="center"> <label onclick="prevClaendar()"><</label> </td>
        <td colspan="5" align ="center" id="calendarYM">yyyy년 m월</td>
        <td align ="center"> <label onclick="nextCalendar()">></label> </td>
      </tr>
 
      <tr>
        <td align="center">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center">토</td>
      </tr>
 
    </table>
        
        <script type="text/javascript" >
 
          buildCalendar();
        </script>
 


</body>
</html>
