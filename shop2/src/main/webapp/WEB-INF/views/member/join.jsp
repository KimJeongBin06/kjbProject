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
  		$("#btnJoin").click(function(){
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
  			if( $('input[type=checkbox][id=acc]:checked').length == 0 ) {
  				    alert("개인정보 수집에 동의해주세요");
  				    return;
			}
  			document.form1.submit();
  		})
  	}) 	
  </script>
</head>

<body>
<%@ include file="../include/shop_menu.jsp" %>
<form name = "form1" method="post" action="${path}/member/join">
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
                        <div class="col-lg-8 col-md-6">
                            <h3 class="checkout__title">회원가입</h3>
                            <div class="row">
                            </div>
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name="mid">
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" name="mpwd">
                            </div>
                            <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input type="text" name="mname">
                            </div>
                            <div class="checkout__input">
                                <p>이메일<span>*</span></p>
                                <input type="email" name="memail">
                            </div>
                            <div class="checkout__input">
                                <p>전화번호<span>*</span></p>
                                <input type="tel" name="mtel">
                            </div>


                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    <span style="color:red">[필수]</span> 개인정보 수집 및 이용
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                                <p>개인정보보호법에 따라 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
                            </div>
                            <div class="checkout__input">
                                <button type="reset" class="site-btn">정정</button>&nbsp
                                <button type="button" id="btnJoin" class="site-btn">가입</button>
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
		  $("#btnJoin").click();		
  }
});
</script>
</form>
</body>

</html>