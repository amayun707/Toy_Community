<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Community</title>
</head>
<body>
<!-- member/loginPro.jsp -->
<%
// 한글처리
request.setCharacterEncoding("utf-8");

// 파라미터
String id = request.getParameter("id");
String pass = request.getParameter("pass");

//MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();

//정수형 변수 check = userCheck(아이디, 비밀번호) 메서드 호출
int check = mdao.userCheck(id, pass);

if(check == 1){ 
	
    session.setAttribute("id", id);
    response.sendRedirect("../main/main.jsp");
}
else if(check == 0){
    %>
    <script type="text/javascript">
    alert("비밀번호가 틀렸습니다");
    history.back();
    </script>
    <%
}
else{
    %>
    <script type="text/javascript">
    alert("아이디가 존재하지 않습니다");
    history.back();
    </script>
    <%
}
%>
</body>
</html>