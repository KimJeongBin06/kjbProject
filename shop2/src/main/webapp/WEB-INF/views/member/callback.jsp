<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("AhTiFnDwyiX9JR1Od7Gn", "http://localhost:8080/member/callback");
  // 접근 토큰 값 출력
  var access_token = naver_id_login.oauthParams.access_token;
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	var id = naver_id_login.getProfileData('id');
    var email = naver_id_login.getProfileData('email');
    var name = naver_id_login.getProfileData('name');
    var mobile = naver_id_login.getProfileData('mobile'); 
    document.write("<form id='form1' action='/member/naverLogin' method='post'><input type='hidden' name='access_token' value='" + access_token + "'>");
    document.write("<input type='hidden' name='email' value='" + email + "'>");
    document.write("<input type='hidden' name='id' value='" + id + "'>");
    document.write("<input type='hidden' name='name' value='" + name + "'></form>");
    document.getElementById("form1").submit();
    }
</script>
<p id="message"></p>
</body>
</html>