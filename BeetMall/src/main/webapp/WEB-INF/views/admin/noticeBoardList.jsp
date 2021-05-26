<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<style> 
	#topBar h5{  
		padding-left:120px;
	}
	 #container li{ 
		 list-style-type:none; 
		 float:left; 
		 width:20%; 
	 }   
	#contentBox{
	 	top:-90px;
	 }
	#contentBox li:nth-of-type(5n-4){ 
		width:0%; 
	}
	#contentBox li:nth-of-type(4){ 
		width:37%; 
		text-align:left;
	}
	#title{
		font-size:16px;
	}
	#title li:nth-of-type(4){
		padding-left:30px;
	}
	#title li:nth-of-type(8n-1), #contentBox li:nth-of-type(8n-1){  
		width:30%; 
		padding-left:20px; 
	}    
	#topBar li:nth-of-type(2){
		margin-left:22px;
	}  
	#topBar li:nth-of-type(3){
		width:12%;
	} 
	#topBar li:nth-of-type(4){
		width:6%;
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
	#sortBox li:nth-of-type(1), #sortBox li:nth-of-type(5) {
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
		margin-right:125px;
	} 
	#sortBox li:nth-of-type(5),#sortBox li:nth-of-type(6)  {
		width:108px;
	} 
	#sortBox li:nth-of-type(7),#sortBox li:nth-of-type(8) {
		width:4%;
	} 
	#fromTo{
		margin-left:14px;
	}
	#content input, textarea, select, #noticeSearchFrm input{
		border:1px solid lightgray; 
		border-radius: 3px;
	}
	#content li, label{
		list-style-type:none; 
		padding-bottom:10px;
	}
	#content select{
		height:28px;
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
	form{
		display:block !important;
	}
	#addBtn{ 
		left:1500px !important;
	} 
	.page_wrap, .searchFrm{
		position:relative;
		top:-80px;
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
<script>
////////////////////////////////전역변수 선언 /////////////////////////////////

let sortStr = 0;// 정렬 기준을 위한 변수

let startCalendarDataValue = "";//선택된 날짜의 데이터를 저장해 놓는 변수
let endCalendarDataValue = "";//선택된 날짜의 데이터를 저장해 놓는 변수
	 
let startDate =null;// startDate 선택된 값을 가져온다.
let endDate = null;// endDate 선택된 값을 가져온다.
 
let searchTxt =null;// 검색 데이터

 	//체크박스 전체선택
	$(document).on('click',"#checkAll",function(){ 
		$('#contentBox input[type=checkbox]').prop('checked',$('#checkAll').prop('checked'));
	});   
	 
	 //////////////////
	//삭제 확인
	function DeleteCheck(){
		if(confirm("선택한 공지를 삭제하시겠습니까?")){
			location.href="noticeBoardDelA?infonum=${avo.infonum}"
		} 
	};
	$(()=>{
		//선택 삭제 클릭시 
		$("#delBtn").click(()=>{
			$("#delList").submit();
		})
	}); 
		// 공지 대상 선택
		$(document).on('click',"#sort1",function(){	  
			// 선택된 대상 넘버를 변수에 넣어둔다.
			let infotype = $(this).val(); 
		});		
		//정렬 기준 선택	
		$(document).on('click',"#sort2",function(){	  	
			// 선택한 카테고리의 이름을 구한다.
			let selectName = $(this).text(); 
			let resultData = $(result).val();
			
			if(resultData == "전체"){
				sortStr = 0;
				paging(1, 0, mcatenumDataArr, searchTxt, startDate, endDate);
			} else if(resultData == "판매자"){
				sortStr = 1;
				paging(1, 1, mcatenumDataArr, searchTxt, startDate, endDate);
			} else if(resultData == "구매자"){
				sortStr = 2;
				paging(1, 2, mcatenumDataArr, searchTxt, startDate, endDate);
			} 
		});	 
			
		//날짜	
		var date = new Date();
		var today = date.getFullYear()+"/"+addZero(date.getMonth()+1)+"/"+addZero(date.getDate());
		function addZero(value){
			if(value<10){
				return "0"+value;
			}else{
				return value;
			}
		};	 
		function pagelist(pagenum){
			var lin = "noticeBoardList?pageNum="+pagenum;
			location.href=lin;
		}		
			
	//검색어 
	$(document).on('click',"searchBtn",function(){	  
			if($('.searchWord').val()=="" || $('.searchWord').val()==null){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		}); 
</script>
<%@ include file="/inc/top.jspf" %>
	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="noticeBoardList">공지 관리</a></strong></h5></li> 
				<li><button class="success" value="addBtn" name="addBtn" id="addBtn" onClick="location.href='<%=request.getContextPath() %>/noticeBoardWrite'">추가</button></li>
		 	</ul> 
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="sortBox">
			<!-- <form method="get" class="sortFrm" action="<%=request.getContextPath() %>/noticeBoardList">
				<ul>
					<li></li>
					<li></li>
					<li></li>		
					<li></li>		
					<li><select name="sort1" id="sort1"> 
			   				<option value="all" selected>전체</option>
			   				<option value="seller">판매자</option>
			   				<option value="customer">구매자</option>   
				  		</select> 
		   			</li> 
		   			<li><select name="sort2" id="sort2"> 
			   				<option value="infonum" selected>공지 번호</option>
			   				<option value="infotitle">제목</option>        
				  		</select> 
		   			</li> 
					<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
					<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>
			 	</ul>
			 </form> -->
		</div>
   		<div id="contentBox"> 	
		<div id="title">
			<ul>
				<li><input type="checkbox" name="check" id="checkAll"></li>
				<li>공지번호</li>
				<li>대상</li>
				<li>제목</li>
				<li>등록일</li> 
			</ul>
		</div>  
		<form method="post" id="delList" action="multiDel">  
			<c:forEach var="avo" items="${list}">
				<ul class="contentList">
					<li><input type="checkbox" name="check" class="check"></li>
					<li>${avo.infonum}</li>
					<li>
						<c:if test="${avo.infotype==1}">
							구매자
						</c:if>
						<c:if test="${avo.infotype==2}">
							판매자
						</c:if>
						<c:if test="${avo.infotype==3}">
							전체
						</c:if> 
					</li>
					<li class="wordCut"><a href="noticeBoardView?infonum=${avo.infonum}">${avo.infotitle}</a></li>
					<li>${avo.infowritedate}</li> 
				</ul>
			</c:forEach> 
		</form>
		</div>	
		<div class="page_wrap">	
			<div class="page_nation">
			   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
			   		<a class="arrow prev" href="javascript:pagelist(${pageVO.pageNum-1})"></a>
			   </c:if>
			   <!-- 페이지 번호                   1                                    5                     -->
	           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${(pageVO.startPageNum + pageVO.onePageNum)-1}">
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
			<form method="get" class="searchFrm" action="<%=request.getContextPath() %>/noticeBoardList">
				<select name="searchKey">
					<option value="all" selected>전체</option>
					<option value="title" >제목</option>
	   				<option value="num">공지번호</option> 
	   				<option value="type">대상</option> 
	   				<option value="content">공지내용</option> 
				</select>			
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" id="searchBtn" value="검색"/> 
			</form> 
		</div>  
	</div>
</div> 
</html>
<script>
	$(function(){
		$("#sort1").change(function(){
			var params = "type=all";
			$.ajax({
		    	  url: "/sshj/noticeBoardList",
		    	  data: params,
		    	  success:function(result){
					  console.log("성공");
					  alert("result = "+ result)
				  },error:function(e){
					  console.log("가져오기 실패");
				  }		    	  
		      });
		});
	});
</script>