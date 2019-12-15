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
<script type="text/javascript">
    
    
    function idcheck() {
    	
        var ID = document.fr.id;
        
    	if(ID.value == ""){
    		alert("아이디를 입력해주세요");
    		ID.focus();
    		return;
    	}
    	
    	if(ID.value.length < 4 || ID.value.length > 10){
            
            alert("아이디는 4~10자입니다.");
            ID.value = "";
            ID.focus();
            return;
        }
    	
    	window.open("join_idcheck.jsp?userid="+ID.value, "", "width=500, height=200");
    }
    
    function totalcheck() {
    	
    	var ID = document.fr.id;
    	var ID_hid = document.fr.id_hid;
    	var isCheck = document.fr.ischeck;
        var Pass = document.fr.pass;
        var Pass2 = document.fr.pass2;
        var Email = document.fr.email;
        var Email2 = document.fr.email2;
        
        if(ID.value != ID_hid.value){
        	alert("아이디 중복체크를 다시 해주십시오");
        	return false;
        }
        
        if(isCheck.value == 'N'){
            
            alert("아이디 중복체크를 해주십시오");
            return false;
        }
        
        if(Pass.value.length < 4 || Pass.value.length > 10){
            
            alert("비밀번호는 4~10자입니다.");
            Pass.value = "";
            Pass.focus();
            return false;
        }

        if(Pass.value != Pass2.value){
            
            alert("비밀번호가 일치하지 않습니다.");
            Pass2.select();
            return false;
        }

        if(Email.value != Email2.value){
            
            alert("이메일이 일치하지 않습니다.");
            Email2.select();
            return false;
        }
    }
    
    function ad_check() {
    	
    	window.open("address_check.jsp", "", "width=500, height=200");
    }
    
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="join.jsp">회원가입</a></li>
<li><a href="login.jsp">로그인</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" name="fr" method="post" onsubmit="return totalcheck()">
<input type="hidden" name="ischeck" value="N">
<input type="hidden" name="id_hid" value="document.fr.id.value">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" required>
<input type="button" value="아이디 중복확인" class="dup" onclick="idcheck()"><br>
<label>Password</label>
<input type="password" name="pass" required><br>
<label>Retype Password</label>
<input type="password" name="pass2" required><br>
<label>Name</label>
<input type="text" name="name" required><br>
<label>E-Mail</label>
<input type="email" name="email" required><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" required><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" id="postcode" placeholder="우편번호" required>
<input type="button" value="우편번호 검색" class="dup" onclick="ad_check()"><br>
<label>       </label>
<input type="text" id="address" name="address" placeholder="도로명주소" required> 
<input type="text" id="jibunAddress" placeholder="지번주소" required><br>
<label>       </label>
<input type="text" id="detailAddress" placeholder="상세주소" required><br>
<label>Phone Number</label>
<input type="text" name="phone" required><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" required><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="취소" class="cancel" onclick="history.back()">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>