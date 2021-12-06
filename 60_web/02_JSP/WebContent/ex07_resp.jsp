<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 화면에 표시 --%>
<%
	// 1. 요청정보(request)로 부터 파라미터 값 추출(확인)
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String[] hobbies = request.getParameterValues("hobby");
		
		if(hobbies == null){
			hobbies = new String[] {"선택안함"};
		}
	// 2. 요청자의 브라우저 화면에 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>이름 : <%=name %></li>
		<li>아이디 : <%=id %></li>
		<li>암호 : <%=pwd %></li>
		<li>이메일 : <%=email %></li>
		<li>취미(배열값) : <%=hobbies %></li>
		<li>취미(배열데이터 사용) : 
<%
		for(String hobby : hobbies){
			out.print(hobby + " ");
		}
%>
		</li>
	</ul>
	<hr><hr>
	<h2>취미 표현식 사용해서 출력</h2>
	<ul>
<%
		for(String hobby : hobbies){%>
			<li><%= hobby%></li>
<%
		}
%>	
	</ul>

</body>
</html>