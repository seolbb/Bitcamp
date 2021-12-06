<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(파라미터)를 화면에 표시 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
	<h1>정보수정</h1>
	<form action="update.jsp">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<input type="text" name="sabun" readonly
						value="<%=request.getParameter("sabun") %>">
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="name"
						value="<%=request.getParameter("name") %>">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name="pay"
						value="<%=request.getParameter("pay") %>">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수 정">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>