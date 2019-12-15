<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Community</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style>
#map_ma {width:280px; height:250px; clear:both; border:solid 1px white;}
</style>
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="Shop.jsp">Hamleys</a></li>
<li><a href="Shop2.jsp">Toysrus</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>Hamleys</h1><br>
<figure class="ceo">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyA2O3ugI4qH1aBT9PUgg2C_yoWTGuMlpSk" ></script>
<div id="map_ma"></div>
<script type="text/javascript">
    $(document).ready(function() {
    var myLatlng = new google.maps.LatLng(35.837143,128.558612); // 위치값 위도 경도
    var Y_point         = 51.512902;        // Y 좌표
    var X_point         = -0.140207;       // X 좌표
    var zoomLevel       = 18;               // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
    var markerTitle     = "햄리스 장난감 백화점";      // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
    var markerMaxWidth  = 500;              // 마커를 클릭했을때 나타나는 말풍선의 최대 크기
    
    var myLatlng = new google.maps.LatLng(Y_point, X_point);
    var mapOptions = {
                        zoom: zoomLevel,
                        center: myLatlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
    var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
    var marker = new google.maps.Marker({
                                            position: myLatlng,
                                            map: map,
                                            title: markerTitle
    });
    var infowindow = new google.maps.InfoWindow(
                                                {
                                                    content: contentString,
                                                    maxWizzzdth: markerMaxWidth
                                                }
            );
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
    });
});
</script><br>
<figcaption>[런던 햄리스 백화점 위치]</figcaption>
</figure>
<h3>  햄리스(영어: Hamleys)는</h3>
<p>
세계에서 가장 오래되고 규모가 제일 큰 장난감 가게이다.<br>
런던의 햄리스는 세계에서 가장 큰 토이 스토어로 유명한 곳이다.<br>
장난감 박물관이라고 해도 손색없을 정도로 큰 규모이며,<br>
지하를 포함한 총 7개의 층으로 이루어져 있다.<br>
디즈니, 키티, 스펀지 밥과 같은 유명 캐릭터 인형,<br>
해리포터 장난감, 바비인형, 로봇 장난감 등  <br>
어린이 사랑하는 수많은 종류의 장난감으로 가득 차 있다.<br>
레고 코너는 레고를 사랑하는 어른들에게도 인기가 많다.<br>
비누방울 쇼와 공연 등 각종 이벤트도 자주 펼쳐진다.<br>
공식 사이트 주소 : <a href="https://www.hamleys.com/" target="_blank">https://www.hamleys.com/</a>
</p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>