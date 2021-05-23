<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 오늘의 날짜를 계산해서 오늘 기준으로 년도, 월, 일이 언제인지를 기준으로 값이 입력 될 수 있도록 한다. -->
<c:set var='today' value="<%=new java.util.Date()%>" />
<c:set var='monthPtn'>
	<fmt:formatDate value="${today }" pattern="yyyy-MM" />
</c:set>
<c:set var='datePtn'>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />
</c:set>
<c:set var='yearCheck'>
	<fmt:formatDate value="${today }" pattern="yyyy" />
</c:set>
<c:set var="dateThreePtn">
	<fmt:formatDate value="<%=new Date(new Date().getTime() - 60*60*24*1000*90L ) %>" pattern="yyyy-MM-dd" />
</c:set>
<style>
	button{
		border-radius:5px;
	}
	/*맨 위 top Bar*/ 
	#topBar h5{  
		padding-left:120px;
	}
	#topBar input::placeholder {
	  color: lightgray; 
	}  
	#title>ul,.contentList{
		position:relative;
	} 
	#title li:nth-of-type(5), #contentBox li:nth-of-type(5){ 
		width:11% !important; 
	}   
	#sortBox {
		margin:50px 0 0 30px;
	} 
	#sortBox li{
		margin-top:30px;
	}
	#sortBox li:nth-of-type(3){
		margin:30px 80px 0 10px;
	}
	#sortBox li:nth-of-type(5){
		margin:30px 10px 0 10px;
	}
	#sortBox li:nth-of-type(5)>input{
		width:200px;
	}
	#sortBox li:nth-of-type(6)>button{
		width:50px;
		margin-right:10px;
	}
	/* 본문 정렬*/
	#container li{ 
		list-style-type:none;
		float:left;
	}
	#contentBox{
		top:-10px;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}  
	#contentBox li:nth-of-type(8){
		width:12%;
	} 
	#contentBox li:nth-of-type(9){
		width:12%;
	}   
	.contentList{
		height:28px;
	} 
	#contentList>ul{
		float:left; 
	}
	.contentList li{
		width: 14%;
	}
	#contentBox li{
		width:12%;
	}
	/*하단 검색 파트*/
	#searchBox{
		position:relative;
		top:30px;
		left:100px;
	}
	#searchBox li:nth-of-type(2){
		margin-left:10px;
	}
	#noticeSearchFrm{
		left:130px;
	}
	/*페이징 이미지 링크*/
	.page_nation .pprev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat center center;
		margin-right:0;
	}
	/*정산 표*/ 
	#hr{
		margin-top:30px;
		margin-bottom:30px;
		border: 1px solid lightgray;
	}
	.flex{
		display:flex;
		padding-left:90px;
	}
	.tbl  {
		border-collapse:collapse;
		border-spacing:0;
	}
	.tbl td{
		border:lightray solid 1px; 
		font-size:14px;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tbl th{
		border:lightray solid 1px; 
		font-size:14px;
		font-weight:normal;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tbl .settleHeader{
		background-color:lightgray;
		font-size:16px;
		font-weight:bold;
		text-align:center;
		vertical-align:top
	}
	.tbl .settleHeader:nth-of-type(1){
		border-radius:10px 0 0 0 ;
	}
	.tbl .settleHeader:nth-of-type(3){
		border-radius:0 10px 0 0 ;
	}
	.settleHeader:not(.settleHeader:nth-of-type(1), .settleHeader:nth-of-type(3)),
	.settleContent{
		border:1px solid #DFDFDF;
	}
	.tbl .settleContent{
		font-size:18px;
		text-align:center;
		vertical-align:top
	} 
	 #settleBtn{
	 	position:relative;
	 	top:-90px;
	 	left:920px;
	 	border:1px solid #182337;
	 	width:150px;
	 	height:90px;
	 	background-color:#182337;
	 	color:white;
	 	font-weight:bold;
	 	font-size:18px;
	 	letter-spacing:2px;
	 	border-radius:5px;
	 }
	 #settleBtn:hover{
	 	background-color: midnightblue;
	 }
