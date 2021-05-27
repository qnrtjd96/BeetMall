<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#container li {
	list-style-type: none;
	float: left;
}

#topBar h5 {
	padding-left: 170px;
}

#contentBox {
	top: -40px;
}

#contentBox li:nth-of-type(6n-5) {
	width: 0%;
}

#contentBox li {
	width: 25%;
}

#contentBox li:nth-of-type(4) {
	width: 37%;
}

#title li:nth-of-type(8n-1), #contentBox li:nth-of-type(8n-1) {
	width: 30%;
	padding-left: 20px;
}

#topBar li {
	width: 15%;
}

#topBar li:nth-of-type(2) {
	margin-left: 77px;
}

#topBar li:nth-of-type(3) {
	width: 12%;
}

#topBar li:nth-of-type(4) {
	width: 6%;
}

#content input, textarea, select, #noticeSearchFrm input {
	border: 1px solid lightgray;
	border-radius: 3px;
}

#content li, label {
	list-style-type: none;
	padding-bottom: 10px;
}

#content select {
	height: 28px;
}
/*버튼*/
#btns {
	top: -115px;
	left: 460px;
}

#btns a>button, button:nth-of-type(4) {
	margin-left: 900px;
}

#topBar Button:nth-of-type(1), #topBar Button:nth-of-type(2), #topBar Button:nth-of-type(3),
	#topBar Button:nth-of-type(4) {
	padding: 2px 7px;
}

#sortBox {
	margin: 80px 0 0 20px;
}

#sortBox>ul {
	width: 1110px !important;
}

#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(5), #sortBox li:nth-of-type(6)
	{
	width: 10%;
}

#sortBox li:nth-of-type(2) {
	display: flex;
	width: 16%;
}

#sortBox li:nth-of-type(3) {
	width: 10%;
	margin-right: 44px;
}

#sortBox li:nth-of-type(4) {
	margin-right: 294px;
}

#sortBox li:nth-of-type(7), #sortBox li:nth-of-type(8) {
	width: 3.5%;
}

#fromTo {
	margin-left: 14px;
}

.page_nation .pprev {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat
		center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat
		center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat
		center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8
		url('<%=request.getContextPath()%>/img/kpage_nnext.png') no-repeat
		center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}
/* 페이징처리끝 */
#listContainer {
	width: 1080px;
	position: absolute;
	top: 100px;
}

#listContainer ul {
	display: flex;
	flex-wrap: wrap;
	text-align: center;
	padding: 0 20px;
}

#listContainer li {
	height: 50px;
	padding: 5px 0 10px 0;
	line-height: 45px;
}

#listContainer li:nth-child(n+6) {
	border-bottom: 1px solid #eee;
}

#listContainer li:nth-child(n+1):nth-child(-n+5) {
	border-bottom: 1px solid #ccc;
	font-weight: bold;
	font-size: 16px;
}

#listContainer input {
	top: 0 !important;
	position: static;
	margin: 10px 0 0 0;
}

#listContainer li:nth-child(5n+1) {
	width: 5%;
	padding-top: 5px;
}

#listContainer li:nth-child(5n+2) {
	width: 15%;
}

#listContainer li:nth-child(5n+3) {
	width: 15%;
}

#listContainer li:nth-child(5n+4) {
	width: 15%;
}

#listContainer li:nth-child(5n+5) {
	width: 50%;
}

</style>
<script>
	$(function(){
		//전체선택, 전체해제
		$('#allCheck').click(function(){
			let btnCheck = $('#allCheck').prop('checked');
			
			if(btnCheck == true){
				$('input[name="check"]').prop('checked',true);
			} else {
				$('input[name="check"]').prop('checked',false);
			}
			
		})
		
		//삭제
		$('#delBtn').click(function(){
			let cnt = $('input[name="check"]:checked').length;
			let checkNum = new Array;
			$('input[name="check"]:checked').each(function(){
				checkNum.push(parseInt($(this).val(),10));
			});
			
			if( cnt == 0){
				alert('체크박스를 선택후 삭제가 가능합니다');
				return false;
			} else {
				if(confirm('선택한 게시글을 삭제하시겠습니까?')){
					$.ajax({
						type:"post",
						url:"csFAQDel",
						data: "check="+checkNum,
						success: function(result){
							if(result > 0){
								alert('삭제 성공하였습니다.');
								location.href="csFAQ";
							} else{
								alert('삭제 실패하였습니다.')
							}
						},error: function(){
							alert('서버통신오류');
						}
					})
				}
			}
		})
		
		//글작성
		$('#addBtn').click(function(){
			location.href="csFAQWrite";
		})
	})
