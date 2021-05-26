<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/sshj_admin_2.css" type="text/css">
<style>
#topBar>h5 {
	padding-left: 240px;
	width: 600px !important;
}

#container {
	left: 170px !important;
}

#contentBox {
	height: 1680px;
	top: 30px;
}

#infoBox {
	top: -350px !important;
}

#infoBox li {
	padding-top: 22px !important;
}

#infoHeader {
	padding-top: 13px;
}

#infoHeader li {
	padding-top: 25px !important;
}

#infoHeader li:last-child {
	padding-top: 27px !important;
}

#info li:last-child {
	padding-top: 18px !important;
}

#info {
	top: -325px;
	left: -250px;
}

#info li:nth-of-type(5) {
	padding-left: 460px;
}

#companyBox li {
	padding-top: 10px;
}

#companyBox li:nth-of-type(5){
	padding-top: 15px;
}

#company>li {
	padding-bottom: 0;
}
#company li:nth-of-type(5){
	padding-top: 20px;
}
#company div {
	height: 28px;
}

#info div {
	height: 24px;
}

#info div:nth-of-type(5) {
	padding-left: 390px;
}


/*좌하 신고 정보*/
#reportBox {
	top: -470px !important;
	height: 120px;
	left: 0;
}

#reportTitle {
	position: relative;
	top: 0;
	left: 0;
	width: 500px;
}

#reportHeader {
	display: flex;
	left: -70px;
	margin-left: 100px !important;
}

#reportHeader>li:nth-of-type(2) {
	left: 100px;
}

#report {
	top: -45px;
	left: 100px;
}

#infoBtns {
	top: -300px !important;
}

#reportBox button {
	top: -115px;
	left: 370px;
}

#sellerEdit {
	box-shadow: 4px 6px 15px -7px #C4C4C4;
	position: relative;
	top: -320px;
	border-radius: 10px;
	height: 900px;
}

#farmInfo>h5 {
	margin: 5px 0 0 10px;
}


hr {
	border-color: dimgray !important;
}


#profile_box{
	width: 100%;
	text-align: center;
	padding: 40px 0;
	background-color: #fff;
	border-top: 1px solid #aaa;
}

#farmname{
	font-size: 12px;
	margin: 10px;
}

#profileData{
	font-size: 10px;
	color: gray;
	
}

#profile_box img{
	width: 100px;
	height: 110px;
	margin: 10px auto 0 auto;
}

/* 농장 소개 */
#info_container{
	padding: 0 100px;
	margin: 0 important;
}
#profile_box{
	width: 90%;
}
#farm_info>div,#farm_contact>div:nth-child(1),#farm_repMenu>div:nth-child(2){
	width: 150px;
	font-size: 20px;
	font-family: 나눔고딕;
	font-weight: bold;
}

#farm_info{
	margin-bottom: 20px;
	width: 90%;
}

#farm_contact{
	width: 90%;
}
#farm_info textarea{
	width: 80%;
	height: 100px;
}

#farm_info,#farm_contact,#farm_repMenu{
	display: flex;
}
#contact_content{
	width: 80%;
	border: 1px solid #ddd;
	padding: 10px;
}
#contact_content>b{
	font-size: 20px;
}

#contact_content div{
	overflow: auto;
	margin-top: 5px;
}
#contact_content span{
	width: 130px;
	float: left;
}
#contact_content p{
	float: left;
	margin: 0;
	font-weight: bold;
}

#popup{
	width: 600px;
	height: 500px;
	position: absolute;
	margin: 0 auto;
	top: 0;
	left: 0;
	display: none;
	background-color:white;
}
#popup hr{
background-color: white;}
#popupDiv{
	width:100%;
	background-color:white;
	text-align:center;
}

.success{
	margin: 5px !important;
}
#popupDiv{}

#modal{
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	opacity: 0.5;
	background-color:black;
	display:none;
	margin: 0;
	border: none;
	z-index: 0;
	
	
}

