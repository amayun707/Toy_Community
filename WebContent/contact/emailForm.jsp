<%@page import="mail.GoogleAuthentication"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<div id="sub_img_center"></div>
<!-- 메인이미지 -->
<%
//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션값이 없으면 login.jsp 이동
if(id == null){
 response.sendRedirect("../member/login.jsp");
}

GoogleAuthentication ga = new GoogleAuthentication();

%>
<article>
<h1>Customer Inquiry</h1>
<form action="mailSend" id="join" method="post">
<fieldset>
<legend>고객 문의</legend>
<table>
  <tr><td>고객 아이디 </td><td><input type="text" name="sender" value="<%=id %>" readonly></td></tr>
  <tr><td>고객 문의 주소 </td><td><input type="text" name="receiver" value="<%=ga.getEmailID() %>" readonly></td></tr>
  <tr><td>문의 제목 </td><td><input type="text" name="subject"></td></tr>
  <tr><td>문의 내용 </td><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
</table>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="전송" class="submit">
<input type="reset" value="취소" class="cancel" onclick="location.href='../main/main.jsp'">
</div>
</form>
</article>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>