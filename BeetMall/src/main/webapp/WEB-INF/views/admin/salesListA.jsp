<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/inc/top.jspf" %>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<c:set var="now"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></c:set>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<style> 
	/*맨 위 회색 top Bar*/
	
	#topBar h5{  
		padding-left:120px;
	}
	#topBar li{
		width:12%;
	} 
	#topBar li:nth-of-type(2){
		margin-left:108px;
	}  
	
	/*정렬 컨테이너*/
	
	#sortBox {
		margin:40px 0 0 900px;
	}
	#sortBox li{
		margin-top:30px;
	}
	#sortBox li:nth-of-type(1){
		width:108px;
		margin-top:40px;
	}
	#sortBox li:nth-of-type(2){
		width:38px;
	} 
	
	/*내용 전체 정렬*/
	#topBar li:nth-of-type(4){
		width:7%;
	}  
	#topBar li:nth-of-type(7){
		position:relative; left:-80px;
	}    
	#title>ul,.productList{
		position:relative; left:-40px;
	}  
	
	/* 본문 정렬*/
	#container li{ 
		list-style-type:none;
		float:left;
	}  
	#container li:nth-of-type(8){
		width:14%;
	}  
	.productList{
		height:28px;
	}
	.productList:nth-of-type(1){ 
		margin-top:10px;
	} 
	#contentList>ul{
		float:left;
		margin-bottom:0px;
	}
	#contentBox li{
		width:11%;
	} 
	#noticeSearchFrm{
		left:130px;
	}
	
	/*페이징 이미지 링크*/
	
	.page_nation .pprev{
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_pprev.png') no-repeat center center;
		margin-left:0;
	}
	
	.page_nation .prev{
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_prev.png') no-repeat center center;
		margin-right:7px;
	}
	
	.page_nation .next{
		background:#f8f8f8 url('<%=request.getContextPath()%>/img/kpage_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext{
		background:#f8f8f8 url("<%=request.getContextPath()%>/img/kpage_nnext.png") no-repeat center center;
		margin-right:0;
	}
 
	/*주문관리 검색*/
	select, input, .search_num{
		color:gray;
		height:30px;
		border:0.8px solid lightgray;
		width:100px;
		border-radius: 5px;
	}
	.search{
		margin-top:20px;
		height:130px;
		font-size:14px;
	}
	.searchnum, .searchid, #usertype{
		width:180px;
	}
	.search_date, .search_category, .search_sub_category{
		font-size:12px;
		width:125px;
	}
	#usertype{margin-bottom:9px;}
	label{
		font-size:16px;
		margin-bottom:8px;
	}
	.search_wrap>li{
		margin-top:25px;
		float:left;
		width:17%;
	}
	.search_wrap>li:first-child, .search_wrap li:nth-child(2) {
		width:26%;
	}
	.search_wrap>li:last-child{
		width:13%;
	}
	#searchBtns{
		float:center;
	}
	/*주문관리 탭*/
	
	.management_container{
		margin: 10px;
		text-align:center;
	}
	.management_category{
	
		height:44px;
		
	}
	.management_category ul{padding:0;}
	.management_category li{
		padding:0px;
		margin:0;
		float: left;
	    width: 12.5%;
	    height: 42px;
	    
	    background-color: #f8f8f8;
	    border: 1px solid #dfe2e6;
	    border-right: 0;
	    box-sizing: border-box;
	}
	.management_category li.on{
		border-color: #b7bfc8 !important;
	    border-right: 1px solid #b7bfc8;
	    margin-right: -1px;
	    border-bottom: none;
	}
	.management_category li >a {
		display:block;
		height:28px;
		padding-top:12px;
		text-decoration:none;
		font-family: "Nanum Gothic Bold";
   		font-size: 14px;
  		font-weight: bold;
   		text-align: center;
    	color: #6c7580;
	}
	#management_container{
		position:relative;

	}
	#management_container li{
		width:11.7%;
	}
	.menu1{
		padding:18px 0;
	}
	
	/*주문관리 테이블*/
	
	.table_wrap, form{
		text-align:center;
		margin-top:10px;
	}
	table{
		empty-cells: show;
		text-indent: initial;
   		border-spacing: 2px;
   		font-size:13px;
   		border:1px solid lightgray;
   		text-align:center;
   		margin: 0 auto;
	}
	th{
		height:50px;
		text-align:center;	
		font-size:14px;	
	}
	th:first-child{
		width:35px;
	}
	thead{
		border-bottom:2px solid gray;
		background:#EEE;
	}
	tr{
		border-bottom:1px solid lightgray;
	}
	td{
		height:55px;
		padding: 3px;
    	font-size: 12px;
	}
	td:nth-child(4){
		text-align:left;
	}
	.table_checkbox, #listAllCheck{
		width:17px;
	}
	td:last-child{
		width:30px;
	}
	/*배송옵션 & 변경 버튼*/
	.option_change{
		margin-top:5px;
	}
	#option_sel{width:120px;}
	
	table input[type=checkbox]{
		top:0;
	}
	