/* 대표 메뉴 */
#MenuEditBtn{
	font-size: 14px;
	font-weight: normal;
	width: 110px;
	background-color: #bbb;
	color:#fff;
	border: 0;
	border-radius: 5px;
	overflow:hidden;
	padding:5px 10px;
}

#repMenu_content{
	width: 90%;
	display: flex;
	border: 1px solid #ddd;
	overflow: hidden;
}
#repMenu_content img{
	width: 150px;
	height: 150px;
	float: left;
}

#repMenu_content>div{
	display:flex;
	flex-direction: column;
	justify-content: space-around;
}

#repMenu_content>div>div:nth-child(1){
	display:flex;
	font-size: 30px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	margin: 10px;
}

#repMenu_content>div>div:nth-child(2){
	margin: 0 10px;
	font-weight: bold;
}

#repMenu_content>div>div:nth-child(2)>div:nth-child(1){
	height: 30px;
	line-height: 24px;
	display:flex;
}

#repMenu_content>div>div:nth-child(2)>div:nth-child(1)>div:nth-child(1){
	height: 30px;
	color: red;
	font-size: 12px;
	line-height: 30px;
}
#repMenu_content>div>div:nth-child(2)>div:nth-child(1)>div:nth-child(2){
	font-size: 16px;
	margin-left: 10px;
}
#repMenu_content>div>div:nth-child(2)>div:nth-child(2){
	color: gray;
	font-size:12px;
	text-decoration: line-through;
}



</style>
<script>

function selectImg(e){
	$('#farmprofile').click();
}

function check(e){
	const fileSize = e.files[0].size;
	const extensionCheck = $(e).val().split('.');
	const maxSize = 4 * 1024 * 1024 ; // 4 MB 최대용량
	const extentionArr = ['png','jpg','jpeg','gif','JPG','JPEG','PNG','GIF'];
	
	// 파일 사이즈 확인 4mb 제한
	if(fileSize > maxSize){
		alert('업로드 파일 최대 용량은 4MB이하 입니다.');
		$('#farmprofile').val('');
		return false;
	}
	
	// 확장자 확인 , 이미 걸렀지만 호오오옥시나 또 건드는 사람 있을경우.....
	for(let i = 0; extentionArr.length; i++){
		console.log(extentionArr[i]);
		console.log(extensionCheck[1]);
		if(extentionArr[i] == extensionCheck[1]){
			break;
		}
		
		if(extentionArr.length-1 == i){
			alert('업로드 파일의 확장자는 jpg, jpeg, gif, png 종류만이 가능합니다.')
			$('#farmprofile').val('');
			return false;
		}
	}
	
	
	// 미리보기
	const reader = new FileReader();
	
	reader.onload = (e) => {
		$('#nowImg').attr('src',e.target.result);
	}
	reader.readAsDataURL(e.files[0]);
}




///// 

function emailCheckSeller(){
	// 판매자 이메일 검사
	var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
	if($("#storeemail").val()==null||$("#storeemail").val()==''){
		alert("이메일을 입력하세요")
		return false;
	}else if(!emailreg.test(document.getElementById("storeemail").value)){
		alert("이메일이 잘못 입력되었습니다.");
		return false;			
	}
}


$(()=>{
	// 판매자 이메일 인증코드 전송
	$("#storeemailBtn").click(function(){
		console.log('눌렸나요');
		if(emailCheckSeller()!=false){
			var url = 'emailSendSeller';
			var param = "SendToEmail="+$("#storeemail").val();
			$.ajax({
				url : url,
				data : param,
				success :function(data){
					alert("인증코드 전송에 성공했습니다. 이메일을 확인해주세요!");
				}, error : function(){
					alert("인증코드 전송에 실패하였습니다 잠시후 다시 시도해주세요");
				}
			})
			
		}
	})
	
	// 판매자 이메일 인증코드 확인
	$("#storeemailCheckBtn").click(function(){
		if($("#storeemailCheck").val()!=null || $("#storeemailCheck").val()!=''){
			var url = 'emailCheckSeller';
			var param = "emailCode="+$("#storeemailCheck").val();
			$.ajax({
				url : url,
				data : param,
				success : function(data){
					console.log(data);
					if(data == 1){
						alert("인증에 성공하였습니다.");							
						$("#checkEmailSellerResult").val('Y');
						$("#storeemailCheck").attr("readonly",true);
					}else{
						alert("인증코드가 일치하지 않거나 인증에 실패하였습니다.");
					}
				}, error : function(){
					alert("인증에 실패하였습니다.");
				}
			});
		}
	})
	
	
	$("#sellerzipSearch").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            $("#storezipcode").val(data.zonecode);
	            $("#storeaddr").val(data.address);
	            document.getElementById('storedetailaddr').focus();
	        }
	    }).open();
	})
})

