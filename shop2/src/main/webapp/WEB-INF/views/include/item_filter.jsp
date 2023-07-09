<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table>
	<tr>
		<th width="100px">테종류</th>
			<c:set var="pan" value="" />
			<c:forEach var="item" items="${map.pdtypes }">
				<c:if test="${item==0 }">
					<c:set var="pan" value="0" />
				</c:if>
			</c:forEach>
		<td width="100px"><input type="checkbox" name="pdtypes" value="0" <c:out value="${pan=='0'? 'checked':'' }" />> 전체</td>
			<c:set var="pan" value="" />
			<c:forEach var="item" items="${map.pdtypes }">
				<c:if test="${item==1 }">
					<c:set var="pan" value="1" />
				</c:if>
			</c:forEach>
		<td width="100px"><input type="checkbox" name="pdtypes" value="1" <c:out value="${pan=='1'? 'checked':'' }" />> 뿔테</td>
			<c:set var="pan" value="" />
			<c:forEach var="item" items="${map.pdtypes }">
				<c:if test="${item==2 }">
					<c:set var="pan" value="2" />
				</c:if>
			</c:forEach>
		<td width="100px"><input type="checkbox" name="pdtypes" value="2" <c:out value="${pan=='2'? 'checked':'' }" />> 금테</td>
	</tr>
	<tr>
		<th width="100px">모양</th>
			<c:set var="pan" value="" />
			<c:forEach var="item" items="${map.pdshapes }">
				<c:if test="${item==0 }">
					<c:set var="pan" value="0" />
				</c:if>
			</c:forEach>
		<td width="100px"><input type="checkbox" name="pdshapes" value="0" <c:out value="${pan=='0'? 'checked':'' }" />> 전체</td>
			<c:set var="pan" value="" />
			<c:forEach var="item" items="${map.pdshapes }">
				<c:if test="${item==1 }">
					<c:set var="pan" value="1" />
				</c:if>
		</c:forEach>
		<td width="100px"><input type="checkbox" name="pdshapes" value="1" <c:out value="${pan=='1'? 'checked':'' }" />> 원형</td>
			<c:set var="pan" value="" />
			<c:forEach var="item" items="${map.pdshapes }">
				<c:if test="${item==2 }">
					<c:set var="pan" value="2" />
				</c:if>
		</c:forEach>
		<td width="100px"><input type="checkbox" name="pdshapes" value="2" <c:out value="${pan=='2'? 'checked':'' }" />> 사각형</td>
		<c:if test="${map.catecode==1 }">
				<c:set var="pan" value="" />
				<c:forEach var="item" items="${map.pdshapes }">
					<c:if test="${item==3 }">
						<c:set var="pan" value="3" />
					</c:if>
			</c:forEach>
			<td width="100px"><input type="checkbox" name="pdshapes" value="3" <c:out value="${pan=='3'? 'checked':'' }" />> 사각라운드</td>
		</c:if>
		<c:if test="${map.catecode==2 }">
				<c:set var="pan" value="" />
				<c:forEach var="item" items="${map.pdshapes }">
					<c:if test="${item==4 }">
						<c:set var="pan" value="4" />
					</c:if>
			</c:forEach>
			<td width="100px"><input type="checkbox" name="pdshapes" value="4" <c:out value="${pan=='4'? 'checked':'' }" />> 캣츠형</td>
				<c:set var="pan" value="" />
				<c:forEach var="item" items="${map.pdshapes }">
					<c:if test="${item==5 }">
						<c:set var="pan" value="5" />
					</c:if>
			</c:forEach>
				<td width="100px"><input type="checkbox" name="pdshapes" value="5" <c:out value="${pan=='5'? 'checked':'' }" />> 스포츠형</td>
			</c:if>
		</tr>
</table>
