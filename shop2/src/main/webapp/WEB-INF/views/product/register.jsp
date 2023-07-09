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

<body>
<%@ include file="../include/shop_menu.jsp" %>


<section id = "container">
	<aside>
		<%@ include file ="../admin/include/aside.jsp" %>
	</aside>
</section> 

 <div class="admin_content_main">
                    	<form action="${path}/product/register" method="post" id="Product">
                    		<div class="form_section">
                    			<div class="form-group col-3">
						      <label for="pdnum">상품번호</label>
						      <input type="text" class="form-control" id="pdnum" name="pdnum">
                    		</div>
                    		<div class="form-group col-3">
						      <label for="catecode">카테고리</label>
						      <input type="text" class="form-control" id="catecode" name="catecode">
                    		</div>
                    		<div class="form-group col-3">
						      <label for="catecode">상품명</label>
						      <input type="text" class="form-control" id="pdname" name="pdname">
                    		</div>
                    		<div class="form-group col-3">
						      <label for="catecode">상세정보</label>
						      <input type="text" class="form-control" id="pdcontent" name="pdcontent">
                    		</div>
                    		<div class="form-group col-3">
						      <label for="catecode">상품가격</label>
						      <input type="text" class="form-control" id="pdprice" name="pdprice">
                    		</div>
                    		<div class="form-group col-3">
						      <label for="catecode">수량</label>
						      <input type="text" class="form-control" id="pdcnt" name="pdcnt">
                    		</div>
                    		<div class="form-group col-3">
						      <label for="catecode">이미지</label>
						      <input type="text" class="form-control" id="pdimg1" name="pdimg1">
                    		</div>
                    		
                    	
                   		</form>
                   			<div class="btn_section">
                   			<button type="reset" class="btn btn-danger">정정</button>
							<button type="submit" class="btn btn-info" value = "확인">등록</button>
	
	                    	</div> 
                    </div>  
                    
                    <script>


</script> 	

</body>
</html>

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

</head>
</body>