//수정하기 누르면 업데이트
function editCheck(){
let test = '한글자';
let eng = 'test';
// 이메일 검사
var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
// 이름 검사
var namereg = /^[가-힣]{2,4}$/;
// 계좌번호 검사
var accountreg = /^[0-9]{11,15}$/;



console.log(test.charCodeAt(0));
console.log(eng.charCodeAt(0));
if( $('#sellername').val() == null || $('#sellername').val() == '' ){
	alert('대표자 이름을 입력해주세요');
	return false;
} else if ( $('#storename').val() == null || $('#storename').val() == '' ){
	alert('상호명을 입력해주세요');
	return false;
} else if ( $('#bankname').val() == null || $('#bankname').val() == '' ){
	alert('예금주를 입력해주세요');
	return false;
} else if ( $('#bankaccount').val() == null || $('#bankaccount').val() == '' ){
	alert('계좌번호를 입력해주세요');
	return false;
} else if ( $('#storeemail').val() == null || $('#storeemail').val() == '' ){
	alert('이메일을 입력해주세요')
	return false;
} else if ( $('#bank').val() == null || $('#bank').val() == '' ){
	alert('은행을 선택해주세요');
	return false;
}

if( !namereg.test($('#sellername').val()) ){ // 대표자 검사
	alert("이름은 2~4글자만 가능합니다.");
} else if($('#storename').val().length > 30){ // storename이 30자 이상이면 막는다.
	alert('상호명은 30자 이하여야 합니다');
	return false;
} else if( !namereg.test($('#bankname').val()) ){ // 예금주 검사
	alert('이름은 4글자 이하여야 합니다')
	return false;
} else if( !accountreg.test(parseInt($('#bankaccount').val(),10))){ // 계좌번호 검사
	alert('올바른 계좌번호를 입력해주세요')
	return false;
} else if( !emailreg.test( $('#storeemail').val()) ){ // 이메일 검사
	alert('올바른 이메일을 입력해주세요')
	return false;
}

$('#updateFrm').submit();
}

//대표메뉴 수정 누르면 window open 되는 함수
function menuEditOpen(){
window.name = "농장수정";

window.open("sellerEditFarmListView?admin=${sellerData.userid }", "대표메뉴 선택창", "width=1300, height=600, resizable = no, scrollbars = no");
}

//대표메뉴 선택시 이미지 변경하는 함수
function imgChange(data){
console.log('test');
console.log(data);
$('#repMenu_content>img').attr('src',data);
}


/////////////////////////////////////////////// 팝업///////////////////////
//팝업창 만들기! 
function popupOpen(data){
	<!-- 사업자 등록증 모달창 -->
		
	let tag = '<div id="modalHeader">사업자 등록증</div>';
		tag += '<img src="<%=request.getContextPath()%>/resources/sellerregiimgs/${sellerData.sellerregiimg}" style="width: 100%; height: 100%;">';
		tag += '<div id="popupDiv">';
		tag += '<button class="success" onclick="javascript:regiaUpdate(1)" >인증 확인</button>';
		tag += '<button class="success" onclick="javascript:regiaUpdate(2)" >반려</button>';
		tag += '<button class="success" onclick="javascript:popupClose()">취소</button>';
		tag += '</div>';
	
	$('#popup').html(tag);
	
	let windowWidth = $(window).scrollLeft();
	let windowWidth2 = window.innerWidth;
	let windowHeight = $(window).scrollTop() + (window.innerHeight/2) - 300;
	console.log(windowWidth2);
	console.log(windowWidth);
	console.log(windowHeight);
	$('body').css('overflow','hidden');
	$('#modal').css('display','block').css('top', $(window).scrollTop() +"px").css('left',windowWidth+'px');
	$('#popup').css('display','block').css('top', windowHeight+'px').css('left', windowWidth2/2-250+'px');
	
}

