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
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
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
<section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>공지사항</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>공지사항</span>
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
<form id="infoForm" action="/notice/noticeModify" method="get">
	<table border=1>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${pageInfo.ntitle}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>eyewear</td>
			</tr>
			<tr>
				<th>작성일</th>				
				<td><fmt:formatDate value="${pageInfo.ndate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td colspan="2" class="detail"><pre>${pageInfo.ncontent}</pre></td>
			</tr>
		</tbody>
	</table>
	<div class="input_wrap">
		<input type="hidden" name="nbno" readonly="readonly" value='<c:out value="${pageInfo.nbno}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="ntitle" readonly="readonly" value='<c:out value="${pageInfo.ntitle}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="ncontent" readonly="readonly" value='<c:out value="${pageInfo.ncontent}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="nwriter" readonly="readonly" value='<c:out value="${pageInfo.nwriter}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="ndate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.ndate}"/>' >
	</div>
	<div class="input_wrap">
		<input type="hidden" name="nupdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.nupdate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<c:if test="${sessionScope.member.verify == 2 }">
			<a class="btn" id="modify_btn">수정 하기</a>
		</c:if>
	</div>
	
		<input type="hidden" id="nbno" name="nbno" value='<c:out value="${pageInfo.nbno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">

</form>
</div>
</div>	
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#nbno").remove();
		form.attr("action", "/notice/noticeList");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/notice/noticeModify");
		form.submit();
	});
	

</script>	
</body>
</html>