<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/shop_header.jsp" %>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<div id="root">
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>OrderList</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <a href="${path }/product/list?catecode=1">Shop</a>
                        <span>OrderList</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
					<li>
					<div>
						<p><span>주문번호</span><a href="/product/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
						<p><span>수령인</span> ${orderList.orderRec}</p>
						<p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
						<p><span>가격</span>${orderList.amount}원</p>
						<p><span>상태</span>${orderList.delivery}</p>
					</div>
					</li>
					</c:forEach>
				</ul>
			
			</section>
			
		
</div>
<style>

 /*
 <style>
/*
   section#content ul li { display:inline-block; margin:10px; }
   section#content div.goodsThumb img { width:200px; height:200px; }
   section#content div.goodsName { padding:10px 0; text-align:center; }
   section#content div.goodsName a { color:#000; }
*/
   section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
   section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>

</section>




</body>
</html>