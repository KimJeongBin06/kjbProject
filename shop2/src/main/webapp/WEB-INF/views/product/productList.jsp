<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/shop_header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<link href="../resources/review/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="../resources/review/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<c:if test="${sessionScope.member.verify==2}">
<script>
	$("document").ready(
		function(){ //버튼을 눌렀는지 확인
			$("#btnWrite").click(
				function(){
					location.href = "${path }/product/productWrite"; //해당페이지로 이동
				}		
			); //클릭했을 때
		}		
	
	);
	function list(page){
		location.href="${path}/product/productList?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	}
	
</script>

<div class="container">
<form name="form1" method="get" action="${path}/product/productList">
	
	

	
	<table border="1"class="table table-striped">
		<tr>
		<!-- pdnu	catecode	pdname	pdcontent	pdprice	pdcnt	soldcnt	pdimg1	pdimg2	pdimg3	pddtimg	pddate	 -->
			<th>상품번호</th>
			<th>샘플사진</th>
			<th width="500px">상품명</th>
			<th>상품종류</th>
			<th>상품가격</th>
			<th>재고</th>
			<th width="100px">등록일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
<c:forEach var="row" items="${map.list}">
		<tr>
			<td>${row.pdnu }</td>
			<td><img src="https://anjoimages.s3.amazonaws.com/${row.pdimg1 }" width="175" height="175">
			<input type="hidden" value="${row.pdimg1 }">
			<input type="hidden" value="${row.pdimg2 }">
			<input type="hidden" value="${row.pdimg3 }">
			<input type="hidden" value="${row.pddtimg }">
			</td>
			<td><a href="${path }/product/item?pdnu=${row.pdnu }&curPage=${map.productPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.pdname }
			</a></td>
			<td>
			<c:choose>
				<c:when test="${row.catecode==1 }">
					안경테
				</c:when>
				<c:otherwise>
					선글라스
				</c:otherwise>
			</c:choose>
			</td>
			<td>￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.pdprice }" /></td>
			<td>${row.pdcnt }</td>
			<td><fmt:formatDate value="${row.pddate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td><a href="${path }/product/productView?pdnu=${row.pdnu }">수정</a></td>
			<td><a href="${path }/product/productDelete?pdnu=${row.pdnu }&pdimg1=${row.pdimg1 }&pdimg2=${row.pdimg2 }&pdimg3=${row.pdimg3 }&pddtimg=${row.pddtimg }" 
			onclick="return confirm('삭제하시겠습니까?');">삭제</a></td>
		</tr>
</c:forEach>

				

		
	</table>
	<button type="button" id="btnWrite" style="float:right; height:30px; border-radius:10px">상품등록</button>
	<div style="text-align: center; padding:10px">
		<ul class="pagination">
			<c:if test="${map.productPager.curPage > 1 }">
				<li class="page-item"><a href="javascript:list('1')" style="color:#585858">《</a></li>
			</c:if>
			<c:if test="${map.productPager.curBlock > 1}">
				<li class="page-item"><a href="javascript:list('${map.productPager.prevPage }')" style="color:#585858">〈</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${map.productPager.blockBegin }" end="${map.productPager.blockEnd }">
				<c:choose>
					<c:when test="${num == map.productPager.curPage }">
						<li class="page-item"><span style="color:#BDBDBD">${num}</span>&nbsp;</li>	
					</c:when>
					<c:otherwise>
						<li class="page-item"><a href="javascript:list('${num }')" style="color:#585858">${num }</a>&nbsp;</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${map.productPager.curBlock <= map.productPager.totBlock }">
				<li class="page-item"><a href="javascript:list('${map.productPager.nextPage }')" style="color:#585858">〉</a></li>
			</c:if>
			<c:if test="${map.productPager.curBlock <= map.productPager.totPage }">
				<li class="page-item"><a href="javascript:list('${map.productPager.totPage }')" style="color:#585858">》</a></li>
			</c:if>
		</ul>
	</div>
	<div style="text-align: center; padding:10px">
		<select name="searchOption" style="height:30px; width:70px; border-radius:10px">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}" /> >전체</option>
			<option value="pdname" <c:out value="${map.searchOption == 'pdname'?'selected':''}" /> >상품명</option>
			<option value="pdnu" <c:out value="${map.searchOption == 'pdnu'?'selected':''}" /> >상품번호</option>
		</select>
		<input name="keyword" value="${map.keyword }" style="height:30px; width:300px; border-radius:10px">
		<input type="submit" value="검색" style="height:30px; width:50px; border-radius:10px">
	</div>

</form>
</div>
</c:if>	

</body>

</html>