//팝업창 닫기
function popupClose(){
	$('body').css('overflow','auto');
	$('#modal').css('display','none');
	$('#popup').css('display','none');
}

function regiaUpdate(num){
	console.log(num);
	$.ajax({
		type:'GET',
		url: "AdminSellerRegiaUpdate",
		data: {
			num : num
		},
		success: function(result){
			if(result == 1){
				alert('업데이트에 성공하였습니다.')
				popupClose();
			} else{
				alert('업데이트에 실패하였습니다.');
			}
		}, error: function(){
			console.log('업데이트 실패....');
		}
		
		
		
	})
}

function reportPageMove(){
	location.href="csreportListA?pageNum=1&searchKey=reporteduser&searchWord=${sellerData.userid }";
}

function productListPageMove(){
	location.href="productListA?pageNum=1&searchKey=b.sellername&searchWord=${sellerData.username }";
	
}

function backPage(){
	window.history.back();
}

function editPage(){
	location.href="boardCustomerInfoEdit?userid=${sellerData.userid}&prevPageNum=1"
}
</script>
<%@ include file="/inc/top.jspf"%>
<div id="topBarContainer">
	<div id="topBar">
		<h5>
			<strong><a href="sellerInfoEditA">판매자 정보 수정</a></strong>
		</h5>
	</div>
