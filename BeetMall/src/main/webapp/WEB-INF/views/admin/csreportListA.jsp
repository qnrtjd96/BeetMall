<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	/*맨 위 top Bar*/
	#topBar h5{  
		padding-left:100px;
	}
	#topBar li:nth-of-type(1){
	 	margin-left:10px;
	}
	#topBar li:nth-of-type(2){
		margin-left:110px;
	}
	#topBar li:nth-of-type(4){
		width:7%;
	}
	#topBar li:nth-of-type(8){
		position:relative;
		left:-80px;
	}  
	#contentBox{
		top:-10px;
	}
	#search{
		margin-left:40px;
		height:29px;
		border-radius:3px;
	}
	#from{ 
		margin-right:14px;
	}
	#todate{ 
		position:relative;
		left:-15px;
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
	#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(5),#sortBox li:nth-of-type(6)  {
		width: 10%;
	}
	#sortBox li:nth-of-type(2) {
		display:flex;
		width: 17%;
		margin-right:4px;
	}
	#sortBox li:nth-of-type(3) {
		width:10%;
		margin-right: 29px; 
	}
	#sortBox li:nth-of-type(4) {
		margin-right:221px;
	}  
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8){
		width: 3.5%;
	} 
	/*내용 전체 정렬*/
	#topBar li:nth-of-type(7){
		position:relative; left:-80px;
	}   
	#contentBox li:nth-of-type(9n-2) {
    	width: 8%;
	}
	#contentBox li:nth-of-type(9n+1) {
    	width: 0%;
	} 
	#contentBox li:nth-of-type(3) {
    	width: 8%;
	} 
	#container li:nth-of-type(4):not(#sortBox li:nth-of-type(4)){
		width:20%;	
		text-align: left;
	}
	#title>ul,.contentList{
		position:relative; left:-20px;
	}
	#contentBox li:nth-of-type(2){
		margin-left:20px;
	} 
	 
	/* 본문 정렬*/
	#container li{ 
		width:11%; 
		list-style-type:none;
		float:left;
	} 
	.contentList{
		height:30px; 
	} 
	.contentList:nth-of-type(1){
		margin-top:0;
	} 
	#contentList>ul{
		float:left;
		margin-bottom:0px;
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
	/*모달*/
	#modal{
		border:1px solid gray;
		width:500px;
		margin:400px 0 0 450px;
		z-index:1;
		position: absolute;
        top: -140px;
	    background-color: aliceblue;
	}
	#modalHeader, #modalPastHeader{
		background-color:lightgray;
		text-align:center;
		font-weight:bold;
		letter-spacing:2px;
		padding:5px 0;
	}
	#modal ul{
		width:500px;
		display:flex;
	}
	#modalList>ul:nth-of-type(1){
		padding:5px 0; 
		border-bottom:1px solid lightgray;
		background-color:#eee;
		width:498px;
	}
	#modal li{
		width:50%;
		text-align:center;
	}
	#modalPast{
		margin:10px 0 20px 50px;
	}
	#modalPast li{
		display:flex;
		width:30%;
	}
	#modalPast div{
		color:red;
		font-weight:bold;
		margin:0 10px;
	}
	#modal input{
		width:100px;
		margin:20px 0 20px 110px;
	}
	#modal button{
		border:1px solid lightgray;
		border-radius:5px;
	}
	#modal button:not(#modalPast button){
		width:70px;
		margin-right:10px;
	} 
	#modal button:nth-of-type(1):not(#modalPast button){
		margin-left:30px;
	}
	#modalPastHeader{
		background-color:#eee; 
	}