</script>

<%@ include file="/inc/top.jspf"%>
<div id="topBarContainer">
	<div id="topBar">
		<ul>
			<li><h5>
					<strong><a href="csFAQ">자주 묻는 질문</a></strong>
				</h5></li>
			<li><button class="success" value="add" name="add" id="addBtn">글작성</button></li>
			<li><button class="success" value="del" name="del" id="delBtn">삭제</button></li>
		</ul>
	</div>
</div>
<div id="body1">
	<%@ include file="/inc/leftBar.jspf"%>
	<div id="container">
		<div id="listContainer">
			<ul>
				<li><input type="checkbox" id="allCheck" name="allCheck"></li>
				<li>문의번호</li>
				<li>카테고리</li>
				<li>구분</li>
				<li>제목</li>

				<c:if test="${list !=null }">
					<c:forEach var="result" items="${list }">
						<li><input type="checkbox" name="check" value="${result.faqnum }"></li>
						<li>${result.faqnum }</li>
						<li>${result.faqcate }</li>
						<c:if test="${result.faqoption==1 }">
							<li>소비자</li>
						</c:if>
						<c:if test="${result.faqoption==2 }">
							<li>판매자</li>
						</c:if>
						<li><a href="csFAQBoard?faqnum=${result.faqnum }">${result.faqtitle }</a></li>
					</c:forEach>
				</c:if>
			</ul>
			<c:if test="${pageVO != null }" >
				<div class="page_wrap" style="margin: 0 auto; position:static;">
					<div class="page_nation">
						<c:if test="${pageVO.pageNum>1}">
							<!-- 이전페이지가 있을때 -->
							<a class="arrow prev" href="csFAQ?pageNum=${pageVO.pageNum-1}<c:if test='${pageVO.searchKey !=null }'>&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord}</c:if>"></a>
						</c:if>
						<!-- 페이지 번호                   1                                    5                     -->
						<c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
							<c:if test="${p<=pageVO.totalPage}">
								<c:if test="${p==pageVO.pageNum}">
									<!-- 현재페이지일때 실행 -->
									<a class="active">${p}</a>
								</c:if>

								<c:if test="${p!=pageVO.pageNum}">
									<!-- 현재페이지가 아닐때 실행 -->
									<a class="arrow" href="csFAQ?pageNum=${p}<c:if test='${pageVO.searchKey !=null }'>&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${pageVO.pageNum < pageVO.totalPage}">
							<a class="arrow next" href="csFAQ?pageNum=${pageVO.pageNum+1}<c:if test='${pageVO.searchKey !=null }'>&searchKey=${pageVO.searchKey }&searchWord=${pageVO.searchWord}</c:if>"></a>
						</c:if>
					</div>
				</div>
			</c:if>

			<c:if test="${pageVO == null }">
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#" onclick="return false;"></a> <a class="arrow prev" href="#" onclick="return false;"></a> <a class="active" href="#" onclick="return false;">1</a> <a class="arrow next" href="#" onclick="return false;"></a> <a class="arrow nnext" href="#" onclick="return false;"></a>
					</div>
				</div>
			</c:if>
			<div>
				<form method="get" class="searchFrm" action="csFAQ">
					<select name="searchKey" style="margin-top:10px;">
						<option value="subject" selected>제목</option>
						<option value="content">내용</option>
						<option value="no">공지번호</option>
						<option value="who">대상</option>
					</select> <input type="text" name="searchWord" id="searchWord" /> <input type="submit" value="검색" />
				</form>
			</div>
		</div>
		<!--------------페이징 표시-------------------->

	</div>
</div>
</html>