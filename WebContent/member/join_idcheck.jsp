<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Community</title>
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    
    function result(){
    	
    	opener.document.fr.id.value = document.wfr.userid.value;
    	opener.document.fr.id_hid.value = document.wfr.userid.value;
    	opener.document.fr.ischeck.value ='Y';
    	window.close();
    }
    
    function reEnter(){
    	opener.document.fr.id.value = null;
    }
    
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("userid");

MemberDAO mdao = new MemberDAO();

int check = mdao.idCheck(id);

if(check == 1){
	%>
	<script type="text/javascript">
	   alert("이미 존재하는 아이디입니다");
	   reEnter();
	</script>
	<form action="join_idcheck.jsp" id="join" method="post" name="wfr">
	아이디 : <input type="text" name="userid" value="<%=id %>">
	<input type="submit" value="아이디중복확인" class="dup">
	</form>
	<%
}
else if(check == 0){
	%>
	<script type="text/javascript">
	   alert("사용가능한 아이디입니다");
	</script>
	<form action="join_idcheck.jsp" id="join" method="post" name="wfr">
	아이디 : <input type="text" name="userid" value="<%=id %>">
    <input type="submit" value="아이디중복확인" class="dup">
    <input type="button" value="해당 아이디 사용" class="dup" onclick="result()">
    </form>
	<%
}
%>
</body>
</html>