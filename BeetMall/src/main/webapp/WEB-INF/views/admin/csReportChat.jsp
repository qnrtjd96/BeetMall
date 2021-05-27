<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	/*맨 위 top Bar*/
	#topBar h5{
		padding-left:150px;
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
	#topBar li:nth-of-type(7){
		margin-left:40px;
		width:150px;
	}
	#topBar li:nth-of-type(8){
		position:relative;
		left:-90px;
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
	#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(5)  {
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
		margin-right:333px;
	}  
	#sortBox li:nth-of-type(6),#sortBox li:nth-of-type(7){
		width: 3.5%;
	} 
	
	/*내용 전체 정렬*/
	#title{
		margin-top:20px;
	}
	#topBar li:nth-of-type(7){
		position:relative; left:-80px;
	}   
	#contentBox li:nth-of-type(9n-2) {
    	width: 8%;
	}
	#contentBox li:nth-of-type(9n-1) {
    	width: 23%;
    	padding:10px 25px; 
	}
	#contentBox li:nth-of-type(9n+1) {
    	width: 0%;
	} 
	#contentBox li:nth-of-type(3) {
    	width: 8%;
	}  
	#title>ul,.contentList{
		position:relative; left:-20px;
	}
	#title li:nth-of-type(8){
		position:relative;
		top:-10px;
	}
	#title li:nth-of-type(8){
		padding-bottom:10px;
	}
	#contentBox li:nth-of-type(2){
		margin-left:20px;
	} 
	#contentBox li:nth-of-type(5){
		width:11%;
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
	.contentList li{
		margin:0;
	}
	.contentList:nth-of-type(1){
		margin-top:0;
	} 
	#contentList>ul{
		float:left; 
	} 
	.contentList{
		margin:0!important;
		padding:0!important;
	}
	#titleul>li{
		padding-right:15px;
	}
	.contentList>li:nth-child(7n+1), #titleul>li:nth-child(7n+1){
		width:0px!important;
	}
	.contentList>li:nth-child(7n+2), #titleul>li:nth-child(7n+2){
		width:160px !important;
	}
	#titleul>li:nth-child(7n+2){
		margin-left:0px !important;
	}
	.contentList>li:nth-child(7n+3), #titleul>li:nth-child(7n+3){
		width:180px !important;
	}
	.contentList>li:nth-child(7n+4), #titleul>li:nth-child(7n+4){
		width:180px !important;
	}
	.contentList>li:nth-child(7n+5), #titleul>li:nth-child(7n+5){
		width:180px !important;
	}
	.contentList>li:nth-child(7n+6), #titleul>li:nth-child(7n+6){
		width:180px !important;
	}
	.contentList>li:nth-child(7n), #titleul>li:nth-child(7n){
		width:180px !important;
	}
	#titleul{
		height:40px;
		line-height: 40px;
	}
	#title{
		margin-bottom:0px !important;
		padding-bottom:0px !important;
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
		margin:500px 0 0 450px;
		z-index:1;
	}
	#modalHeader{
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
	#modalList>ul:nth-of-type(2n+1){
		background-color:#eee;
		width:498px;
	}
	#modal li{
		text-align:center;
	}
	#modal li:nth-of-type(1){
		width:30%;
	}
	#modal li:nth-of-type(2){
		width:70%;
	} 
	#modal input{
		width:100px;
		margin:20px 0 20px 10px;
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
	#modal select{
		margin-left:30px;
	}
	.reportuser{
		color:red;
	}
	.contentList{
		cursor: pointer;
	}
	.contentreport{
		
	}
	/* 채팅 */
	#chatIframe{
		position:absolute;
		top:400px;
		left:600px;
		width:702px;
		height:552px;
		padding:1px;
		background-color:white;
		display:none;
		overflow:hidden;
		z-index:20;
	}
	#chatContainer{
		width:500px;
		height:480px;
	}
	#chatTop{
		width:702px;
		height:20px;
		background-color:rgb(252,118,45);
	}
	#chatInfoTitle{
		height:50px;
		width:702px;
		background-color:white;
	}
	#chatFooter{
		display:none;
	}
	#closedivBtn, #reportChat{
		cursor: pointer;
	}
	#chatHeaderSpan{
		line-height:50px;	
	}
	#chatInfoTitle{
		text-align: center;
		font-size:16px;
	}
	#reportChat{
		color:red;
		float:left;
		margin-left:10px;
	}
	#closedivBtn{
		float:right;
		line-height:50px;
		font-size:20px;
		margin-right:10px;
	}
	#sender, #receiver{
		font-weight:bold;
		font-size:17px;
		margin-right:5px;
	}
	.reportBtn{
		width:100px !important;
		height:50px !important;
		background-color:rgb(250, 230, 210) !important;
		font-size:20px !important;
		margin-right:0px !important;
	}
	/* 모달 처리 */
	#modal{
		background-color: gray;
		opacity: 0.6;
		position: fixed;
		left:0px;
		top:0px;
		width:100%;
		height:100%;
		display:none;
		margin:0px !important;
		z-index:10;
	}
	#sortBox{
		display:none;
		
	}
