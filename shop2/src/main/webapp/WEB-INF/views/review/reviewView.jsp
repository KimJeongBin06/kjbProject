<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/shop_header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	<meta charset="utf-8">
	<title>White | responsive bootstrap3 html5 one page template</title>
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
	//현재 문서의 정보를 수집
	$(document).ready(function() {
    // btnUpdate id를 가지고 있는 버튼을 클릭했을 때
    $("#btnUpdate").click(function() {
        // 제약조건 (대화상자-예(참, true), 아니오(거짓, false))
        if (confirm("수정하시겠습니까?")) {
            // 문서에 form1 id에 action을 지정
            document.form1.action = "${path}/review/reviewUpdateForm";
            // form1 id를 submit 처리
            document.form1.submit();
        }
    });

    // btnDelete id를 가지고 있는 버튼을 클릭했을 때
    $("#btnDelete").click(function() {
        if (confirm("삭제하시겠습니까?")) {
            // 문서에 form1 id에 action을 지정
            document.form1.action = "${path}/review/reviewDelete";
            // form1 id를 submit 처리
            document.form1.submit();
        }
    });
    $("#revreplyWrite").click(function() {
        // 제약조건 (대화상자-예(참, true), 아니오(거짓, false))
        if (confirm("댓글을 작성하시겠습니까?")) {
            // 문서에 form1 id에 action을 지정
            document.form1.action = "${path}/revreply/revreplyWrite";
            // form1 id를 submit 처리
            document.form1.submit();
        }
    });
});

</script>

</head>

<body>
<%@ include file="../include/shop_menu.jsp" %>
<!-- PRELOADER -->
<form name="form1" method="post">
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
								<div class="single_blog_post_date"><fmt:formatDate value="${dto.revdate }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
								
								<div class="single_blog_post_title">${dto.revtitle }</div>
								
								<ul class="single_blog_post_info">
									<li><a href="javascript:void(0);" >${dto.mname }</a></li>	
									<li><a href="${path }/product/item?pdnu=${dto.pdnu}" >${dto.pdname }</a></li>							
								</ul>
							</div>
							<div class="single_blog_post_img"><img src="https://anjoimages.s3.amazonaws.com/${dto.revimg }" alt="" /></div>
								<div class="product__item__text">
									<div class="rating">
										<c:forEach begin="1" end="${dto.rating }">
			                              <i class="fa fa-star" style="color:red"></i>
			                            </c:forEach>
		                           		<c:forEach begin="1" end="${5-dto.rating }">
		                           		  <i class="fa fa-star-o" style="color:red"></i>
		                           		</c:forEach>
		                            </div>
	                            <div class="product__item__text">
							<div class="single_blog_post_content">
								<pre class="margbot50">${dto.revcontent }</pre>
							</div>
							
						</div><!-- //SINGLE BLOG POST -->
						<hid>
							<input type="hidden" name="revnum" value="${dto.revnum }">
							<input type="hidden" name="revdate" value="${dto.revdate }">
							<input type="hidden" name="revtitle" value="${dto.revtitle }">
							<input type="hidden" name="pdnu" value="${dto.pdnu }">
							<input type="hidden" name="revimg" value="${dto.revimg }">
							<input type="hidden" name="revcontent" value="${dto.revcontent }">
						</hid>
						<c:if test="${dto.mid eq sessionScope.member.mid or sessionScope.member.verify==2}">
							<input type="button" id="btnUpdate" value="수정" style="height:30px; border-radius:10px">
							<input type="button" id="btnDelete" value="삭제" style="height:30px; border-radius:10px">
						</c:if>
						
						<!-- SINGLE BLOG POST TAG -->
						
						<hr>
						
						<!-- COMMENTS -->
						
							<div id="comments" class="margbot30" data-animated="fadeInUp">
								<h3><b>Comments </b><span class="comments_count">(152)</span></h3>
								
								<ul>
									<c:forEach var="row" items="${reply }">
									   <li class="clearfix" data-animated="fadeInUp">
										
											<div class="comment_right">
												<div class="comment_info clearfix">
													<div class="pull-left comment_author">${row.mname }</div>
													<div class="pull-left comment_inf_sep">|</div>
													<div class="pull-left comment_date">${row.revrdate }</div>
												</div>
												<p>${row.revrcontext }</p>						
											
											</div>
										</li>	
									</c:forEach>						
								</ul>
								
							</div>
						
						<!-- //COMMENTS -->
						
						<hr class="margbot80">
						
						<!-- LEAVE A COMMENT -->
						<div class="leave_comment" data-animated="fadeInUp">
							<h3><b>Leave a</b> Comment</h3>
							
							
								<div class="col-lg-4 col-md-4">															
									<div class="comment_note"></div>
								</div>
								<input type="hidden" name="revrid" value="${sessionScope.member.mid }">
								<div class="col-lg-12 col-md-8">
									<textarea name="revrcontext" onFocus="if (this.value == 'Your message *') this.value = '';" onBlur="if (this.value == '') this.value = 'Your message *';">Your message *</textarea>
									<input class="contact_btn pull-right" id="revreplyWrite" type="submit" value="Send message" />
								</div>
		
						</div><!-- //LEAVE A COMMENT -->
					</div><!-- //BLOG BLOCK -->
					
					
					<!-- SIDEBAR -->
					<div class="sidebar col-lg-3 col-md-3 padbot50">
	
						
						</div>
						</div>
						
					</div><!-- //SIDEBAR -->
				</div><!-- //ROW -->
			</div><!-- //CONTAINER -->
		</section><!-- //BLOG -->
	</div><!-- //PAGE -->

	
	
	

</form>
</body>
</html>