</style>
<script>
 
</script>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="settleMng">정산 관리</a></strong></h5></li> 
			</ul> 
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="sortBox">
			<form action="">
				<ul>
					<li><input type="date" name="startDate" value="${dateThreePtn }"/>   <span>~&nbsp;</span></li>
					<li><input type="date" name="endDate" value="${datePtn }"/></li>
					<li style="display:flex;line-height:30px;"><input type="checkbox" name="checkBtn" value="구매확정" id="checkBtn" style="top:-3px;"><label for="checkBtn" style="background-color:white;">구매확정 목록</label></li>
					<li><select id="selectOption" name="selectOption"> 
							<option disabled="disabled" selected>검색분야</option>  
							<option value="구매번호" >구매번호</option>  
			   				<option value="상품명">상품명</option>
			   				<option value="구매자">구매자 아이디</option>   
			   				<option value="법인명">법인명</option>   
			   			 </select>
		   			</li> 
		   			<li><input type="text" name="searchTxt" placeholder="검색어를 입력해주세요"/></li>
		   			<li><button class="success" id="searchBtn">검색</button></li>
					<li><button class="success" id="excelDown">엑셀로 다운</button></li>  
				 </ul>
			 </form>
		</div>
   		<div id="contentBox"> 	
		<div id="title">
			<ul> 
				<li>구매번호</li>
				<li>카테고리</li>
				<li>주문현황</li>
				<li>상품명</li>
				<li>아이디</li>
				<li>법인명</li> 
				<li>구매일</li> 
				<li>정산일</li>
			</ul>
		</div>  
		  <div id="contentList">
			<ul class="contentList">
				<c:if test="${result != null }">
					<c:forEach var="data" items="${result}">
						<li>${data.ordernum }</li>
						<li>${data.mcatename }</li>
						<li>${data.orderstatus }</li>
						<li><a href="제목?">${data.productname }</a></li>  
						<li>${data.userid }</li>  
						<li>${data.storename }</li>
						<li>${data.orderconfirm }</li>
						<c:if test="${data.settledate == null }">
							<li>-</li> 
						</c:if>
						<c:if test="${data.settledate != null }">
							<li>${data.settledate }</li>
						</c:if>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<!--------------페이징 표시-------------------->
		<c:if test="${pageVO != null }">
			<div class="page_wrap">
				<div class="page_nation">
				   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
				   		<a class="arrow prev" href="/sshj/sellerSales?pageNum=${pageVO.pageNum-1}"></a>
				   </c:if>
				   <!-- 페이지 번호                   1                                    5                     -->
		           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
		              <c:if test="${p<=pageVO.totalPage}">
		                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
		                    <a class="active">${p}</a>
		                 </c:if>   
		                 
		                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
		                    <a class="arrow" href="/sshj/sellerSales?pageNum=${p}">${p}</a>
		                 </c:if>
		              </c:if>
		           </c:forEach>
		           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
		              <a class="arrow next" href="/sshj/sellerSales?pageNum=${pageVO.pageNum+1}"></a>
		           </c:if>
				</div>
		 	</div>
		</c:if>
		 <hr id="hr"/>
		<div id="settleBox"> 
			<table class="tbl" style="undefined;table-layout: fixed; width: 900px">
			<colgroup>
			<col style="width: 200px">
			<col style="width: 200px">
			<col style="width: 200px">
			</colgroup>
			<thead>
			  <tr>
			    <th class="settleHeader">정산일</th>
			    <th class="settleHeader">수익</th>
			    <th class="settleHeader">총 정산 금액</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td class="settleContent"><div id="settleDate">${dateThreePtn }</div></td>
			    <td class="settleContent"><div class="flex"><div id="profit">3,269,840</div>원</div></td>
			    <td class="settleContent"><div class="flex"><div id="settleMoney">9,561,028</div>원</div></td>
			  </tr>
			</tbody>
			</table>
		</div>	
		<button class="success" value="" name="" id="settleBtn">정산하기</button>
	 </div>
</div>
<script>
// onload를 통해 기본 데이터값을 불러온다
//window.onload = getData();
</script>