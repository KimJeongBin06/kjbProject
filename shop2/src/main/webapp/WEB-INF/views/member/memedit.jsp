<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@ include file="../include/shop_header.jsp" %>
<link rel="stylesheet" href="../resources/css/member/join.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  	$(document).ready(function(){
  		$("#btnUpdate").click(function(){
  			var id = document.form1.mid.value;
  			var pw = document.form1.mpwd.value;
  			var name = document.form1.mname.value;
  			var email = document.form1.memail.value;
  			var tel = document.form1.mtel.value;
  			if(id==""){
  				alert("아이디를 입력해주세요");
  				document.form1.mid.focus();
  				return;
  			}
  			if(pw==""){
  				alert("비밀번호를 입력해주세요");
  				document.form1.mpwd.focus();
  				return;
  			}
  			if(name==""){
  				alert("이름을 입력해주세요");
  				document.form1.mname.focus();
  				return;
  			}
  			if(email==""){
  				alert("이메일을 입력해주세요");
  				document.form1.memail.focus();
  				return;
  			}
  			if(tel==""){
  				alert("전화번호를 입력해주세요");
  				document.form1.mtel.focus();
  				return;
  			}
  			document.form1.submit();
  		})
  	}) 	
  </script>
</head>

<body>
<%@ include file="../include/shop_menu.jsp" %>
<form name = "form1" method="post" action="${path}/member/memedit">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Join</span>
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
                    <div class="row">
                    <%@ include file="../include/side_menu_my.jsp" %>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="col-lg-8 col-md-6">
                            <h3 class="checkout__title">회원 정보 수정</h3>
                            <div class="row">
                            </div>
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name="mid" value="${dto.mid}" readonly ="readonly">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" name="mpwd">
                            </div>
                            <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input type="text" name="mname" value = "${dto.mname}" readonly ="readonly">
                            </div>
                            <div class="checkout__input">
                                <p>이메일<span>*</span></p>
                                <input type="email" name="memail" value = "${dto.memail}">
                            </div>
                            <div class="checkout__input">
                                <p>전화번호<span>*</span></p>
                                <input type="tel" name="mtel" value = "${dto.mtel}">
                            </div>

                            <div class="checkout__input">
                                <button type="reset" class="site-btn">정정</button>&nbsp
                                <button type="button" id="btnUpdate" class="site-btn">수정</button>
                            </div>
                        </div>

                            


                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
<script>
document.addEventListener('keypress', function(event) {
	  if (event.keyCode === 13 || event.which === 13) {
		  $("#btnUpdate").click();		
  }
});
</script>
</form>
</body>

</html>