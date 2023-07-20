<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<link rel="stylesheet" href="../resources/css/member/login.css">
<%@ include file="../include/shop_header.jsp" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
a{
  	text-decoration : none;
  }
table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
  .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .search_area input{
      height: 30px;
    width: 250px;
  }
  .search_area button{
     width: 100px;
    height: 36px;
  }
  .search_area select {
  height: 35px;
  }
  .active{
     background-color: #cdd5ec;
  }
 a:link {color:black; text-decoration: none;}
 #top_btn {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
</style>
</head>

<body>
<%@ include file="../include/shop_menu.jsp" %>
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Notice</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>Notice</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                
                <%@ include file="../include/side_menu.jsp" %>
                
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="table_wrap">
	                           	<c:if test="${sessionScope.member.verify == 2 }">
	                                <a href="/notice/noticeEnroll" class="top_btn" id="top_btn">게시글 등록</a>
	                            </c:if>
									<table>
										<thead>
											<tr>
												<th class="bno_width">번호</th>
												<th class="title_width">제목</th>
												<th class="writer_width">작성자</th>
												<th class="regdate_width">작성일</th>
												<th class="updatedate_width">수정일</th>
											</tr>
										</thead>
											<c:set var="startNumber" value="1" />
											<c:forEach items="${list}" var="item" varStatus="status">
								    			<tr>
								        			<td>${status.index + startNumber}</td>
								        			<td>
								            			<a class="move" href="${item.nbno}">
								                			${item.ntitle}
								            			</a>
								        			</td>             
								        			<td>${item.nwriter}</td>
								        			<td><fmt:formatDate pattern="yyyy/MM/dd EEE HH:mm" value="${item.ndate}"/></td>
								        			<td><fmt:formatDate pattern="yyyy/MM/dd EEE HH:mm" value="${item.nupdate}"/></td>
								    			</tr>
											</c:forEach>
									</table>
									</div>
                        </div>                       
                    </div>
                    <div class="search_wrap">
				        <div class="search_area">
				        <select name="type">
				                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
				                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
				                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
				                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
				                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
				            </select>    
				            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
				            <button>Search</button>
				        </div>
				    </div>    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">				        		
					        		<!-- 이전페이지 버튼 -->
					                <c:if test="${pageMaker.prev}">
					                    <a href="${pageMaker.startPage-1}">Previous</a>
					                </c:if>
					        
					        		<!-- 각 번호 페이지 버튼 -->
					                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					                    <a href="${num}" class="pageInfo_btn ${pageMaker.cri.pageNum == num ? 'active':'' }">${num}</a>
					                </c:forEach>
					                
					                <!-- 다음페이지 버튼 -->
					                <c:if test="${pageMaker.next}">
					                    <a href="${pageMaker.endPage + 1 }">Next</a>
					                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">    
    </form>
<script>
$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	console.log(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "enrol success"){
			alert("등록이 완료되었습니다.");
		}
		
		if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
		
		if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
		
	}	
	
});

	let moveForm = $("#moveForm");

	$(".move").on("click", function(e){
    	e.preventDefault();
    	   	
    	moveForm.append("<input type='hidden' name='nbno' value='"+ $(this).attr("href")+ "'>");
    	moveForm.attr("action", "/notice/noticeGet");
    	moveForm.submit();
    	moveForm.find("input[name='nbno']").remove();
	});
	
	$(".product__pagination a").on("click", function(e){
		
		e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/notice/noticeList");
        moveForm.submit();
 
       
    });
	
	$(".search_area button").on("click", function(e){
        e.preventDefault();
        
        let type = $(".search_area select").val();
        let keyword = $(".search_area input[name='keyword']").val();
        
        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        } 
        
        moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
    });
 
</script>
   
</body>

</html>