/*주문상세 테이블 modal*/ 
 .detail_modal{display:none;}   
 .detail_modal{width:50%;}
	.detail_table{
		width:100%;
		font-size:12px;
	}

	.detail_table td{
		width:20%;
		height:30px;
		padding:10px;
		border-left:1px solid lightgray;
		
	}
	.detail_table th{
		font-size:15px;
		font-weight:bold;
		height:30px;
	}
	
	.detail_menu{
		font-weight: bold;
	}
	/*닫기버튼*/
	
	#close{
		font-weight:bold;
		font-size:16px;
		width:50px;
		float:right;
	}
	fieldset{width:100%;}
	.management_table>td a{ color: black;}
	.search_btn, .save_excel{
		width:85.7px;
		height:30px;
		margin-bottom:10px;
		color: #666666;
		border-radius: 8px;
		background:#fff;
		box-shadow: 0 0px 3px 0 rgba(0,0,0,0.5);
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		border:none;
	}
	#searchBox{
		position:relative;
		left:-35px;
		top:-20px;
	}
	#searchBox label{
		background-color:white;
		height:30px;
		font-size:16px;
		color:black;  
	}
	#searchBox li{
		margin-right:10px;
	}
	#searchBox li:nth-of-type(1), #searchBox li:nth-of-type(2){
		width:270px;
	} 
	#searchBox li:nth-of-type(2){
		margin-right:15px;
	}
	#searchBox li:nth-of-type(3){
		width:200px;
	}
	#searchBox li:nth-of-type(4)>label{
		padding-left:40px;
	}
	#searchBox li:nth-of-type(4)>input{
		position:relative; 
	}
	#searchBox input[type=text]{
		width:180px;
		padding-left:10px;
	}
	#flexType{
		display:flex;
	}
	#searchBtns{
		position:relative;
		left:30px;
		top:12px;
	}
	#searchBtn{
		margin-top:5px;
		width:86px;
	}
	
	/*데이터 테이블*/
	
	table{
		width:1070px;
		position:relative;

	}
	#tblHead>th{
		 text-align:center;
	}
	input[type=checkbox]{
		background-color:lightgray; 
		top:0px;	
	}
	a:link{
		text-decoration:none;
		color:black;
	}
	a:hover, a:active, a:visited{
		color:blue; 
	}
	#chooseId{
		width:180px;
		margin:10px 0 20px 0;	
	}
	.option_change button{
		border:1px solid lightgray;
		border-radius:5px;
	}
</style>
<script>
//탭
$( function() {
    $( "#tabs" ).tabs();
  } );
  
//체크박스 전체선택
$(function(){
	$('#listAllCheck').click(function(){
		$('.management_table input[type=checkbox]').prop('checked',$('#listAllCheck').prop('checked'));
	});
});
//체크박스 값 보내기
function selectOrderStatusUpdate(){
	var url = "orderStatusUpdate";
	var orderNumArr = new Array();
	var orderStatus = $('#option_sel').val(); //select한 주문정보	
	var list = $('input[name=oneOrderCheck]'); //listAllCheck, oneOrderCheck
	console.log('check num->', $('#oneOrderCheck').val());
	console.log('list.length->', list.length);
	console.log('list->',list);
	console.log('option select->',$('#option_sel').val());
	for(var i = 0; i < list.length; i++){
		if(list[i].checked){
			console.log('list[i].value->', list[i].value);
			orderNumArr.push(list[i].value);
			console.log('orderNumArr->',orderNumArr);
		} //if end
	}// for end
	if(orderNumArr.length==0){
		alert('선택된 주문번호가 없습니다.');
	}else{
		var msg = confirm('주문상태를 변경하시겠습니까?');
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data:{
				orderNumArr : orderNumArr,
				orderStatus : orderStatus
			},
			success : function(){
				alert('주문상태가 변경되었습니다.');
				location.replace('order_management');
			}, error : function(){
				alert('주문상태 변경이 취소되었습니다.');
			}
		}); //ajax end
	}
}// function end