</style>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="csreportListA">신고 관리</a></strong></h5></li> 
				<li><button class="success" value="add" name="add" id="blind">비공개</button></li>
				<li><button class="success" value="del" name="del" id="delBtn">정지</button></li> 
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
						<option value="reportDate">신고일</option>
						<option value="processDate">처리일</option>
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>		
				<li><input type="submit" value="검색" /></li>		
				<li><select name="sort"   id="cateSort"> 
		   				<option value="카테고리" selected>카테고리</option>
		   				<option value="건과류">건과류</option>		   				
		   				<option value="견과류">견과류</option>  
		   				<option value="제목">과일</option> 
		   				<option value="채소">채소</option> 
		   				<option value="쌀/잡곡">쌀/잡곡</option> 
			  		</select> 
	   			</li>  
				<li><select name="sort"> 
						<option value="정렬하기" selected>정렬하기</option>
						<option value="상품번호">번호</option>
		   				<option value="게시판">게시판</option>
		   				<option value="내용">내용</option> 
		   				<option value="신고일">신고일</option>  
		   				 <option value="처리일">처리일</option>
		   				 <option value="신고유형">신고유형</option>
		   				 <option value="신고인">신고인</option>
		   				 <option value="신고받은이">신고받은이</option> 
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
				<li>신고번호</li>
				<li>게시판</li>
				<li>내용</li>
				<li>신고일</li>
				<li>처리일</li>
				<li>신고유형</li>
				<li>신고인</li>
				<li>신고받은이(+)</li> 
			</ul>
		</div>  
		<div id="contentList">
			<c:forEach var="data" items="${list}">
				<ul class="contentList">
					<li><input type="checkbox" name="check" id="check"></li>
					<li>${data.reportnum }</li>
					<li>${data.reportboard }</li>
					<li class="wordCut"><a href="/sshj/csReportSelect?reportnum=${data.reportnum}">${data.reportcontent}</a></li>
					<li>${data.reportdate }</li>
					<li>
						<c:if test="${data.completedate==null }">
							처리요망
						</c:if>
						<c:if test="${data.completedate != null }">
							${data.completedate }
						</c:if>
					</li>
					<li>${data.reportreason }</li>
					<li>${data.userid }</li>
					<li class="popup" style="cursor: pointer;">${data.reporteduser }</li>
				</ul>
			</c:forEach> 
		</div>
		</div>	 
		<div class="page_wrap">
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="/sshj/csreportListA?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="/sshj/csreportListA?pageNum=${p}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="/sshj/csreportListA?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord != null && pageVO.searchWord != ''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>"></a>
	           </c:if>
			</div>
		 </div> 
		 <div>
			<form method="get" class="searchFrm" action="/sshj/csreportListA">
				 <select name="searchKey">
					<option value="reportcontent" selected>내용</option>
	   				<option value="userid">신고인</option> 
	   				<option value="reporteduser">신고받은사람</option> 
	   				<option value="reportreason">신고유형</option> 
	   				<option value="reportboard">게시판</option>
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="검색"/> 
			</form>
			
		</div>  
	</div>
		<!-- 신고 처리 모달창 -->
		<div id="modal" style="display:none">
			<div id="modalHeader">
				회원 정지 처리
			</div>
			<div id="modalList">
				<ul>
					<li>신고인</li>
					<li>신고사유</li>
				</ul>
				<ul id="reason">
					<!-- <li><div>dlkfjhbu</div></li>
					<li><div>비방</div></li> -->
				</ul>
			</div>
			<div id="modalPastHeader">정지 이력</div>
			<div id="modalPast">
				<ul>
					<li>정지 : 총 <div id="tt2"></div>회</li>
					<li>정지일 : 총 <div id="tt3"></div>일</li>
					<li><button class="success">내역 상세 보기</button></li>
				</ul>
			</div>
			<hr>
			<input type="text" value="" id="stopinput">&nbsp; 일 &nbsp;
			<button class="success" id="modalstop">정지</button>
			<button class="success" id="modalcancel">닫기</button>
		</div> 
<script>
	$(function(){
		$("#modalcancel").click(function(){
			$(this).parent().css("display","none");
		});
		
		var userid=""; //유저아이디
		var reportnum=0; //번호
		$('.popup').click(function(){
			  userid = $(this).html();
			  reportnum = $(this).prev().prev().prev().prev().prev().prev().prev().html();
			  var url = "/sshj/modalSelect";
			  var params = "reporteduser="+userid;
			  $.ajax({
				url:url,
				data:params,
				success:function(result){
					console.log(result);
					var $result = $(result); //vo, vo, vo, vo
					
					var tag="";
					var tag2=0;
					var tag3=0;
					$result.each(function(idx, obj){
						for(i=0; i<obj.list.length; i++){
							tag += "<li class='kangsan'><div>"+ obj.list[i].userid+ "</div></li>";
							tag += "<li class='kangsan'><div>"+ obj.list[i].reportreason+ "<div></li>";
						}
						if(obj.list2.length>=1){
							tag2 = obj.list2[0].count
							tag3 = obj.list2[0].reportdate
						}
					});
					$("#reason").html(tag);
					$("#tt2").html(tag2);
					$("#tt3").html(tag3);
					$("#modal").css("display","block");
				},error:function(){
					console.log("가져오기 에러..");
				}
			}); 
		});
		$("#modalstop").click(function(){
			var stopdate = $("#stopinput").val();
			console.log("stopdate = " + stopdate);
			$.ajax({
				url: "/sshj/memberstop",
				data: "stopdate="+ stopdate+ "&userid="+userid +"&reportnum="+reportnum,
				success:function(result){
					console.log("성공 = " +result);
					alert(userid +"는"+stopdate+"일 정지 처리되었습니다.");
					location.href="/sshj/csreportListA";
				},error:function(){
					console.log("정지 시켜주기 에러..");
				}
			}); 
		});
	});
</script>
<style>
	.kangsan{
	    width: 249px !important;
	    text-align: center !important;
	    display: block;
	}
	#reason{
		display: block !important;
		overflow:auto;
	}
	#reason>li{
		float:left;
		background-color: aliceblue;
	}
</style>