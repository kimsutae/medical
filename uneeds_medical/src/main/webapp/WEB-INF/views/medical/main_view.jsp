<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Hospital</title>

<link rel="stylesheet" href="../../../resources/medical/css/project.css">
<link rel="stylesheet" href="../../../resources/medical/css/font.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>


<div id="hd_wrapper">
        <ul id="tnb">
            <li><a href="#">회원가입</a></li>
            <li><a href="#"><b>로그인</b></a></li>

        </ul>
    </div>
<style type="text/css">
.btn-search {background: red none repeat scroll 0 0; border-radius: 25px; color: #fff; font-size: 19px; height: 43px; padding: 0 35px; text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}
</style>

    
    <div id="category-wrap">
        <div style="width:1200px; margin:0 auto;">
            
            <nav id="gnb">
                <ul id="gnb_1dul">
                    <li id="logo"> <a href="main_view"><img src="../../../resources/medical/img/doc.png" alt=""></a> </li>
                    
                    <li><a href="hospitalViewPage" ><img src="../../../resources/medical/img/find.png" /></a></li>
                    <li><a href="hospitalViewPage"><img src="../../../resources/medical/img/em.png" /></a></li>
                    <li><a href="medicalViewPage"><img src="../../../resources/medical/img/me.png" /></a></li>
                </ul>
                
                <!--상단 검색-->
                <div class="total_search_area01">
                    <div class="total_search01">
                        <input type="text" id="headerSearchValue" placeholder="키워드를 검색하세요." name="Name" title="검색어 입력">
                        <a href="#" id="btn-site-search"><img src="https://goodhospital.kr/theme/gh/images/search_icon_02.png"></a>
                    </div>
                </div>
            </nav>            
        </div>

        
    </div>
    <!-- } 상단 끝 -->
    
    
    <!-- 콘텐츠 시작 { -->
    <div id="wrapper">
        <div id="container-cover" style="display:none; background-color:#000;position:absolute;width:100%;height:2000px;top:127px; opacity:0.7;z-index:5;"></div>
        <div id="container">
<div class="m_cont_01">
    <p class="s_line"></p>
    <div style="width:1200px; height:700px; background-color:#fff; margin:0 auto; position:relative;">
        <p class="charact"><img src="../../../resources/medical/img/main_doctor.png" alt="의사 케릭터" /></p>
 		<p class="main_txt"><img src="https://goodhospital.kr/theme/gh/images/main_txt_01.png" /></p>
 
               <!-- 메인 검색 -->
        <div class="total_search_area">
            <div class="total_search">
                <input type="text" id="search-stx-index" placeholder="병원이름을 검색해보세요." name="Name" title="검색어 입력">
               <a href="#" id="btn-site-search-index"><img src="https://goodhospital.kr/theme/gh/images/search_icon.png"></a> </div>
        </div>
    </div>
 
    
</div>
</div>
</div>

<!-- } 콘텐츠 끝 -->
<script>
$(function(){
	// 상단 검색용
	$("#btn-site-search").on("click", function(){
		var hnames= $('#headerSearchValue').val();
		openNew(hnames);				
	});
	
	// 메인 검색용
	$("#btn-site-search-index").on("click", function(){
		var hnames= $('#search-stx-index').val();
		openNew(hnames);				
	});
	function openNew(hname){
// 		window.open("http://192.168.0.18:8080/uneeds/medical/hospitalViewPage?hname="+hname);
		window.open("http://localhost:8080/uneeds/medical/hospitalViewPage?hname="+hname);
	}
	
});
</script>
</body>
</html>