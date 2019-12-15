<%@page import="downboard.downBoardBean"%>
<%@page import="downboard.downBoardDAO"%>
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

// int num 파라미터 가져오기 
int num = Integer.parseInt(request.getParameter("num"));

// 세션값 가져오기
String id = (String)session.getAttribute("id");

// 세션값이 없으면 login.jsp 이동
if(id == null){
    response.sendRedirect("../member/login.jsp");
}

downBoardDAO dbdao = new downBoardDAO();

downBoardBean dbb = dbdao.getBoard(num);

%>
<!-- 게시판 -->
<article>
<h1>Download Update</h1><br>
<form action="d_updatePro.jsp" name="fr" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="pageNum" value="<%=pageNum %>">
<input type="hidden" name="file" value="<%=dbb.getFile() %>">
<table id="notice" style="text-align: center;">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=dbb.getSubject()%>"></td></tr>
<%
if(dbb.getFile() == null){
    %>
    <tr><td>첨부파일</td><td colspan="3" style="text-align: center; padding-left: 80px;">
    <input type="file" name="file"></td></tr>
    <%
}
else{
    %>
    <tr><td>첨부파일</td>
    <td><img src="../upload/<%=dbb.getFile() %>" width="140" height="100"><br>
    <input type="file" name="file" style="padding-left: 80px;"></td></tr>
    <%
}
%>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=dbb.getContent()%></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글수정" class="btn">
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