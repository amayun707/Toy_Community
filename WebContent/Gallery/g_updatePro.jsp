<%@page import="gallery.galleryDAO"%>
<%@page import="gallery.galleryBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
// cos.jar 프로그램 이용 파일업로드
// upload 폴더 만들기 => upload 물리적 경로 필요
String uploadPath = request.getRealPath("/upload");

// 파일최대크기 지정 (5MB)
int maxSize = 5*1024*1024;

//MultipartRequest 객체생성
//MultipartRequest multi = new MultipartRequest(request, 업로드할폴더명, 파일최대크기, 한글처리, 파일명이 동일할 경우 이름변경 );
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

// request => multi name, pass, subject, content 파라미터 가져와서 => 변수 저장
int num = Integer.parseInt(multi.getParameter("num"));
String pageNum = multi.getParameter("pageNum");

String name = multi.getParameter("name");
String pass = multi.getParameter("pass");
String subject = multi.getParameter("subject");
String content = multi.getParameter("content");
String prefile = multi.getParameter("file");

String file = multi.getFilesystemName("file");
String org_file = multi.getOriginalFileName("file");

galleryBean gb = new galleryBean();

//자바빈 멤버변수 <= 파라미터 저장
gb.setNum(num);
gb.setName(name);
gb.setPass(pass);
gb.setSubject(subject);
gb.setContent(content);
gb.setFile(org_file);

galleryDAO gdao = new galleryDAO();

//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션값이 존재하고 세션값의 글쓴이가 일치하면 글수정 할 수 있게 하기
if(id != null && id.equals(gb.getName())) {
    
	if(gb.getFile() == null){
		gb.setFile(prefile);
	}
	
	gdao.updateBoard(gb);	
    %>
    <script type="text/javascript">
        alert("글수정 완료");
        location.href ="gallery.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum %>";
    </script>
    <%
}
else {  
    %>
    <script type="text/javascript">
    alert("수정 불가");
    history.back();
    </script>
    <%
}
%>
</body>
</html>