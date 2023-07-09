<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/member/login.css">
<%@ include file="../include/shop_header.jsp" %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>

<c:if test = "${member == null}">
<h2> 로그인 페이지 </h2>
<form role ="form" method="post" autocomplete="off" action="${path}/member/login">

	<div class="form-group col-3">
		  <label for ="mid"> 아이디 </label>
		  <input type="text" class="form-control" id="mid" name = "mid">
	</div>
	<div class="form-group col-3">
	  <label for="pwd">비밀번호</label>
	  <input type="password" class="form-control" id="mpwd" name="mpwd">
	</div>
	
	<p> <button type="submit" class="btn btn-success">로그인</button>

	<a href="/member/join" class="btn btn-info" role="button">회원가입</a>


</form>
</c:if>

<c:if test ="${member != null}">
	<c:if test="${member.verify == 2}">
		<h2 align="center"> ${member.mid}님 환영합니다. <h2>
	<button type="button" class="btn btn-default btn-lg btn-block" onclick ="location.href='/admin/index'">관리자 메뉴</button>
	 <button type="button" class="btn btn-default btn-lg btn-block" onclick ="location.href='/member/logout'">로그아웃</button>
	</c:if>
	
	<c:if test="${member.verify != 2}">
		<h2 align="center"> ${member.mid}님 환영합니다. <h2>
	  <button type="button" class="btn btn-default btn-lg btn-block" onclick ="location.href='/member/memedit'">회원정보 수정</button>
	  <button type="button" class="btn btn-default btn-lg btn-block" onclick ="location.href='/member/logout'">로그아웃</button>
	</c:if>
	
</c:if>




</body>
</html>