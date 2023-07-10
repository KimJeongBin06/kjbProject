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
	<!-- Breadcrumb Section Begin -->
	    <section class="breadcrumb-option">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb__text">
	                        <h4>OrderView</h4>
	                        <div class="breadcrumb__links">
	                            <a href="/">Home</a>
	                            <a href="${path }/product/list?catecode=1">Shop</a>
	                            <span>OrderView</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	<section class="shopping-cart spad">
        <div class="container">
            <div class="row">

			   <div class="orderInfo">
			    <c:forEach items="${orderView}" var="orderView" varStatus="status">
			     <c:if test="${status.first}">
			     <table>
				     <tr>
					      <th width="200px">수령인</th>
					      <th width="200px">주소</th>
					      <th width="200px">가격</th>
					 </tr> 
			   		 <tr>
			   		 	  <td>${orderView.orderRec}</td>
					      <td>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</td>
					      <td>${orderView.amount}원</td>
			   		 </tr>			   		 
			     </table>
			     <br>
			     </c:if>
			    </c:forEach>
			   </div>
			   
   </div>
	   <ul class="orderView">
	    <c:forEach items="${orderView}" var="orderView">       
	    <li>
	     <div class="thumb">
	      <img src="https://anjoimages.s3.amazonaws.com/${orderView.pdimg1}" />
	     </div>
	     <div class="pdInfo">
	      <p>
	       <span>${orderView.pdname}<br />
	       <span>개당 가격: ${orderView.pdprice}원<br />
	       <span>구입 수량: ${orderView.ctcnt} 개<br />
	       <span>최종 가격: ${orderView.pdprice * orderView.ctcnt}원                  
	      </p>
	     </div>
	    </li>       
	    </c:forEach>
	   </ul>
   </div>
</section>
			
		
</div>
<style>

 
   section#content ul li { display:inline-block; margin:10px; }
   section#content div.goodsThumb img { width:200px; height:200px; }
   section#content div.goodsName { padding:10px 0; text-align:center; }
   section#content div.goodsName a { color:#000; }
*/
   section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
   section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
   
   <style>
/*
   section#content ul li { display:inline-block; margin:10px; }
   section#content div.goodsThumb img { width:200px; height:200px; }
   section#content div.goodsName { padding:10px 0; text-align:center; }
   section#content div.goodsName a { color:#000; }
*/
   .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
   .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
   
   .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
   .orderView li::after { content:""; display:block; clear:both; }
   
   .thumb { float:left; width:200px; }
   .thumb img { width:200px; height:200px; }
   .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
   .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>







</body>
</html>