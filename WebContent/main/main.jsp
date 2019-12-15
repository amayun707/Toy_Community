<%@page import="gallery.galleryDAO"%>
<%@page import="gallery.galleryBean"%>
<%@page import="downboard.downBoardBean"%>
<%@page import="downboard.downBoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img3.jpg"
 width="971" height="282" style="opacity: 1.2;"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<table style="border-spacing: 30px;">
<%
// BoardDAO bdao 객체생성  
galleryDAO gdao = new galleryDAO();

// 게시판 전체 글개수  가져오기  select count(*)
int count_ = gdao.getBoardCount();

// 한 화면에 보여줄 글개수 설정
int pageSize_ = 6;

//pageNum="1" 설정
String pageNum_ = "1";

int currentPage_ = Integer.parseInt(pageNum_);

// 시작하는 행번호 구하기
int startRow_ = (currentPage_-1) * pageSize_+1;

// 날짜형태 변경 => 문자열 변경
SimpleDateFormat sdf_ = new SimpleDateFormat("yyyy.MM.dd");

// List boardList = getBoardList()호출
List boardList_ = gdao.getBoardList(startRow_, pageSize_);

int row = 1; // 게시판의 행
int col = 6; // 게시판의 열

if (count_ != 0) {
    for (int i = 0; i < boardList_.size(); i++, row++) {
        if (row % col == 1) {
%>
<tr>
<%
        }
        galleryBean gb = (galleryBean)boardList_.get(i);
%>
    <td style="text-align: center;">
    <img src="../upload/<%=gb.getFile()%>" width="100" height="100" onclick="location.href='../Gallery/g_content.jsp?num=<%=gb.getNum()%>&pageNum=<%=pageNum_%>'"> 
    <br> <label>제목 : </label><%=gb.getSubject()%><br> <label>작성자 : </label><%=gb.getName()%><br> 
    <label>작성일 : </label><%=sdf_.format(gb.getDate())%></td>
    <%
        if (row % col == 0) {
    %>
    </tr>
    <%
            break;
        }
    }
}
%>
</table>
</div>
<div class="clear"></div>
<div id="news_notice">
<h3 class="brown">-- 자유 게시판 --</h3>
<table>
<%
// BoardDAO bdao 객체생성  
BoardDAO bdao = new BoardDAO();

// 게시판 전체 글개수  가져오기  select count(*)
int count = bdao.getBoardCount();

// 한 화면에 보여줄 글개수 설정
int pageSize = 5;

//pageNum="1" 설정
String pageNum = "1";

int currentPage = Integer.parseInt(pageNum);

// 시작하는 행번호 구하기
int startRow = (currentPage-1) * pageSize+1;

// 날짜형태 변경 => 문자열 변경
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

// List boardList = getBoardList()호출
List boardList = bdao.getBoardList(startRow, pageSize);

if(count!=0){
    for(int i=0; i<boardList.size(); i++){
        // 자바빈 <= 배열한칸 정보
        BoardBean bb = (BoardBean)boardList.get(i);
        %>
        <tr><td class="contxt">
        <a href="../center/content.jsp?num=<%=bb.getNum() %>&pageNum=<%=pageNum %>"><%=bb.getSubject() %></a></td>
            <td><%=sdf.format(bb.getDate()) %></td>
        <%
    }
}
%>
</table>
</div>
<div id="news_notice">
<h3><span class="orange">다운로드</span>게시판</h3>
<table>
<%
downBoardDAO dbdao = new downBoardDAO();

// 게시판 전체 글개수  가져오기  select count(*)
int _count = dbdao.getBoardCount();

// 한 화면에 보여줄 글개수 설정
int _pageSize = 5;

//pageNum="1" 설정
String _pageNum = "1";

int _currentPage = Integer.parseInt(_pageNum);

// 시작하는 행번호 구하기
int _startRow = (_currentPage-1) * _pageSize+1;

// 날짜형태 변경 => 문자열 변경
SimpleDateFormat _sdf = new SimpleDateFormat("yyyy.MM.dd");

// List boardList = getBoardList()호출
List _boardList = dbdao.getBoardList(_startRow, _pageSize);

if(_count!=0){
    for(int i=0; i<_boardList.size(); i++){
        // 자바빈 <= 배열한칸 정보
        downBoardBean dbb = (downBoardBean)_boardList.get(i);
        %>
        <tr><td class="contxt">
        <a href="../center/d_content.jsp?num=<%=dbb.getNum() %>&pageNum=<%=_pageNum %>"><%=dbb.getSubject() %></a></td>
            <td><%=_sdf.format(dbb.getDate()) %></td>
        <%
    }
}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>