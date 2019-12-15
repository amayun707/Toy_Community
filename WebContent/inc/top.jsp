<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");

// 세션값이 없으면 login | join
if(id == null){
	%>
	<div id="login"><a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a></div>
	<%
}
// 세션값이 있으면 ...님 로그인| logout | 회원정보 수정
else if(id != null){
	%>
	<div id="login"><%=id %>님 [로그인] | <a href="../member/logout.jsp">로그아웃</a> | 
	<a href="../member/updateForm.jsp?id=<%=id %>">회원정보수정</a></div>
	<%
}
%>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../images/main_logo.PNG" width="265" height="62" alt="Toy Community"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../RepShop/Shop.jsp">Rep Shop</a></li>
	<li><a href="../center/notice.jsp">Member Board</a></li>
	<li><a href="../Gallery/gallery.jsp">Gallery</a></li>
	<li><a href="../contact/emailForm.jsp">CONTACT US</a></li>
</ul>
</nav>
</header>