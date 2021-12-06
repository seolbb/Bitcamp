<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 속성 삭제 --%>
<%
	// 속성 자체를 삭제(attr_age)
	session.removeAttribute("attr_age"); // 속성삭제 - 속성이 없어짐
	//session.setAttribute("attr_age", ""); // 속성은 존재하고 값을 빈문자열로 변경
	//session.setAttribute("attr_age", "33"); // 속성값 수정
	
	// 속성 자체를 삭제(attr_name)
	session.removeAttribute("attr_name");
	
	// 재요청 처리(ex01_session.jsp 페이지로 이동)
	response.sendRedirect("ex01_session.jsp");

%>