//모달
function modal(id) {
	console.log('oneOrderCheck text ->',$('#oneOrderCheck').text());
	console.log('oneOrderCheck value ->',$('#oneOrderCheck').val());
	console.log('oneOrderCheck text ->',$('#orderNumSetTd').text());
	console.log('oneOrderCheck value ->',$('#orderNumSetTd').val());
	modalAjax();

    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 회색 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 회색 레이어 색 
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    console.log('what the...');
    $('#my_modal').css('display','block');
    $('#my_modal').children('table').css('display','');
    $("body").off('scroll touchmove mousewheel'); 
    
    $('#my_modal').css({
        position: 'fixed',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1)',

        // 회색 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    })
    .show()
    // 닫기 버튼 처리, 회색 레이어와 모달 div 지우기
    .find('.modal_close_btn')
    .on('click', function() {
        bg.remove();
        $('#my_modal').css('display','none');
    });
}

$('#popup_open_btn').on('click', function() {
    // 모달창 띄우기
    modal('my_modal');
    console.log('modaldmoadfa');
    $('my_modal').css('display','');
   /*  $("body").off('scroll touchmove mousewheel');  */    
});
//검색
//검색어 확인
$(function(){
	$("#searchForm").submit(function(){
		//searchWord있는지 없는지 찾기 , 있을때만 데이터 넘기기
		if($('#searchWord').val()=="" || $('#searchWord').val()==null){
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	});
});
$(document).ready(function(){
	$('management_category li').click(function(){
		var tab_id = $(this).attr('data-tab');
		$('management_category li').removeClass('current');
		$('.menu').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		});

});

//1. 카테고리 변경
$(function(){
	
	var dried_fruits = ['감말랭이', '건망고','건바나나','건자두', '건포도', '곶감', '기타건과류'];
	var nut = ['대추','땅콩','마카다미아','밤','아몬드','은행','잣','캐슈너트','피스타치오','피칸','해바라기씨','호두','호박씨','기타견과류'];
	var fruits = ['감', '감귤', '과일바구니','딸기','레몬','리치','망고','매실','바나나','배','복분자','복숭아','블루베리','사과','석류','수박','아보카도','오렌지','자두', '자몽','참외','천혜향 ','체리','키위/참다래', '토마토', '파인애플','포도','한라봉','혼합과일세트', '기타과일'];
	var rice = ['기능성쌀','백미','찹쌀', '현미', '흑미'];
	var multigrain = ['기장','기타잡곡','녹두','들깨','메밀','보리','수수','옥수수','율무','참깨','콩','팥','혼합곡'];
	var vegetable =['감자','건나물','고구마','고추','기타채소류','단호박','당근','대파','더덕','도라지','마','마늘','무','배추','버섯','부추','브로콜리','산나물','삶은나물','상추','새싹채소','생강','시금치','쌈채소','아스파라거스','알로에','애호박','양배추','양파','연근','열무','오이','우엉','죽순','쪽파','피망/파프리카'];
	 
	$('.search_category').change(function(){
		var option=$(this).val();
		console.log(option);
		//견과류
		if(option=='nut'){
			for(var i=0; i<nut.length; i++){
				var tag; 
				tag = "<option value='"+nut[i]+"'>"+nut[i]+"</option>"
				$('.search_sub_category').append(tag);
			} //for end
		//건과류	
		}else if(option=='dried_fruits'){
			for(var i=0; i<dried_fruits.length; i++){
				var tag; 
				tag = "<option value='"+dried_fruits[i]+"'>"+dried_fruits[i]+"</option>"
				$('.search_sub_category').append(tag);
			}//for end
		}else if(option=='fruits'){
			for(var i=0; i<fruits.length; i++){
				var tag; 
				tag = "<option value='"+fruits[i]+"'>"+fruits[i]+"</option>"
				$('.search_sub_category').append(tag);
			}//for end
		}else if(option=='rice'){
			for(var i=0; i<rice.length; i++){
				var tag; 
				tag = "<option value='"+rice[i]+"'>"+rice[i]+"</option>"
				$('.search_sub_category').append(tag);
			}//for end
		}else if(option=='multigrain'){
			for(var i=0; i<multigrain.length; i++){
				var tag; 
				tag = "<option value='"+multigrain[i]+"'>"+multigrain[i]+"</option>"
				$('.search_sub_category').append(tag);
			}//for end
		}else if(option=='vegetable'){
			for(var i=0; i<dried_fruits.length; i++){
				var tag; 
				tag = "<option value='"+vegetable[i]+"'>"+vegetable[i]+"</option>"
				$('.search_sub_category').append(tag);
			}//for end
		}//if else end
	});
});

//Ajax 
$(function(){

});
function modalAjax(){
	console.log('oneOrderCheck text ->',$('#oneOrderCheck').text());
	console.log('oneOrderCheck value ->',$('#oneOrderCheck').val());
	var ordernum = $('#oneOrderCheck').val();
	var url = window.location.href;
	var tag;
	$.ajax({
		url:url,
		type:'post',
		data:{
			ordernum:ordernum
		},
		success : function(data){
			console.log('success ajax');
			console.log('ajax ordernum->',ordernum);
			tag = '<span>'+ordernum+'<span>' ;
			$('#orderNumSetTd').html(tag);
		}, error: function(e){
			console.log('ajax error -->' + e.status);
		}
	});
	
}
</script>

	<div id="topBarContainer">
		<div id="topBar">
			<ul>
				<li><h5><strong><a href="salesListA">판매 내역</a></strong></h5></li> 
			</ul> 
		</div>  
		</div>
<div id="body1">
<%@ include file="/inc/leftBar.jspf" %>
	<div id="container">
		<div id="sortBox">
			<ul>
				<li><select name="sort" > 
				<option value="정렬하기" selected>정렬하기</option>  
						<option value="구매번호" >구매번호</option>  
		   				<option value="주문현황">주문현황</option>   
		   				<option value="배송현황">배송현황</option>   
		   				<option value="상품명">상품명</option>   
		   				<option value="아이디">주문자 아이디</option>
		   				<option value="법인명">법인명</option>
		   				<option value="구매일">구매일</option>         
		   			 </select>
	   			</li> 
	   			<li><button class="success" value="asc" name="asc" id="ascBtn">▲</button></li>
				<li><button class="success" value="desc" name="desc" id="descBtn">▼</button></li>  
			 </ul>
   		</div> 
   	
   <div id="contentBox"> 	
		  <!-- 상단 검색 옵션 : 접수일/ 카테고리/ 주문번호/ 고객ID/ 검색 -->
		<form id="searchBox">
		<div class="search">
			<ul class="search_wrap">
				<li><label for="">주문접수일</label><br/>
						<div class="flexType">
							<input type="date" name="" class="search_date" max="${now}" /> ~ <input type="date" name="" class="search_date" max="${now}" />
						</div></li>
				<li><label for="">카테고리</label><br/>
					<div class="flexType">
						<select class="search_category">
							<option value="choose">대분류 선택</option>
							<option value="nut">견과류</option>
							<option value="dried_fruits">건과류</option>
							<option value="fruits">과일</option>
							<option value="rice">쌀</option>
							<option value="multigrain">잡곡/혼합곡</option>
							<option value="vegetable">채소</option> 
						</select>
						<!-- 중뷴류 카테고리 선택 -->
						<!-- 건과류 -->
						<select class="search_sub_category">
							<option>중분류 선택</option>
					
						</select>
						<!-- 견과류 -->
						<!-- 과일 -->
						<!-- 쌀 -->
						<!-- 잡곡/혼합곡 -->
						<!-- 채소 -->
					</div>
				</li>
				<li><label for="">주문번호</label><br/>
					<input type="text" size="15" name="searchnum" class="searchnum" placeholder="주문번호를 입력해주세요."/>
				</li>
				<li>
					<select id="usertype" name="usertype">
						<option value="1">구매자 아이디</option>
						<option value="2">판매자 아이디</option>
					</select>
					<input type="text" size="15" name="searchid" class="searchid" placeholder="ID를 입력해주세요."/>
				</li>
				<li style="margin-top:10px;">
					<div id="searchBtns">
						<input type="button" name="" class="save_excel" value="엑셀로 저장" onclick="save_excel()"/>
						<input type="submit" name="" class="search_btn" value="검색" id="searchBtn"/><br/>				
					</div>
				</li>
			</ul>
		
		</div>
		</form>
	</div>	<!-- content box end -->
		<!-- 탭 : 전체/ 미입금/ 입금완료/ 배송준비/ 배송중/ 배송완료/ 픽업대기중/ 픽업완료 -->
		<div class="management_container" id="management_container">
				<ul class="management_category">
				<li class="menu1 on"><a href="#tabs-1"><span>전체</span></a></li>
				<li class="menu2"><a href="#tabs-2"><span>취소요청</span></a>
				<li class="menu3"><a href="#tabs-3"><span>취소진행중</span></a>
				<li class="menu4"><a href="#tabs-4"><span>취소완료</span></a>
				<li class="menu5"><a href="#tabs-5"><span>반품요청</span></a>
				<li class="menu6"><a href="#tabs-6"><span>반품진행중</span></a>
				<li class="menu7"><a href="#tabs-7"><span>반품완료</span></a>
				<li class="menu8"><a href="#tabs-8"><span>구매확정</span></a>
			</ul>
		</div>
	<fieldset>
		<!--테이블-->
		<div class="table_wrap">
					<table class="management_table" id="tabs-1">
							<thead>
								<tr id="tblHead">
									<th>주문번호</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>수량</th>
									<th>주문일</th>
									<th>주문자명/ID</th>
									<th>주문자연락처</th>
									<th>법인명</th>
									<th>판매자ID</th>
									<th>결제금액</th>
									<th>주문현황</th>
									<th>클레임현황</th>
									<th><input type="checkbox" checked id="listAllCheck"/></th>
								</tr>
							</thead>
						<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
								<td id="orderNumTd"><a href="javascript:modal()"><span id="orderNumGet">${list.ordernum}</span></a></td><!-- id="popup_open_btn" -->
								<td>${list.productnum}</td>
								<td>${list.productname}</td>
								<td>${list.orderquantity}</td>
								<td>${list.orderdate}</td>
								<td>${list.userid}<span>/</span>${list.username}</td>
								<td>${list.userphone}</td>
								<td>${list.storename }</td>
								<td>${list.sellerid }</td>
								<td><span>${list.orderprice}</span>원 </td>
								<td><span>${list.orderstatus}</span></td>
							
								<td><span>${list.claimstatus}</span></td>
								<td><input type="checkbox" checked title="${list.ordernum}" value="${list.ordernum}" id="oneOrderCheck" name="oneOrderCheck" class="table_checkbox"/></td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>	
				
				<!-- table wrap end -->	
			</div>
			<!-- tabs end -->
				<!-- option change -->
				<div class="option_change"style="text-align:right; padding-right:30px;">
					<select id="option_sel">
						<option>-</option>
						<option>배송준비중</option>
						<option>배송중</option>
						<option>배송완료</option>
						<option>픽업대기중</option>
						<option>픽업완료</option>
					</select>
					<button class="success" value="" name="" id="">변경</button>
				</div> 
				<!-- option change end -->
		

		<!-- 페이징 자리 -->
		<div class="page_wrap">
			<div class="page_nation">
			  	<!--맨앞으로-->
  				<a class="arrow_pprev" href="salesListA?pageNum=1<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--앞으로-->
        		<a class="arrow_prev" href="salesListA?pageNum=${sapvo.pageNum-1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
 				<!--레코드 갯수에 따른 페이지 갯수 표시--> 
         		<c:forEach var="p" begin="${sapvo.startPageNum}" end="${(sapvo.startPageNum + sapvo.onePageNum)-1}">
	         		<!--p가 총페이지수보다 작거나같을때  레코드가 있는 페이지까지만 표시 -->
	            	<c:if test="${p<=sapvo.totalPage}">  
						<!--현재페이지 :  현재보고있는 페이지 표시 -->
		               <c:if test="${p==sapvo.pageNum}">
		                  <a class="on" href="salesListA?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
		               <!-- 현재페이지가 아닐 때 -->
		               <c:if test="${p!=sapvo.pageNum}">
		                  <a href="salesListA?pageNum=${p}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>">${p}</a>
		               </c:if>
	            	</c:if>
        		</c:forEach>
        		<!-- 다음 페이지가 있을 때 -->
				<!--뒤로-->            
	         	<a class="arrow next" href="salesListA?pageNum=${sapvo.pageNum+1}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
				<!--맨뒤로-->
	         	<a class="arrow nnext" href="salesListA?pageNum=${sapvo.totalPage}<c:if test="${sapvo.searchWord != null && sapvo.searchWord != ''}">&searchKey=${sapvo.searchKey}&searchWord=${sapvo.searchWord}</c:if>"></a>
			</div>
		 </div>
		 <!-- 페이징 자리 --> 
	</fieldset>	
</div> <!-- container end -->
</div><!-- body1 end -->
	<!------------------ 주문 상세정보 modal ------------------------>
		<div class="detail_modal" id="my_modal">
		<input type="hidden" value="${oneList.ordernum}" id="hiddenOrderNum" name="ordernum">
			<table  class="detail_table" style="background:white" >
				<thead class="detail_head1">
					<tr>
						<th id="close_th" colspan="4"><a class="modal_close_btn"><span id="close">닫기</span></a></th>
					</tr>
					<tr>
						<th colspan="2">주문</th>
						<th colspan="2">정보</th>
					</tr>
				</thead>
				<tbody>
					<tr class="detail_line1">
						<td><span class="detail_menu">주문번호</span></td>
						<td id="orderNumSetTd">${oneList.ordernum}</td>
						<td><span class="detail_menu">주문일</span></td>
						<td>${oneList.orderdate}</td>
					</tr>
					<tr class="detail_line2">
						<td><span class="detail_menu">주문상품명</span></td>
						<td>${oneList.productname}</td>
						<td><span class="detail_menu">결제일</span></td>
						<td>${orderList.orderdate}</td>
					</tr>
					<tr class="detail_line3">
						<td><span class="detail_menu">수량</span></td>
						<td>${oneList.orderquantity}</td>
						<td><span class="detail_menu">결제금액</span></td>
						<td>${oneList.orderprice}<span class="won">원</span></td>
					</tr>
					<tr class="detail_line4">
						<td><span class="detail_menu">옵션</span></td><!-- 구매한 옵션의 수량은 어떻게 구하죠? -->
						<td>${oneList.optionname}<span></span>${v.optionprice}</td>
						<td><span class="detail_menu">포인트 사용</span></td>
						<td>${oneList.usedpoint}<span class="point">.P</span></td>
					</tr>
					<tr class="detail_line5">
						<td><span class="detail_menu">결제방법</span></td>
						<td><span>${oneList.paymentoption}</span></td>
						<td><span class="detail_menu">할인금액</span></td>
						<td>${oneList.saleprice}<span class="won">원</span></td>
					</tr>
					<tr class="detail_line6">
						<td><span class="detail_menu">상품실결제금액</span></td>
						<td>${oneList.realpayment}<span class="won">원</span></td>
						<td><span class="detail_menu">배송비포함실결제금액</span></td>
						<td>${oneList.realtotalpayment}<span class="won">원</span></td>
					</tr>
			
				</tbody>
				<thead class="detail_head2">
					<tr>
						<th colspan="2">배송</th>
						<th colspan="2">정보</th>
					</tr>
				</thead>
				<tbody>
					<tr class="detail_line7">
						<td><span class="detail_menu">받는분</span></td>
						<td>${oneList.receiver}</td>
						<td><span class="detail_menu">받는분 연락처</span></td>
						<td>${oneList.receiverphone}</td>
					</tr>
					<tr class="detail_line8">
						<td><span class="detail_menu">배송지</span></td>
						<td>(${oneList.deliveryzipcode}) ${oneList.deliveryaddr}, ${oneList.deliverydetailaddr}</td>
						<td><span class="detail_menu">베송 메모</span></td>
						<td>${oneList.deliverymemo}</td>
					</tr>
					<tr class="detail_line10">
						<td><span class="detail_menu">주문자명</span></td>
						<td>${oneList.username}</td>
						<td><span class="detail_menu">주문자 연락처</span></td>
						<td>${oneList.userphone}</td>
					</tr>
					<tr class="detail_line11">
						<td><span class="detail_menu">주문자 ID</span></td>
						<td>${oneList.userid}</td>
						<td><span class="detail_menu">택배사</span></td>
						<td>${oneList.deliverycompany}</td>
					</tr>
					<tr class="detail_line12">
						<td><span class="detail_menu">송장번호</span></td>
						<td>${oneList.invoice}</td>
						<td><span class="detail_menu">배송비</span></td>
						<td>${oneList.deliveryprice}</td>
					</tr>
	
				</tbody>
				<thead class="detail_head3">
					<tr>
						<th colspan="2">배송정보</th>
						<th colspan="2">히스토리</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td colspan="2">${oneList.deliverystatus}</td>
						<td colspan="2">${oneList.deliverydate}</td>		
					</tr>
					
				
				</tbody>
				
			</table>	
		</div>
	<!-- 모달 -->
		<div id="modal" > </div>
	<!-- 주문 상세정보 modal end-->