<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시판 등록</h1>
<form action="/notice/noticeEnroll" method="post">
    	<div class="input_wrap">
       			<label>제목</label>
        		<input name="ntitle">
    	</div>
    	<div class="input_wrap">
        		<label>내용</label>
        		<textarea rows="5" name="ncontent"></textarea>
    	</div>
    	<div class="input_wrap">
        		<label>작성자</label>
        		<input name="nwriter">
    	</div>
    	<button class="btn">등록</button>
</form>
</body>
</html>