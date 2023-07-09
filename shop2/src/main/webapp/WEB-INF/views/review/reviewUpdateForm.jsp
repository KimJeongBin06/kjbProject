<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/shop_header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link rel="shortcut icon" href="images/favicon.ico">
    
	<!-- CSS -->
	<link href="../resources/review/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/review/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="../resources/review/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../resources/review/css/owl.carousel.css" rel="stylesheet">
	<link href="../resources/review/css/style.css" rel="stylesheet" type="text/css" />
	<link href="../resources/review/css/colors/" rel="stylesheet" type="text/css" id="colors" />
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	
    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<script src="../resources/review/js/jquery.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/superfish.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="../resources/review/js/owl.carousel.js"></script>
	<script src="../resources/review/js/animate.js" type="text/javascript"></script>
	<script src="../resources/review/js/myscript.js" type="text/javascript"></script>


<script>
		function readURL(input, previewId) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById(previewId).src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById(previewId).src = "";
		  }
		}
</script>
<style>
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 30px;
    height: 30px;
    background-image: url('../resources/review/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 30px 30px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: red;
}

</style>
<script>
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
</script>
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<c:if test="${dto.mid eq sessionScope.member.mid or sessionScope.member.verify==2}">
<form action="${path}/review/reviewUpdate" method="POST" enctype="multipart/form-data">
<!-- PRELOADER -->

<div class="preloader_hide">
<br>
<br>
<br>

	<!-- PAGE -->
	<div id="page" class="single_page">
	
		
		
		
		<!-- BREADCRUMBS -->
		<section class="breadcrumbs_block clearfix parallax">
			<div class="container center">
				<h2><b>Review</b> </h2>
			</div>
		</section><!-- //BREADCRUMBS -->
		
		
		<!-- BLOG -->
		<section id="blog">
			
			<!-- CONTAINER -->
			<div class="container">
				
				<!-- ROW -->
				<div class="row">
				
					<!-- BLOG BLOCK -->
					<div class="blog_block col-lg-9 col-md-9 padbot50">
						
						<!-- SINGLE BLOG POST -->
						<div class="single_blog_post clearfix" data-animated="fadeInUp">
							<div class="single_blog_post_descr">
							
								<div class="single_blog_post_date">${dto.revdate }</div>
								<br>
								
								제목 : <div class="single_blog_post_title"><input type="text" name="revtitle" value="${dto.revtitle }"></div>
								
								<ul class="single_blog_post_info">
									<li><a href="javascript:void(0);" >${dto.mid }</a></li>																	
								</ul>
								상품번호 : 
								<input type="number" name="pdnu" value="${dto.pdnu }">
							</div>
							
							
							<label for="gdsImg">이미지</label>
							<input type="file" id="gdsImg" name="images"/>
							<div class="select_img">
							 <img src="https://anjoimages.s3.amazonaws.com/${dto.revimg }" />
							 <input type="hidden" name="revimg" value="${dto.revimg }" />
							</div>	
							
							<div class="review_rating">
					            <div class="warning_msg">별점을 선택해 주세요.</div>
					            <div class="rating">
					                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
					                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
					                <label for="rating1"></label>
					                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
					                <label for="rating2"></label>
					                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
					                <label for="rating3"></label>
					                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
					                <label for="rating4"></label>
					                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
					                <label for="rating5"></label>
					            </div>
					        </div>
							
							<div class="single_blog_post_content">
								<p class="margbot50">
									본문 :
									<textarea rows="10" cols="50" name="revcontent">${dto.revcontent }</textarea>
								</p>
							</div>
							
						</div><!-- //SINGLE BLOG POST -->
						<hid>
							<input type="hidden" name="revnum" value="${dto.revnum }">
							<input type="hidden" name="revdate" value="${dto.revdate }">				
							<input type="hidden" name="mid" value="${sessionScope.member.mid }">
						</hid>
						
						
						
						<input class="contact_btn pull-right" type="submit" value="수정">	

						
						
						
						
						
					
					
					<!-- SIDEBAR -->
					<div class="sidebar col-lg-3 col-md-3 padbot50">
					
						
						
					</div>	
					</div><!-- //SIDEBAR -->
				</div><!-- //ROW -->
			</div><!-- //CONTAINER -->
		</section><!-- //BLOG -->
	</div><!-- //PAGE -->
<script>
 
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(700);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

 </script>	
	
	
	

</div>
</form>
</c:if>
</body>
</html>