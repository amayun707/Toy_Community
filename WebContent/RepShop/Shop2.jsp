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
<h1>Toysrus</h1><br>
<figure class="ceo">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyA2O3ugI4qH1aBT9PUgg2C_yoWTGuMlpSk" ></script>
<div id="map_ma"></div>
<script type="text/javascript">
    $(document).ready(function() {
    var myLatlng = new google.maps.LatLng(35.837143,128.558612); // 위치값 위도 경도
    var Y_point         = 37.512115;        // Y 좌표
    var X_point         = 127.097912;       // X 좌표
    var zoomLevel       = 16;               // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
    var markerTitle     = "토이저러스 잠실점";      // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
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
<figcaption>[토이저러스 잠실점 위치]</figcaption>
</figure>
<h3>토이저러스(영어: Toys"Я"Us)는</h3>
<p>
1948년 미국 워싱턴 D.C.에서 찰스 P.라저러스에 의해<br>
첫번째 토이스 알 어스가 생겼다.<br>
라 저러스는 10년 후 영어로 장난감을 뜻하는 'Toy'와<br>
자신의 이름 'La Zarus'을 합하여 <br>
그의 두번째 가게인 'ToysRus'를 만들었다.<br>
그는 가게의 주요 소비층의 원인인 아이들의 시선을 끌기 위해서<br> 
가게이름을 'ToysRus'에서 알파벳'R'을 거꾸로 하여<br> 
Toys "Я" Us로 바꾸었다.<br>
2018년 8월 기준으로, 전 세계의 807개의 매장이 있다<br>
한국 공식 사이트 주소 : <a href="http://toysrus.lottemart.com/" target="_blank">http://toysrus.lottemart.com</a>
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