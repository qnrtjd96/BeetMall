<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/inc/top.jspf" %>

<style> 
	 /*회색 바*/   
	#topBar h5{  
		padding-left:160px;
	}
	#topBar li:nth-of-type(1){   
		position:relative;
		left:-8px;
	}
	#topBar li:nth-of-type(2){   
		margin-left:56px;
	}
	#topBar li:nth-of-type(4){
		width:6%;
	}  
	/*전체*/
	 #container li{ 
		 list-style-type:none; 
		 float:left;  
	 }
	#contentBox{
		top:-10px;
	}       
	#contentBox li, #contentBox li:nth-of-type(5){ 
		width:11%;
	}
	#contentBox li:nth-of-type(9n-8){ 
		width:0%; 
	}
	#contentBox li:nth-of-type(3){ 
		width:28%; 
	}  
	#contentBox li:nth-of-type(2){ 
		width:13%; 
	}     
	#sortBox {
		margin: 50px 0 0 20px;
	}
	#sortBox li{
		margin-top:30px;
	}
	#sortBox>ul{
		width:1110px !important;
	}
	#sortBox li:nth-of-type(1) {
		width: 10%;
	}
	#sortBox li:nth-of-type(2) {
		display:flex;
		width: 16%;
	}
	#sortBox li:nth-of-type(3) {
		width:13%;
		margin-right:11px;
	}
	#sortBox li:nth-of-type(4) {
		margin-right:405px;
	} 
	#sortBox li:nth-of-type(5) {
		width:108px;
	} 
	#sortBox li:nth-of-type(6),#sortBox li:nth-of-type(7) {
		width:3.5%;
	} 
	#fromTo{
		margin-left:14px;
	}
	/*데이터 내용*/ 
	.cartImg{
		margin-left:10px;
		height:15%;
		width:20%;
	}
	#content input, textarea, select, #noticeSearchFrm input{
		border:1px solid lightgray; 
		border-radius: 3px;
	}#content li, label{
		list-style-type:none; 
		padding-bottom:10px;
	}
	#content select{
		height:28px;
	} 
	.contentList:nth-of-type(2n-1)>li:nth-of-type(6){
		padding:8.5px 0;
	}
	.contentList:nth-of-type(2n)>li:nth-of-type(6){
		padding:9px 0;
	}
	/*버튼*/
	#btns{ 
		top:-115px; 
		left:460px; 
	} 
	#btns a>button, button:nth-of-type(4){ 
		margin-left:900px; 
	} 
	#topBar Button:nth-of-type(1),
	#topBar Button:nth-of-type(2),
	#topBar Button:nth-of-type(3),
	#topBar Button:nth-of-type(4){
		padding:2px 7px;
	}    
	/* 페이징처리부분 */ 
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
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	/* 페이징처리끝 */
</style> 
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="boardRecipeListA">레시피 관리</a></strong></h5></li> 
				<li><button class="success" value="add" name="add" id="addBtn">추가</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
			</ul> 
		</div>  
	</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="sortBox">
			<ul>
				<li>
					<select name="searchDate">   
						<option value="regDate">등록일</option>
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>		
				<li><input type="submit" value="검색" /></li>		
				<li><select name="sort" > 
		   				<option value="레시피번호" selected>레시피번호</option>
		   				<option value="제목">제목</option>
		   				<option value="추천수">추천수</option>
		   				<option value="조회수">조회수</option>
		   				<option value="즐겨찾기">즐겨찾기</option>
		   				<option value="작성자">작성자</option>
		   				<option value="등록일">등록일</option> 
			  		</select> 
	   			</li>  
				<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
			 </ul>
		</div>
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check"></li>
				<li>레시피번호</li>
				<li>제목</li>
				<li>추천수</li>
				<li>조회수</li>
				<li>즐겨찾기</li>
				<li>작성자</li>
				<li>등록일</li> 
			</ul>
		</div>      
			<ul id="reciList">
					<c:forEach var="data" items="${list}">
					<li>${data.recipenum}</li>
					<li><a href="recipeView?recipenum=${data.recipenum}&id=${logId}">${data.recipetitle}</a></li>
					<li>${data.userid}</li>
					<li>${data.reciperecommend}</li>
					<li>${data.recipehit}</li>
					<li>${data.recipewritedate}</li>
					</c:forEach>
			</ul>
		
		</div>	 
	<!-- -----------------------------페이지 표시----------------------------------------- -->

	    <div class="page_wrap">
					<div class="page_nation">
					   <c:if test="${pageVO1.pageNum>1}"><!-- 이전페이지가 있을때 -->
					   		<a class="arrow prev" href="/sshj/boardRecipeListA?pageNum=${pageVO1.pageNum-1}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>"></a>
					   </c:if>
					   <!-- 페이지 번호                   1                                    5                     -->
			           <c:forEach var="p" begin="${pageVO1.startPageNum}" step="1" end="${pageVO1.startPageNum + pageVO1.onePageNum-1}">
			              <c:if test="${p<=pageVO1.totalPage}">
			                 <c:if test="${p==pageVO1.pageNum}"> <!-- 현재페이지일때 실행 -->
			                    <a class="active">${p}</a>
			                 </c:if>   
			                 <c:if test="${p!=pageVO1.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
			                    <a href="/sshj/boardRecipeListA?pageNum=${p}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>">${p}</a>
			                 </c:if>
			              </c:if>
			           </c:forEach>
			           <c:if test="${pageVO1.pageNum < pageVO1.totalPage}">
			              <a class="arrow next" href="/sshjboardRecipeListA?pageNum=${pageVO1.pageNum+1}<c:if test="${pageVO1.searchWord != null && pageVO1.searchWord != ''}">&searchKey=${pageVO1.searchKey}&searchWord=${pageVO1.searchWord}</c:if>"></a>
			           </c:if>
					</div>
			 </div>  
			 
			 <!-- --------------------------- --> 
		 <div>
			<form method="get" class="searchFrm" action="<%=request.getContextPath() %>/board/noticeBoardList.jsp">
				 <select name="searchKey">
					<option value="subject" selected>제목</option>
	   				<option value="no">공지번호</option> 
	   				<option value="who">대상</option> 
	   				<option value="writedate">공지일</option> 
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="검색"/> 
			</form> 
		</div>  
	</div>
</div> 
</html>