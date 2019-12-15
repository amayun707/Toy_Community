<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Community</title>
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function address_ch(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            
        	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            
        }
    }).open();
    
    function complete(){
    	
    	if(document.wfr.detailAddress.value == null){
    		alert("상세주소를 입력해주세요.");
    	}
    	window.close();
    	
        opener.document.fr.postcode.value = document.wfr.postcode.value;
        opener.document.fr.address.value = document.wfr.address.value;
        opener.document.fr.jibunAddress.value = document.wfr.jibunAddress.value;
        opener.document.fr.detailAddress.value = document.wfr.detailAddress.value;
        opener.document.fr.extraAddress.value = document.wfr.extraAddress.value;
    }
    
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String address = request.getParameter("address");
%>
<form action="address_check.jsp" id="join" method="post" name="wfr">
<input type="text" id="postcode" placeholder="우편번호">
<input type="button" onclick="address_ch()" value="우편번호 찾기"><br>
<input type="text" id="address" name="address" placeholder="도로명주소">
<input type="text" id="jibunAddress" placeholder="지번주소"><br>
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="detailAddress" placeholder="상세주소">
<input type="button" value="해당 주소 입력" class="dup" onclick="complete()">
</form>
</body>
</html>