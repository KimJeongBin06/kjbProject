<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@ include file="../include/shop_header.jsp" %>
<script type="text/javascript">
    function countdown(seconds) {
        document.getElementById('countdown').innerHTML = seconds;
        seconds--;

        if (seconds >= 0) {
            setTimeout(function() {
                countdown(seconds);
            }, 1000);
        }
    }
    
    // Call the countdown function on page load
    window.onload = function() {
        countdown(3);
    };
</script>  
</head>

<body>
<%@ include file="../include/shop_menu.jsp" %>
<form action="${path}/product/recommend" method="post" enctype="multipart/form-data" >

  
    <!-- Blog Details Hero Begin -->
    <section class="blog-hero spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-9 text-center">
                    <div class="blog__hero__text">
                    	<c:choose>
                    		<c:when test="${face == null }">
                    			<h2>정면 얼굴 사진을 올려주세요</h2>
								<label for="gdsImg"></label>
								<input type="file" id="gdsImg" name="images"/>
                    		</c:when>
                    		<c:otherwise>
	                    		<c:if test="${face eq '0' }">
	                    			<meta http-equiv="refresh" content="3;${path }/product/list?catecode=1&pdtypes=1&pdshapes=0">
	                    			<h3>긴 얼굴형 추천 안경으로 이동합니다.</h3>
	                    			<h3><span id="countdown"></span>...</h3>
	                    			
	                    		</c:if>
	                    		<c:if test="${face eq '1' }">
	                    			<meta http-equiv="refresh" content="3;${path }/product/list?catecode=1&pdtypes=0&pdshapes=0">
	                    			<h3>계란형 얼굴형 추천 안경으로 이동합니다.</h3>
	                    			<h3><span id="countdown"></span>...</h3>
	                    		</c:if>
	                    		<c:if test="${face eq '2' }">
	                    			<meta http-equiv="refresh" content="3;${path }/product/list?catecode=1&pdtypes=2&pdshapes=2&pdshapes=3">
	                    			<h3>둥근 얼굴형 추천 안경으로 이동합니다.</h3>
	                    			<h3><span id="countdown"></span>...</h3>
	                    		</c:if>
	                    		<c:if test="${face eq '3' }">
	                    			<meta http-equiv="refresh" content="3;${path }/product/list?catecode=1&pdtypes=2&pdshapes=1&pdshapes=3">
	                    			<h3>각진 얼굴형 추천 안경으로 이동합니다.</h3>
	                    			<h3><span id="countdown"></span>...</h3>
	                    		</c:if>
	                    		<c:if test="${face eq '5' }">
	                    			
		                    		<h2>정면 얼굴 사진을 올려주세요</h2>
									<label for="gdsImg"></label>
									<input type="file" id="gdsImg" name="images"/><br><br>
									<div>
	                    				<h3>얼굴형 인식에 실패하였습니다.</h3><br>
	                    				<h3>다른 사진으로 다시 시도해주세요</h3>
	                    			</div>
	                    		</c:if>
                    		</c:otherwise>
                        
						</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-12">
                    <div class="blog__details__pic">                   	
						<div class="select_img">
							<img src="" />
						</div>                        
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="blog__details__content">
                        <div class="blog__details__share">
                            
                        </div>
                       
                        
                        
                        
                        
                        <div class="blog__details__comment">
                            <h4></h4>
                            <form action="#">
                                <div class="row">
                                    
                                    <div class="col-lg-12 text-center">
                                        <c:if test="${face == null or face eq '5'}">
                                        	<button type="submit" class="site-btn">확인</button>
                                        </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
<script>
 
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

</script>	
    
</form>
</body>

</html>