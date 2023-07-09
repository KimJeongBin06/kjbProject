<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/shop_header.jsp" %>
<link rel="stylesheet" href="../resources/css/member/join.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<h1>회원수정</h1>
<form name = "form1" method="post" action="${path}/member/memedit">
	<div class="form-group col-3">
      <label for="mid">아이디</label>
      <input type="text" class="form-control" id="mid" name="mid" value="${member.mid}" readonly ="readonly">
    </div>
    
    <div class="form-group col-3">
      <label for="mpwd">비밀번호</label>
      <input type="password" class="form-control" id="mpwd" name="mpwd" value="${member.mpwd}">
   
    </div>
    
    <div class="form-group col-3">
      <label for="mname">이름</label>
      <input type="text" class="form-control" id="mname" name="mname" readonly = "readonly">
    </div>
    
    <div class="form-group col-3">
      <label for="memail">이메일</label>
      <input type="email" class="form-control" id="memail" name="memail" value = "${member.memail}">
    </div>
    
    <div class="form-group col-3">
      <label for="mtel">전화번호</label>
      <input type="text" class="form-control" id="mtel" name="mtel" value = "${member.mtel}">
    </div>

	
	<button type="reset" class="btn btn-danger">정정</button>
	<button type="submit" class="btn btn-info" value = "확인">수정</button>
	
		
	
</form>
</body>
</html>