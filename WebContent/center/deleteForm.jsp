<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Community</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
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
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="notice.jsp">자유게시판</a></li>
<li><a href="download.jsp">다운로드 게시판</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
// String pageNum 파라미터 가져오기
String pageNum = request.getParameter("pageNum");

// 파라미터 가져오기 
int num = Integer.parseInt(request.getParameter("num"));

// 세션값 가져오기
String id = (String)session.getAttribute("id");

// 세션값이 없으면 login.jsp 이동
if(id == null){
    response.sendRedirect("../member/login.jsp");
}

//BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();

// BoardBean bb 객체생성 후 getBoard(num)
BoardBean bb = bdao.getBoard(num);

%>
<!-- 게시판 -->
<article>
<h1>Notice Delete</h1><br>
<form action="deletePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="pageNum" value="<%=pageNum %>">
<input type="hidden" name="name" value="<%=bb.getName() %>">
<h2><b>이 게시물을 삭제하면 복구할 수 없습니다 정말 삭제하시겠습니까?</b></h2><br>
<div id="table_search">
<input type="submit" value="글삭제" class="btn">
<input type="button" value="취소" class="btn" onclick="history.back()">
</div>
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>