<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@ include file="../include/shop_header.jsp" %>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
   	<style>	 
		.orderInfo { border:5px solid #eee; padding:20px; display:none; }
		.orderInfo .inputArea { margin:10px 0; }
		.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
	</style>
</head>
<%@ include file="../include/shop_menu.jsp" %>
<body>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <a href="${path }/product/list?catecode=1">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th><input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck"></label></th>
                                </tr>
                            </thead>
                            <tbody>
	                            <c:forEach items="${cartList}" var="cartList">
	                                <tr>
	                                    <td class="product__cart__item">
	                                        <div class="product__cart__item__pic">
	                                            <img src="https://anjoimages.s3.amazonaws.com/${cartList.pdimg1}" width="100px" alt="">
	                                        </div>
	                                        <div class="product__cart__item__text">
	                                            <h6>${cartList.pdname}</h6>
	                                            <h5>${cartList.pdprice}원</h5>
	                                        </div>
	                                    </td>
	                                    <td class="quantity__item">
	                                        <div class="quantity">
	                                            <div class="pro-qty-2">
	                                                <input type="text" value="${cartList.ctcnt}">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    <td class="cart__price">${cartList.pdprice}원</td>
	                                    <td class="cart__close"><input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartnum}" /></td>
	                                </tr>
	                                <c:set var="sum" value="${sum + (cartList.pdprice * cartList.ctcnt)}" />
                                </c:forEach>
                            </tbody>
                        </table>
                        
                         <script>
						     $("#allCheck").click(function() {
						    	var chk = $("#allCheck").prop("checked");
						    	if(chk) {
						    		$(".chBox").prop("checked", true);
						    	} else {
						    		$(".chBox").prop("checked", false);
						    	}
						     });
						     
					     
					     </script>
     		     		 <script>
					     	$(".chBox").click(function() {
					     		$("#allCheck").prop("checked", false);
					     	});
					     </script>
					     
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="${path }/product/list?catecode=1">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                            	<a type="button" id="selectDelete_btn" class="fa fa-spinner">선택 삭제</a>
                            	<script>
								   $("#selectDelete_btn").click(function(){
								    var confirm_val = confirm("정말 삭제하시겠습니까?");
								    
								    if(confirm_val) {
								     var checkArr = new Array();
								     
								     $("input[class='chBox']:checked").each(function(){
								      checkArr.push($(this).attr("data-cartNum"));
								     });
								      
								     $.ajax({
								      url : "/product/deleteCart",
								      type : "post",
								      data : { chbox : checkArr },
								      success : function(result){
								    	  if(result ==1) {
								    		 location.href = "/product/cartList";	  
								    	  } else {
								    		  alert("삭제 실패");
								    	  }
								      }
								     });
								    }   
								   });
								</script>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">

                    
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>${sum}</span></li>
                            <li>Total <span>${sum}</span></li>
                        </ul>
                        <button type="button" class="primary-btn" id="orderOpne_bnt">Proceed to checkout</button>
                        
                        <script>
							$("#orderOpne_bnt").click(function(){
								$(".orderInfo").slideDown();  // $(".orderInfo")를 나타내고
								$("#orderOpne_bnt").slideUp();  // $(".orderOpne_bnt")를 숨김
							});						
						</script>
						
						<div class="orderInfo">
						   <form role="form" method="post" autocomplete="off">
						    
						    <input type="hidden" name="amount" value="${sum}" />
						      
						    <div class="inputArea">
						     <label for="">수령인</label>
						     <input type="text" name="orderRec" id="orderRec" required="required" />
						    </div>
						    
						    <div class="inputArea">
						     <label for="orderPhon">수령인 연락처</label>
						     <input type="text" name="orderPhon" id="orderPhon" required="required" />
						    </div>
						    
						    <div class="inputArea">
						     <label for="userAddr1">우편번호</label>
						     <input type="text" name="userAddr1" id="userAddr1" required="required" />
						    </div>
						    
						    <div class="inputArea">
						     <label for="userAddr2">1차 주소</label>
						     <input type="text" name="userAddr2" id="userAddr2" required="required" />
						    </div>
						    
						    <div class="inputArea">
						     <label for="userAddr3">2차 주소</label>
						     <input type="text" name="userAddr3" id="userAddr3" required="required" />
						    </div>		    
						    <div class="inputArea">
						     <button type="submit" class="order_btn">주문</button>
						     <button type="button" class="cancel_btn">취소</button>   
						     
						     <script>
								$(".cancel_btn").click(function(){
								   $(".orderInfo").slideUp();
								   $("#orderOpne_bnt").slideDown();
								});        
								</script>
						    </div>
						    
						   </form>   
						</div>
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->


</body>

</html>