</style>
<script>
	function pagelist(pagenum){
		var lin = "csReportChat?pageNum="+pagenum;
		location.href=lin;
	}
	$(function(){
		function reportPrev(){
			alert('실행됨');
			$("#chatFooter").css("display","none");
		}
		$(".contentList").click(function(){
			$("#modal").css("display","block");
			$(document.body).css("overflow","hidden");
			var roomcode = $(this).children().eq(0).children().eq(0).val();
			var sender = $(this).children().eq(0).children().eq(1).val();
			var receiver = $(this).children().eq(0).children().eq(2).val();
			$.ajax({
				url:"csReportSum",
				data : "userid="+sender,
				success: function(result){
					$("#sendersum").text(result);
				}, error : function(error){
					alert(error);
				}
			})
			$.ajax({
				url:"csReportCount",
				data : "userid="+sender,
				success: function(result){
					$("#sendercount").text(result);
				}, error : function(error){
					alert(error);
				}
			})
			$.ajax({
				url:"csReportSum",
				data : "userid="+receiver,
				success: function(result){
					$("#receiversum").text(result);
				}, error : function(error){
					alert(error);
				}
			})
			$.ajax({
				url:"csReportCount",
				data : "userid="+receiver,
				success: function(result){
					$("#receivercount").text(result);
				}, error : function(error){
					alert(error);
				}
			})
			$("#sender").text(sender);
			$(".senderid").text(sender).val(sender);
			$("#receiver").text(receiver);
			$(".receiverid").text(receiver).val(receiver);
			$("#chatIframe").css("display","block");/* 아이피 수정해야 할 곳 ^^^^^^ */
			$("#chatContainer").attr("src","http://192.168.0.52:12021/chatForm?sender="+sender+"&receiver="+receiver+"&roomcode="+roomcode+"&view=true");
		});
		
		$(document).on('click',"#closedivBtn",function(){
			$("#chatIframe").css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		});
		$(document).on('click', "#closeChatdiv", function(){
			$("#chatIframe").css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$(document).on('click', "#stopreportuserBtn", function(){
			var seltype = $("#useridsel").val();
			if(seltype == null){
				alert("정지 할 유저를 선택해주세요");
				return false;
			}else{
				$("#userstopform").submit();
			}
		});
		
		$(".contentList").hover(function(){
			$(this).children().css("background","#ddd");
		},function(){
			$(this).children().css("background","none");
		})
	})
</script> 
<%@ include file="/inc/top.jspf" %>
	<div id="modal"></div>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="csReportChat">채팅 관리</a></strong></h5></li> 
					<li><button class="success" value="add" name="add" id="blind" style="display:none;">비공개</button></li>
				<li><button class="success" value="del" name="del" id="delBtn" style="display:none;">정지</button></li> 
			</ul>
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container" style="padding-top:30px;">
		<div id="sortBox">
			<ul>
				<li>
					<select name="searchDate">   
						<option value="reportDate">신고일</option> 
					</select>  
				</li>
				<li><input type="date" id="from"><div id="fromTo">~</div></li>
				<li><input type="date" id="todate"></li>		
				<li><input type="submit" value="검색" /></li>		
				<li><select name="sort"> 
						<option value="채팅번호" selected>채팅번호</option>
		   				<option value="주문번호">주문번호</option>
		   				<option value="구입상품">구입상품</option> 
		   				<option value="구매자">구매자</option>  
		   				 <option value="판매자">판매자</option>
		   				 <option value="날짜">날짜</option>
		   				 <option value="내용">내용</option> 
		   				 <option value="신고처리">신고처리</option>  
	   				 </select>
	   			</li> 
	   			<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
			</ul>
		</div>
   		<div id="contentBox"> 	
   		<div style="float:right; margin-right:25px;">* 신고 채팅은 붉은색으로 표시됩니다</div>
		<div id="title">
			<ul id="titleul">
				<li></li>
				<li>채팅방번호</li>
				<li>채팅방 생성자</li>
				<li>채팅방 참여자</li>
				<li>채팅방 생성일</li>
				<li>채팅방 참여자</li>
				<li>신고받은이</li>
			</ul>
		</div>  
		<div id="contentList">
			<c:forEach var="vo" items="${list}"> 
				<c:if test="${vo.creport == 1 || vo.rreport == 1}">
					<ul class="contentList contentreport">
				</c:if>
				<c:if test="${vo.creport != 1 && vo.rreport != 1}">
					<ul class="contentList">
				</c:if>
					<li><input type="hidden" value="${vo.roomcode}"/><input type="hidden" value="${vo.creator}"/><input type="hidden" value="${vo.room_receiver}"/></li>
					<li>${vo.roomcode}</li>
					<li>${vo.creator}</li>
					<li>${vo.room_receiver}</li> 
					<li>${vo.roomdate}</li>
					<li>
						<c:if test="${vo.cre_out == 1}">
							${vo.creator}
						</c:if>
						<c:if test="${vo.rec_out == 1 && vo.cre_out == 1}">
							,${vo.room_receiver}
						</c:if>
						<c:if test="${vo.rec_out == 1 && vo.cre_out == 0}">
							${vo.room_receiver}
						</c:if>
					</li>
					<li>
						<c:if test="${vo.creport == 1 && vo.rreport == 1}"><span class="reportuser">${vo.creator}, ${vo.room_receiver}</span></c:if>
						<c:if test="${vo.creport == 1 && vo.rreport != 1}"><span class="reportuser">${vo.creator}</span></c:if>
						<c:if test="${vo.creport != 1 && vo.rreport == 1}"><span class="reportuser">${vo.room_receiver}</span></c:if>
						<c:if test="${vo.creport != 1 && vo.rreport != 1}">&nbsp;</c:if>
					</li>
				</ul>
			</c:forEach>
			</div>
		</div>	 
		<div class="page_wrap">	
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:pagelist(${pageVO.pageNum-1})"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
	              <c:if test="${p<=pageVO.totalPage}">
	                 <c:if test="${p==pageVO.pageNum }"> <!-- 현재페이지일때 실행 -->
	                    <a class="active">${p}</a>
	                 </c:if>   
	                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
	                    <a href="javascript:pagelist(${p})">${p}</a>
	                 </c:if>
	              </c:if>
	           </c:forEach>
	           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
	              <a class="arrow next" href="javascript:pagelist(${pageVO.pageNum+1})"></a>
	           </c:if>
			</div>
			
		 </div> 
		 <div>
			<form method="get" class="searchFrm" action="csReportChat"> 
				<select name="searchKey">
					<option value="roomcode" selected>채팅방번호</option>
					<option value="creator">생성자</option> 
					<option value="receiver">참여자</option> 
				</select> <input type="text" name="searchWord" id="searchWord" /> 
				<input type="submit" value="검색" />
			</form>
			
		</div>  
	</div>
		<!-- 신고된 채팅 보기 모달창 -->
		
		</div>
		<div id ="chatIframe" class="admingchatiframe">
			<div style="position: relative;">
				<div style="width:500px;">
					<div id="chatTop"></div>
					<div id="chatInfoTitle"><span id="chatHeaderSpan"><span id="sender"></span>님과 <span id="receiver"></span>님의 채팅입니다.</span><span id="closedivBtn">&times;</span></div>
					<iframe src="" id="chatContainer" frameborder="0" ></iframe>
				</div>
				<div class="userinfo" style="float:left;position: absolute;left:500px;top:100px;">
					<span class="senderid">sender</span>님의 정지이력<br/>
					정지 : 총<span id="sendercount">0</span>회<br/>
					정지일 : 총<span id="sendersum">0</span>일
				</div>
				<div class="userinfo" style="float:left;position: absolute;left:500px;top:200px;">
					<span class="receiverid">receiver</span>님의 정지이력<br/>
					정지 : 총<span id="receivercount">0</span>회<br/>
					정지일 : 총<span id="receiversum">0</span>일
				</div>
				<div style="float:left;height:142px;width:200px;background-color:white;position: absolute;left:500px;top:360px;">
					<form style="display:block !important;" action="userstopsubmit" id="userstopform">
					<select name="userid" style="width:200px;" id="useridsel">
						<option disabled selected value="false">정지 할 유저 선택</option>
						<option class="senderid" value=""></option>
						<option class="receiverid" value=""></option>
					</select>
					<input id="stopdateinput" type="text" name="reportdate" style="width:200px;height:52px;text-align:right;padding-right:10px;font-size:17px;" placeholder="정지 일수 입력"/><br/>
					<input type="button" value="정지"class="reportBtn" id="stopreportuserBtn"/><input type="reset" value="닫기" class="reportBtn" id="closeChatdiv"/>
					</form>
				</div>
			</div>
		</div>
</html>
<style>
	.userinfo{
		float:left;
		height:102px;
		width:200px;
		background-color:white;
	}
	#receivercount, #receiversum, #sendersum, #sendercount{
		color:red;
		margin-left:5px;
		margin-right:5px;
	}
</style>