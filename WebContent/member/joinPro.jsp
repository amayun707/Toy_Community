<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Community</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");

// 파라미터
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
Timestamp reg_date = new Timestamp(System.currentTimeMillis());
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");

// MemberBean mb 객체
MemberBean mb = new MemberBean();

// 멤버변수
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);

// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();

// insertMember(mb) 메서드
mdao.insertMember(mb);
%>
<script type="text/javascript">
    alert("회원가입 성공");
    location.href="login.jsp";
</script>
</body>
</html>