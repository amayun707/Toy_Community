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
// int num  파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));

// String pageNum 파라미터 가져오기
String pageNum = request.getParameter("pageNum");

downBoardDAO dbdao = new downBoardDAO();

//updateReadcount(num) 조회수 증가 메서드 호출
dbdao.updateReadcount(num);

downBoardBean dbb = dbdao.getBoard(num);

// content 엔터키 "\r\n" => "<br>"
String content = dbb.getContent();

if(content != null){
    content = content.replace("\r\n", "<br>");
}
%>
<!-- 게시판 -->
<article>
<h1>Download Content</h1>
<table id="notice" style="text-align: center;">
<tr><th class="tno">글번호</th><td><%=dbb.getNum() %></td>
    <th class="tno">글쓴<br>날짜</th><td><%=dbb.getDate() %></td></tr>
<tr><th class="tno">글쓴이</th><td><%=dbb.getName() %></td>
    <th class="tno">조회수</th><td><%=dbb.getReadcount() %></td></tr>
<tr><th class="tno">제목</th><td colspan="3"><%=dbb.getSubject() %></td></tr>
<%
if(dbb.getFile() == null){
    %>
    <tr><td>첨부파일</td><td colspan="3" style="text-align: center;">[ ----- x ----- ]</td></tr>
    <%
}
else{
    %>
    <tr><td>첨부파일</td><td colspan="3">
        <b><%=dbb.getFile() %><a href="../upload/<%=dbb.getFile() %>" target="_blank"> [ 자세히 보기 ]</a></b><br>
        <img src="../upload/<%=dbb.getFile() %>" width="140" height="100"><br>
        <a href="file_down2.jsp?file_name=<%=dbb.getFile()%>">[ 다운로드 : <%=dbb.getFile()%> ]</a></td></tr>
    <%
}
%>
<tr><td class="tno">내용</td><td colspan="3"><%=content %></td></tr>
</table>

<div id="table_search">
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");

// 세션값이 존재하고 세션값의 글쓴이가 일치하면 글수정 글삭제 버튼 보이기
if(id != null && id.equals(dbb.getName())){
    %>
    <input type="button" value="글수정" class="btn" 
    onclick="location.href='d_updateForm.jsp?num=<%=dbb.getNum() %>&pageNum=<%=pageNum %>'">
    <input type="button" value="글삭제" class="btn" 
    onclick="location.href='d_deleteForm.jsp?num=<%=dbb.getNum() %>&pageNum=<%=pageNum %>'">
    <%
}
%>
<input type="button" value="글목록" class="btn" onclick="location.href='download.jsp?pageNum=<%=pageNum %>'">
</div>
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