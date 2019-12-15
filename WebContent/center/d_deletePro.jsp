<%@page import="downboard.downBoardDAO"%>
<%@page import="downboard.downBoardBean"%>
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
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String name = request.getParameter("name");

downBoardDAO dbdao = new downBoardDAO();

downBoardBean dbb = new downBoardBean();

//자바빈 멤버변수 <= 파라미터 저장
dbb.setNum(num);
dbb.setName(name);

//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션값이 존재하고 세션값의 글쓴이가 일치하면 글수정 할 수 있게 하기
if(id != null && id.equals(dbb.getName())) {
 
 dbdao.deleteBoard(dbb);
 %>
 <script type="text/javascript">
     alert("글삭제 완료");
     location.href ="download.jsp?num=<%=dbb.getNum()%>&pageNum=<%=pageNum %>";
 </script>
 <%
}
else {  
 %>
 <script type="text/javascript">
 alert("삭제 불가");
 history.back();
 </script>
 <%
}
%>
</body>
</html>