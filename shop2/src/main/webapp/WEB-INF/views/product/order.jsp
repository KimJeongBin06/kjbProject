<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/shop_header.jsp" %>


</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>

<h3> 주문정보 입력</h3> <br><br>
<form name = "form1" method="post" action="${path}/product/orderList">
	<h5>배송지 정보</h5><br>
	
	
	<div class="form-group col-3">
	
		<span>상품명 ${cartList.pdname}<br />
		<span>상품금액 ${cartList.pdprice}원<br />
		<span>구입 수량 ${cartList.ctcnt} 개<br />
		<span>최종 가격 ${sum + (cartList.pdprice * cartList.ctcnt)}원
		  
		  
      <label for="mid"></label>
      <input type="hidden" class="form-control" id="mid" name="mid" value = ${member.mid }>
    </div>
	
	
	<div class="form-group col-3">
      <label for="orderrec">수령인</label>
      <input type="text" class="form-control" id="orderrec" name="orderrec">
    </div>
    
    <div class="form-group col-3">
      <label for="orderphon">연락처</label>
      <input type="text" class="form-control" id="orderphon" name="orderphon">
    </div>
      
    <div class="form-group col-3">
      <label for="orderaddr1">배송지 주소</label>
      <input type="text" class="form-control" id="orderaddr1" name="orderaddr1">
    </div>
    
        <div class="form-group col-3">
      <label for="orderaddr2">상세 주소</label>
      <input type="text" class="form-control" id="orderaddr2" name="orderaddr2">
    </div>
   
	<button type="reset" class="btn btn-danger">취소</button>
	<button type="submit" class="btn btn-info" value = "확인">결제하기</button>
