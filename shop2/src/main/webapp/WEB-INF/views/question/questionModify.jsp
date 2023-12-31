<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/shop_header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
   <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 150px;
    height: 50px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
    margin-bottom : 100px;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
#delete_btn{
    background-color: #f3e3e7;
}
table{
	width: 1200px;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    font-size:20px
}
th, td {
    border: 0;
    vertical-align: top;
}
tbody th {
    border-bottom: 1px solid #ededed;
    padding: 11px 0 10px 18px;
    color: #000;
    text-align: left;
    background-color: #fff;
    width:200px
}
td {
    padding: 14px 10px 16px;
    border-bottom: 1px solid #ededed;
    font-size: 13px;
    letter-spacing: -1px;
    color: #000;
    vertical-align: middle;
    word-break: break-all;
    word-wrap: break-word;
    font-weight: 300;
    font-size:20px
}
td {
    padding: 8px 10px 7px;
}
.detail {
    padding: 30px 20px;
    margin: -9px 0 0;
    word-break: break-all;
    line-height: normal;
    font-size:25px;
}
pre{
	font-family: "Nunito Sans", sans-serif;
}
</style>
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<c:if test="${sessionScope.member.mid ne pageInfo.qwriter and member.verify != 2 }">
	<script>
		alert("작성하신 글만 수정하실 수 있습니다."); //알림창->확인버튼을 클릭 후
		location.href="/";  //로그인 페이지로 이동
	</script>
</c:if>
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>질문 수정</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>질문 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<div class="container">
<div class="row">
    <!-- Breadcrumb Section End -->
	<form id="modifyForm" action="/question/questionModify" method="post">
	<table border=1>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input name="qtitle"  value='<c:out value="${pageInfo.qtitle}"/>' ></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${pageInfo.qwriter}</td>
			</tr>
			<tr>
				<th>작성일</th>				
				<td><fmt:formatDate value="${pageInfo.qdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td colspan="2" class="detail"><textarea rows="3" name="qcontent" style="width:100%; resize: none;"><c:out value="${pageInfo.qcontent}"/></textarea></td>
			</tr>
		</tbody>
	</table>
	<div class="input_wrap">
		<input type="hidden" name="qbno" readonly="readonly" value='<c:out value="${pageInfo.qbno}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="qwriter" readonly="readonly" value='<c:out value="${pageInfo.qwriter}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="qdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.qdate}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="qupdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.qupdate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<c:if test="${sessionScope.member.verify == 2 or member.mid eq pageInfo.qwriter}">
	        <a class="btn" id="modify_btn">수정 완료</a>
	        <a class="btn" id="delete_btn">삭제</a>
        </c:if>
        <a class="btn" id="cancel_btn">수정 취소</a>
	</div>
	</form>
	<form id="infoForm" action="/question/questionModify" method="get">
		<input type="hidden" id="qbno" name="qbno" value='<c:out value="${pageInfo.qbno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
</div>
</div>
<script>
let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

/* 목록 페이지 이동 버튼 */
$("#list_btn").on("click", function(e){
    form.find("#qbno").remove();
    form.attr("action", "/question/questionList");
    form.submit();
});

/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
	title = mForm.find("input[name='qtitle']").val().trim();
	content = mForm.find("textarea[name='qcontent']").val().trim();
	if(title==""){
		alert("제목을 입력해주세요");
		 mForm.find("input[name='qtitle']").focus();
		return;
	}
	if(content==""){
		alert("내용을 입력해주세요");
		 mForm.find("textarea[name='qcontent']").focus();
		return;
	}
    mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
    form.attr("action", "/question/questionGet");
    form.submit();
});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
	if(confirm("정말로 삭제 하시겠습니까?")){
		form.attr("action", "/question/questionDelete");
	    form.attr("method", "post");
	    form.submit();
	}
    
});

</script>	
</body>
</html>