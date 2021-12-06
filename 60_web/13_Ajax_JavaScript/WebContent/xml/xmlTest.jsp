<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
</head>
<body>
	<h1>Ajax XML 데이터 요청처리</h1>
	<hr>
	
<script>
	/* XMLHttpRequest.readyState : 데이터 전달 결과 상태를 표시
	0 : 객체생성, open 안한 상태
	1 : open상태, send 안된 상태
	2 : send 진행한 상태, 데이터가 발견되지 않은 상태
	3 : 일부 데이터만 받은 상태(데이터를 받는 중)
	4 : 데이터를 전부 응답받은 상태
	
	XMLHttpRequest.status : 응답 결과 값
	200(성공), 4xx(클라이언트 오류), 5xx(서버측 오류 - 개발자 실수)
	*/

	// JavaScript 에서 Ajax 를 사용할 때 XMLHttpRequest 객체 사용
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	request.onreadystatechange = function(){
		console.log("readyState : " + request.readyState  + ", status : " + request.status);
		if (request.readyState == 4 && request.status == 200) { //응답완료 + 정상처리
			alert("리턴받은 값(문자열) : \n" + request.responseXML);
			console.log(request.responseXML);
			
			//XML 데이터 추출
			let xml = request.responseXML;
			let names = xml.getElementsByTagName("name");
			let prices = xml.getElementsByTagName("price");
			console.log(names);
			
			//데이터 사용
			let output = "";
			for (let i = 0; i < names.length; i++) {
				console.log(names[i]); //<name>우유</name>
				let name = names[i].childNodes[0].nodeValue;
				console.log(name);
				let price = prices[i].childNodes[0].nodeValue;
				
				output += "<h2>" + name + " : " + price + "</h2>";
			}
			document.body.innerHTML += output; 
		} 
	};
	
	//2. open("전송방식", "요청정보", "비동기여부")
	request.open("GET", "data.xml", true);
	
	//2. send() 실행
	request.send();
</script>	
</body>
</html>