</div>
<div id="body1">
	<%@ include file="/inc/leftBar.jspf"%>
	<div id="container">
		<div id="contentBox">
			<div id="companyBox">
				<div id="companyTitle">
					<p>사업자 정보</p>
				</div>
				<ul id="companyHeader">
					<li>법인명</li>
					<li>대표자</li>
					<li>사업자 등록번호</li>
					<li>계좌정보</li>
					<li>사업장 소재지</li>
					<li>사업자 인증</li>
				</ul>
				<ul id="company" style="padding-top: 5px;">
					<li><div>${sellerData.storename }</div></li>
					<li><div>${sellerData.sellername }</div></li>
					<li><div>${sellerData.sellerreginum }</div></li>
					<li><div>${sellerData.bank }&nbsp;${sellerData.bankaccount }</div></li>
					<li><div>${sellerData.storeaddr }&nbsp;${sellerData.storedetailaddr }</div></li>
					<li><div>
							<c:choose>
								<c:when test="${sellerData.regiapproval == '0 '}">미신청</c:when>
								<c:when test="${sellerData.regiapproval == '1 '}">대기중</c:when>
								<c:when test="${sellerData.regiapproval == '2 '}">완료</c:when>
								<c:when test="${sellerData.regiapproval == '3 '}">반려</c:when>
							</c:choose>
						</div>
						<button class="success" onclick="javascript:popupOpen(this)">보기</button></li>
				</ul>
			</div>
			<div id="infoBox">
				<div id="infoTitle">
					<p>개인 정보</p>
				</div>
				<ul id="infoHeader">
					<li>이름</li>
					<li>아이디</li>
					<li>생년월일</li>
					<li>연락처</li>
					<li>이메일</li>
					<li>주소</li>
					<li>가입일</li>
				</ul>
				<ul id="info">
					<li><div>${sellerData.username }</div></li>
					<li><div>${sellerData.userid }</div></li>
					<li><div>${sellerData.birthday }</div></li>
					<li><div>${sellerData.userphone }</div></li>
					<li><div>${sellerData.useremail }</div></li>
					<li><div>${sellerData.useraddr }&nbsp;${sellerData.userdetailaddr }</div></li>
					<li><div>${sellerData.joindate }</div></li>
				</ul>
				<div id="infoBtns">
					<button class="success" onclick="javascript:backPage()">뒤로</button>
					<button class="success" onclick="javascript:productListPageMove()">판매 상품 보기</button>
					<button class="success" onclick="javascript:editPage()">수정</button>
				</div>
			</div>
			<div id="reportBox">
				<div id="reportTitle">
					<p>신고 정보</p>
				</div>
				<ul id="reportHeader">
					<li>신고 횟수</li>
					<li>총 정지 일</li>
				</ul>
				<ul id="report">
					<li><div id="reportNum">
							<c:if test="${reportData.reportcount != null}">
		 					${reportData.reportcount }
		 				</c:if>
							<c:if test="${reportData.reportcount == null}">
		 					0
		 				</c:if>
						</div>회</li>
					<li><div id="reportDays">
							<c:if test="${reportData.reportsum != null}">
		 					${reportData.reportsum }
		 				</c:if>
							<c:if test="${reportData.reportsum == null}">
		 					0
		 				</c:if>
						</div>일</li>
				</ul>
				<button class="success" id="reportCheck" onclick="javascript:reportPageMove()">자세히 보기</button>

			</div>
			<div id="farmInfo">
				<h5>
					<strong>판매자 농장 정보</strong>
				</h5>
			</div>
			<!-- info 컨테이너 묶기 width:700px 고정 -->
			<div id="sellerEdit">
				<form action="adminEditFarmUpdate" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userid" value="${sellerData.userid }"/>
					<input type="hidden" name="storenum" value="${sellerData.storenum}" />
					<div id="info_container">
						<div id="profile_box">
							<input type="hidden" name="farmprofile" value="${sellerData.farmprofile}" >
							<input type="file" id="farmprofile" name="filename" style="display: none;" onchange="javascript:check(this)" accept="image/png, image/jpg, image/jpeg, image/gif"/> 
							<a href="javascript:selectImg(this)"><img id="nowImg" src="<%=request.getContextPath()%>/resources/sellerprofileimg/${sellerData.farmprofile}" onerror="this.src='/sshj/img/derror.png'"/></a><br /> 
							*프로필 이미지 클릭시 파일첨부<br /> <input type="text" id="farmname" name="farmname" value="${sellerData.farmname }" style="width: 100px; height: 25px" />
							<div id="profileData">
								방문 : ${sellerData.farmvisitor}명 | 농장 즐겨찾기 : ${selectFavorite}명
							</div>
						</div>
						<br>
						<br>
						<!-- profile_box 종료 -->
						<div id="farm_info">
							<div>INFO</div>
							<textarea name="farmintro">${sellerData.farmintro }</textarea>
						</div>
						<!-- farm_info 종료 -->
						<div id="farm_contact">
							<div>CONTACT</div>
							<div id="contact_content">
								<b>스토어 정보</b>
								<div>
									<span>상호명</span><input type="text" id="storename" name="storename" value="${sellerData.storename }" style="width: 400px" />
								</div>
								<div>
									<span>대표자</span><input type="text" id="sellername" name="sellername" value="${sellerData.sellername}" style="width: 400px" />
								</div>
								<div>
									<span>사업자등록번호</span>
									<input type="text" id="sellerreginum" name="sellerreginum" value="${sellerData.sellerreginum }">
								</div>
								<div>
									<span>사업장 소재지</span>
									<div>
										<input type="button" id="sellerzipSearch" value="우편번호 검색" style="margin-right: 5px;" class="btn" /> <input type="text" name="storezipcode" id="storezipcode" readonly style="width: 100px;" value="${sellerData.storezipcode }" /> <input type="text" name="storeaddr" id="storeaddr" style="margin-top: 5px; width: 302px;" readonly placeholder="우편 번호 검색을 통해 입력해주세요" value="${sellerData.storeaddr }" /> <input type="text" name="storedetailaddr" id="storedetailaddr" style="margin-top: 5px; width: 540px;" placeholder="상세 주소 입력" value="${sellerData.storedetailaddr }" />
									</div>
								</div>
								<div>
									<span class="spanstar">은행</span> <select name="bank" id="bank">
										<option value="index" disabled>은행명선택</option>
	
										<c:if test="${sellerData.bank=='국민' }">
											<option value="국민" selected>국민</option>
										</c:if>
										<c:if test="${sellerData.bank!='국민' }">
											<option value="국민">국민</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='비씨' }">
											<option value="비씨" selected>비씨</option>
										</c:if>
										<c:if test="${sellerData.bank!='비씨' }">
											<option value="비씨">비씨</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='신한' }">
											<option value="신한" selected>신한</option>
										</c:if>
										<c:if test="${sellerData.bank!='신한' }">
											<option value="신한">신한</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='현대' }">
											<option value="현대" selected>현대</option>
										</c:if>
										<c:if test="${sellerData.bank!='현대' }">
											<option value="현대">현대</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='삼성' }">
											<option value="삼성" selected>삼성</option>
										</c:if>
										<c:if test="${sellerData.bank!='삼성' }">
											<option value="삼성">삼성</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='롯데' }">
											<option value="롯데" selected>롯데</option>
										</c:if>
										<c:if test="${sellerData.bank!='롯데' }">
											<option value="롯데">롯데</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='외환' }">
											<option value="외환" selected>외환</option>
										</c:if>
										<c:if test="${sellerData.bank!='외환' }">
											<option value="외환">외환</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='NH' }">
											<option value="NH" selected>NH</option>
										</c:if>
										<c:if test="${sellerData.bank!='NH' }">
											<option value="NH">NH</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='하나' }">
											<option value="하나" selected>하나</option>
										</c:if>
										<c:if test="${sellerData.bank!='하나' }">
											<option value="하나">하나</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='우리' }">
											<option value="우리" selected>우리</option>
										</c:if>
										<c:if test="${sellerData.bank!='우리' }">
											<option value="우리">우리</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='광주' }">
											<option value="광주" selected>광주</option>
										</c:if>
										<c:if test="${sellerData.bank!='광주' }">
											<option value="광주">광주</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='수협' }">
											<option value="수협" selected>수협</option>
										</c:if>
										<c:if test="${sellerData.bank!='수협' }">
											<option value="수협">수협</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='씨티' }">
											<option value="씨티" selected>씨티</option>
										</c:if>
										<c:if test="${sellerData.bank!='씨티' }">
											<option value="씨티">씨티</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='전북' }">
											<option value="전북" selected>전북</option>
										</c:if>
										<c:if test="${sellerData.bank!='전북' }">
											<option value="전북">전북</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='제주' }">
											<option value="제주" selected>제주</option>
										</c:if>
										<c:if test="${sellerData.bank!='제주' }">
											<option value="제주">제주</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='카카오뱅크' }">
											<option value="카카오뱅크" selected>카카오뱅크</option>
										</c:if>
										<c:if test="${sellerData.bank!='카카오뱅크' }">
											<option value="카카오뱅크">카카오뱅크</option>
										</c:if>
	
										<c:if test="${sellerData.bank=='케이뱅크' }">
											<option value="케이뱅크" selected>케이뱅크</option>
										</c:if>
										<c:if test="${sellerData.bank!='케이뱅크' }">
											<option value="케이뱅크">케이뱅크</option>
										</c:if>
									</select>
								</div>
								<div>
									<span class="spanstar">계좌번호</span><input type="text" name="bankaccount" id="bankaccount" value="${sellerData.bankaccount }" />
								</div>
								<div>
									<span class="spanstar">예금주</span><input type="text" name="bankname" id="bankname" value="${sellerData.bankname }" />
								</div>
								<div>
									<span class="spanstar">이메일</span><input type="text" name="storeemail" id="storeemail" style="margin-right: 5px;" value="${sellerData.storeemail }" />
								</div>
							</div>
						</div>
	
						<div id="bottommm" style="margin-top:50px; position:static;">
							<input type="submit" value="수정하기" class="btn write_btn" id="write_btn"/>	
						</div>
					</div>
				</form>
			</div>
			<!-- info_container 종료 -->
			
			
	</div>

	
</div>
</div>
<div id="modal"></div>
<div id="popup"></div>
