<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h1>메인페이지(main)</h1>
	<a href="sub.jsp">서브페이지로 이동</a>
	<h2>메인페이지 내용</h2>
	<p>.....................</p>
	<p>.....................</p>
	<p>.....................</p>
	<p>.....................</p>
	
	<hr><hr>
	<%-- 디렉티브(지시어, directive) include : 복사 & 붙여넣기 형태로 적용됨 --%>
	<%@ include file="footer.jsp" %>	
	<hr>
	
	<footer>
	비트캠프 ｜ 서울 강남구 강남대로94길 20, 삼오빌딩(5층 ~ 9층)｜ 사업자등록번호 : 214-85-24928
	(주)비트컴퓨터 강남본원 대표이사 : 조현정 ｜ 문의 : 02-3486-9600 ｜ 팩스 : 02-6007-1245
	통신판매업 신고번호 : 제 서초-00098호 ｜ 개인정보보호관리책임자 : 최종진
	</footer>
</body>
</html>