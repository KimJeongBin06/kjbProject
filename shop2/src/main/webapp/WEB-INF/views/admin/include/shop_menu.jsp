<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- Page Preloder -->

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <a href="#">로그인</a>
                <a href="mypage">마이페이지</a>
            </div>
            <div class="offcanvas__top__hover">
                <span>고객센터 <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>asdfsdfa</li>
                    <li>Q&A</li>
                    <li>Review</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="../resources/img/icon/search.png" alt=""></a>
            <a href="#"><img src="../resources/img/icon/heart.png" alt=""></a>
            <a href="#"><img src="../resources/img/icon/cart.png" alt=""> <span>0</span></a>
            <!-- <div class="price">장바구니</div> -->
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>집가나요 ?</p>
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
                            	<a href="${path }/member/logout">로그아웃</a>
                            	</c:when>
                            	<c:when test= "${sessionScope.member == null}">
                            	<a href="${path }/member/login">로그인</a>
                            	</c:when>
                            </c:choose>
                            	
                                <a href="${path }/member/join">회원가입</a>
                            </div>
                            <div class="header__top__hover">
                                <a href="${path }/member/mypage"><span>마이페이지<i class="arrow_carrot-down"></i></span></a>
                                <ul >
                                    <li text-align:center>관심상품</li>
                                    <li text-align:center>주문조회</li>
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
                            <li class="active"><a href="${path}/product/new">New</a></li>
                            <li><a href="${path}/product/best">Best</a></li>
                            <li><a href="${path}/product/list?catecode=1">안경테</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html"></a>원형</li>
                                    <li><a href="./shop-details.html">원형</a></li>
                                    <li><a href="./shop-details.html">사각형</a></li>
                                    <li><a href="./shopping-cart.html">뿔테</a></li>
                                    <li><a href="./checkout.html">금테</a></li>
                                    <li><a href="./blog-details.html">사각라운드</a></li>
                                </ul>
                            </li>
                            <li><a href="${path}/product/list?catecode=2">선글라스</a>
                                <ul class="dropdown">
                                    <li><a href="./about.html"></a>선글라스</li>
                                    <li><a href="./shop-details.html">원형</a></li>
                                    <li><a href="./shop-details.html">사각형</a></li>
                                    <li><a href="./shopping-cart.html">캣츠형</a></li>
                                    <li><a href="./checkout.html">스포츠형</a></li>
                                </ul>
                            </li>
                            <li><a href="${path}/Community/noticeList">커뮤니티</a>
                                <ul class="dropdown">
                                    <li><a href="#"></a>커뮤니티</li>
                                    <li><a href="${path}/notice/noticeList">공지사항</a></li>
                                    <li><a href="${path}/notice/questionList">Q&A</a></li>
                                     <li><a href="${path}/notice/reviewList">리뷰</a></li>
                                 </ul>
                            </li>
                            
                            <!-- --------------------------------------------------------------------------- -->
                            <!-- 임의로 만들어놓은 구매페이지 -->
                            <li><a href="${path }/order/orderList">구매</a>
                            </li>
                            <!-- --------------------------------------------------------------------------- -->
                            <!-- --------------------------------------------------------------------------- -->
                            <!-- 임의로 만들어놓은 상품등록 페이지 -->
                            <li><a href="${path }/product/productList">상품등록</a>
                            </li>
                            <!-- --------------------------------------------------------------------------- -->
                        </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="../resources/img/icon/search.png" alt=""></a>
                        <a href="#"><img src="../resources/img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="../resources/img/icon/cart.png" alt=""><span>0</span></a>
                        <div class="price">장바구니</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>