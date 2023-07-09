<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@ include file="../include/shop_header.jsp" %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
		$(document).ready(function(){
			$("#btnLogin").click(function(){
				var id = document.form.mid.value;
				var pw = document.form.mpwd.value;
				if(id == ""){
					alert("아이디를 입력해주세요");
					document.form.mid.focus();
					return;
				}
				if(pw == ""){
					alert("비밀번호를 입력해주세요");
					document.form.mpwd.focus();
					return;
				}
				document.form.submit();		
			})
			$("#btnJoin").click(function(){
				location.href="/member/join"
			})
		})
</script>
</head>

<body>
<%@ include file="../include/shop_menu.jsp" %>
<c:if test = "${member == null}">
<form name ="form" method="post" autocomplete="off" action="${path}/member/login">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Login</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">

                            <h3 class="checkout__title">로그인</h3>

                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name = "mid">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" name="mpwd">
                            </div>
							<button type="button" id="btnLogin" class="site-btn">로그인</button>&nbsp
                           	<button type="button" id="btnJoin" class="site-btn"">회원가입</button>
                            
                        </div>
                        
                    </div>
                </form>
            </div>
        </div>
    </section>



    <!-- Search End -->

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
	  <button type="button" class="btn btn-default btn-lg btn-block" onclick ="location.href='/member/memedit?mid=${member.mid}'">회원정보 수정</button>
	  <button type="button" class="btn btn-default btn-lg btn-block" onclick ="location.href='/member/logout'">로그아웃</button>
	</c:if>
	
</c:if>
<script>
document.addEventListener('keypress', function(event) {
	  if (event.keyCode === 13 || event.which === 13) {
		  $("#btnLogin").click();		
  }
});
</script>
</body>

</html>