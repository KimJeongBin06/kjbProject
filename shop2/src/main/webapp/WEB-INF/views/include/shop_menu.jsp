<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	
var naverPopUp;
function openPopUp() {
    naverPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    naverPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		location.href = "/member/logout";
		}, 100);
	
	
}
</script>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- Page Preloder -->

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <c:choose> 
                	<c:when test= "${sessionScope.member != null}">
	                 	<c:choose>
	                 		<c:when test="${member.verify==3 }">
			                   	<a href="javascript:void(0)" onclick="naverLogout(); return false;">
							         <span>로그아웃</span>
							    </a>
						    </c:when>
						    <c:otherwise>
		                  		<a href="${path }/member/logout">로그아웃</a>	    
		                  	</c:otherwise>                        								        		                            	
	                 	</c:choose>
                	</c:when>
	               	<c:when test= "${sessionScope.member == null}">
	                	<a href="${path }/member/login">로그인</a>
	                	<a href="${path }/member/join">회원가입</a>
	               	</c:when>
                </c:choose>          
                <a href="${path }/product/orderList">마이페이지</a>
            </div>
            <div class="offcanvas__top__hover">
                <c:if test="${sessionScope.member.verify==1 or sessionScope.member.verify==3}">
                	<span><a href="${path }/product/orderList">마이페이지 <i class="arrow_carrot-down"></i></a></span>
                </c:if>
                <c:if test="${sessionScope.member.verify==2 }">
                	<span><a href="${path }/admin/index">관리자페이지 <i class="arrow_carrot-down"></i></a></span>
                </c:if>
                <ul >
                    <li text-align:center>관심상품</li>
                    <li text-align:center><a href="${path }/product/orderList">주문조회</a></li>
                    <li text-align:center>내가쓴글</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="../resources/img/icon/search.png" alt=""></a>
            <a href="#"><img src="../resources/img/icon/heart.png" alt=""></a>
            <a href="${path }/product/cartList"><img src="../resources/img/icon/cart.png" alt=""> <span>0</span></a>
            <!-- <div class="price">장바구니</div> -->
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p></p>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p> 안경 쇼핑몰입니다. </p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            
                            
                            <div class="header__top__links">
                      
	                            <c:choose> 
	                            	<c:when test= "${sessionScope.member != null}">
		                            	<c:choose>
		                            		<c:when test="${member.verify==3 }">
				                            	<a href="javascript:void(0)" onclick="naverLogout(); return false;">
										            <span>로그아웃</span>
										        </a>
									        </c:when>
									        <c:otherwise>
			                            		<a href="${path }/member/logout">로그아웃</a>	    
			                            	</c:otherwise>                        								        		                            	
		                            	</c:choose>
	                            	</c:when>
	                            	<c:when test= "${sessionScope.member == null}">
		                            	<a href="${path }/member/login">로그인</a>
		                            	<a href="${path }/member/join">회원가입</a>
	                            	</c:when>
	                            </c:choose>                             
                            </div>
                            <div class="header__top__hover">
                                <c:if test="${sessionScope.member.verify==1 or sessionScope.member.verify==3}">
                                	<span><a href="${path }/member/login">마이페이지 <i class="arrow_carrot-down"></i></a></span>
                                </c:if>
                                <c:if test="${sessionScope.member.verify==2 }">
                                	<span><a href="${path }/admin/index">관리자페이지 <i class="arrow_carrot-down"></i></a></span>
                                </c:if>
                                <ul >
                                    <li text-align:center>관심상품</li>
                                    <li text-align:center><a href="${path }/product/orderList">주문조회</a></li>
                                    <li text-align:center>내가쓴글</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="${path }/"><img src="../resources/img/llogo.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                        	<li><a href="${path}/product/recommend">추천</a></li>
                            <li class="active"><a href="${path}/product/new">New</a></li>
                            <li><a href="${path}/product/best">Best</a></li>
                            <li><a href="${path}/product/list?catecode=1">안경테</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html"></a>원형</li>
                                     <li><a href="${path}/product/list?catecode=1&pdshapes=1">원형</a></li>
                                    <li><a href="${path}/product/list?catecode=1&pdshapes=2">사각형</a></li>
                                    <li><a href="${path}/product/list?catecode=1&pdtypes=1">뿔테</a></li>
                                    <li><a href="${path}/product/list?catecode=1&pdtypes=2">금테</a></li>
                                    <li><a href="${path}/product/list?catecode=1&pdshapes=3">사각라운드</a></li>
                                </ul>
                            </li>
                            <li><a href="${path}/product/list?catecode=2">선글라스</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html"></a>선글라스</li>
                                     <li><a href="${path}/product/list?catecode=2&pdshapes=1">원형</a></li>
                                    <li><a href="${path}/product/list?catecode=2&pdshapes=2">사각형</a></li>
                                    <li><a href="${path}/product/list?catecode=2&pdshapes=4">캣츠형</a></li>
                                    <li><a href="${path}/product/list?catecode=2&pdshapes=5">스포츠형</a></li>
                                </ul>
                            </li>
                            <li><a href="${path}/notice/noticeList">커뮤니티</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html"></a>커뮤니티</li>
                                     <li><a href="${path}/notice/noticeList">공지사항</a></li>
                                    <li><a href="${path}/question/questionList">Q&A</a></li>
                                     <li><a href="${path}/review/reviewList">리뷰</a></li>
                                 </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="../resources/img/icon/search.png" alt=""></a>
                        <a href="#"><img src="../resources/img/icon/heart.png" alt=""></a>
                         <a href="${path }/product/cartList"><img src="../resources/img/icon/cart.png" alt=""><span>0</span></a>
                        <div class="price">장바구니</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>