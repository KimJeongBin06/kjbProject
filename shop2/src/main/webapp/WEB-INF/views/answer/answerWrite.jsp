<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/shop_header.jsp" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
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
}
table{
	width: 1200px;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
    font-size:20px;
    margin-bottom:20px;
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
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Q&A</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>Q&A</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<br>
<div class="container">
<div class="row">
	<table border=1>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${pageInfo.qtitle}</td>
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
				<td colspan="2" class="detail"><pre>${pageInfo.qcontent}</pre></td>
			</tr>
		</tbody>
	</table>
	<form action="/answer/answerWrite" method="post" id="infoForm">
	<h3>답변</h3><br>
		<table border=1>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input name="atitle" style="width:100%;"></td>
				</tr>
				<tr>
					<td colspan="2" class="detail"><textarea rows="3" name="acontent" style="width:100%; resize: none;"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="qbno" value='<c:out value="${pageInfo.qbno}"/>'>
		<a class="btn" id="answer_btn">답변하기</a>
	</form>
</div>
</div>
<script>
let form = $("#infoForm");

$("#answer_btn").on("click", function(e){
	title = form.find("input[name='atitle']").val().trim();
	content = form.find("textarea[name='acontent']").val().trim();
	if(title==""){
		alert("제목을 입력해주세요");
		form.find("input[name='atitle']").focus();
		return;
	}
	if(content==""){
		alert("내용을 입력해주세요");
		form.find("textarea[name='acontent']").focus();
		return;
	}
	form.attr("action", "/answer/answerWrite");
	form.submit();
});	
</script>
</body>
</html>