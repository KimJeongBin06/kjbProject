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
<script>
function del(mid) {
	if(confirm("정말로 탈퇴시키겠습니까?")){
    	location.href = "${path}/member/delete?mid="+mid
	}
  }
</script>
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>

<form name = form1 method="post">
<div class="container">
  <h2>회원목록</h2>
  <p>회원관리 페이지입니다.</p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>우편번호</th>
        <th>주소</th>
        <th>상세주소</th>
        <th>회원등록일</th>
        <th>관리자여부</th>
        <th>정보수정</th>
        <th>강제탈퇴</th>
        
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${memList}" var="memList">
      <tr>
      	<td>${memList.mid}</td>
      	<td>${memList.mpwd}</td>
      	<td>${memList.mname}</td>
      	<td>${memList.mtel}</td>
      	<td>${memList.memail}</td>
      	<td>${memList.mzip}</td>
      	<td>${memList.maddr1}</td>
      	<td>${memList.maddr2}</td>
      	<td>${memList.mddate}</td>
      	<td>${memList.verify}</td>
      	<td align="center"><a href="${path }/member/memedit?mid=${memList.mid}"><input type="button" value="수정" id="memUpdate"></input></a></td>     
      	<td align="center">
		  <input type="button" value="강제탈퇴" id="memDelete" onclick="del('${memList.mid}')">
		</td> 
		 	</tr>
      </c:forEach>




<style>
   body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
   ul { padding:0; margin:0; list-style:none;  }

   div#root { width:90%; margin:0 auto; }
   
   header#header { font-size:60px; padding:20px 0; }
   header#header h1 a { color:#000; font-weight:bold; }
   
   nav#nav { padding:10px; text-align:right; }
   nav#nav ul li { display:inline-block; margin-left:10px; }

     section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
   section#container::after { content:""; display:block; clear:both; }
   aside { float:left; width:200px; }
   div#container_box { float:right; width:calc(100% - 200px - 20px); }
   
   aside ul li { text-align:center; margin-bottom:10px; }
   aside ul li a { display:block; width:100%; padding:10px 0;}
   aside ul li a:hover { background:#eee; }
   
   footer#footer { background:#f9f9f9; padding:20px; }
   footer#footer ul li { display:inline-block; margin-right:10px; }
</style>


</tbody>
</table>
</div>
</form>
</body>