<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			title = document.form1.qtitle.value;
			content = document.form1.qcontent.value;
			if(title==""){
				alert("제목을 입력해주세요");
				document.form1.qtitle.focus();
				return;
			}
			if(content==""){
				alert("내용을 입력해주세요");
				document.form1.qcontent.focus();
				return;
			}
			document.form1.submit();
		})
	})
</script>

</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<%@ include file="../include/sessionCheck.jsp" %>
<br>
<br>
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>질문등록</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>질문등록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<br>
<br>
<!-- Breadcrumb Section End -->
<div class="container">
				
<!-- ROW -->
<div class="row">
<div class="blog_block col-lg-9 col-md-9 padbot50">
						
<!-- SINGLE BLOG POST -->
<div class="single_blog_post clearfix" data-animated="fadeInUp">
<div class="single_blog_post_descr">
<form name="form1" action="/question/questionEnroll" method="post">
		제목 : 
    	<div class="single_blog_post_title">
        		<input name="qtitle">
    	</div>
    	<div class="input_wrap">
        		<label>내용</label>
        		<textarea rows="10" cols="50" name="qcontent"></textarea>
    	</div>
	   	<div class="input_wrap">
	       		<input type="hidden" name="qwriter" value="${member.mid }">
	   	</div>
    	<button type="button" class="contact_btn pull-right" id="btnWrite">등록</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>