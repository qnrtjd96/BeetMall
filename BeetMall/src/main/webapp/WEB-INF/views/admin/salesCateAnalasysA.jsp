<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 차트 라이브러리 chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js"></script>
<!-- chart.js pdf 변환 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js'></script>

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
<style>


#topBar h5 {
	padding-left: 190px;
	width: 450px !important;
}

#topBar li {
	width: 12%;
}

article {
	width: 1080px;
	position: relative;
	top: -130px;
}

.wrapContainer {
	background-color: white;
	border-radius: 10px;
	border-color: lightgray;
	margin: 50px 30px;
	width: 95% !important;
}

#pdfDown {
	margin: 10px 20px 0 0;
}

button {
	border-radius: 5px;
}
.normalBtn{
	float: right;
	height: 30px;
	line-height: 30px;
	padding: 0 5px;
	background-color: #aaa;
	color: white;
	border: 1px solid #aaa;	
}

#excelViewNum{
	float: right;
	height: 30px;
	line-height: 30px;
	padding: 0 5px;
	margin-right: 5px;
}

/* 카테고리 검색 */
#categoryList {
	flex-basis: 100%;
	border: 1px solid #aaa;
	margin: 20px 0 0 50px;
}

#categoryListMiddle {
	width: 100%;
	height: 170px;
	display: flex;
	flex-basis: 1;
}

#categoryListMiddle ul {
	border-bottom: 1px solid #aaa;
	border-top: 1px solid #aaa;
	overflow: auto;
	flex: 1;
	display: flex;
	flex-direction: column;
}

#category {
	border-right: 1px solid #aaa;
}

#category a {
	color: black;
}

#categoryListMiddle li {
	width: 100% important;
	text-indent: 0.4em;
	display: flex;
	padding: 3px 0;
}

#categoryListMiddle li:hover {
	background-color: #eee;
}

#categoryListMiddle span {
	margin-left: auto;
	margin-right: 10px;
}

#categoryManagement {
	width: 100%;
	height: 50px;
	overflow: auto;
	display: flex;
	flex-wrap: wrap;
}

#categoryManagement li {
	text-indent: 0.4em;
	margin-right: 5px;
}

#categoryManagement a {
	color: black;
	font-weight: bold;
}

#categorySearch_container {
	margin-top: 10px;
	margin-bottom: 10px;
	display: flex;
}

.categorySearch_item {
	flex-basis: 100px;
	margin-right: 10px;
}

#categoryDate {
	height: 26px;
	margin-left: 10px;
}

#calendarApply {
	border: 1px solid #aaa;
	background-color: #aaa;
	color: white;
	padding: 0 5px;
}

#mcategory li>a {
	color: black;
}

#category li:nth-child(5),#mcategory li:nth-child(5){
	width: 100% !important;
}

#contentBox li:nth-of-type(5) {
	font-weight: normal;
}

#contentBox ul{
	padding-left: 30px;
	margin-left: 0 !important;
}

#container ul{
	width:100% !important;
}

b {
	position: relative;
	top: -7px;
	left: -6px;
}

#excelViewNum, #excelDown {
	position: relative;
	top: -80px;
	margin: 90px 20px 0 0;
}

#excelList{
	width: 100%;
	display: flex;
	flex-flow: wrap;
}

/* 페이징처리부분 */
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

#excelList {
	margin-left: 0 !important;
	width: 929px !important;
}

#excelList li {
	flex-basis: 18%;
	border: none;
	border-right: 1px solid #eee;
}

#excelList li:nth-of-type(1) {
	border-radius: 10px 0 0 0;
}

#excelList li:nth-of-type(6) {
	border-radius: 0 10px 0 0;
}

/*카테고리 선택, 수익, 매출분석 컨테이너*/
#salesBox1, #salesBox2, #salesCateBox {
	width: 980px !important;
	margin-top: 40px;
	margin-left: 0 !important;
	position: relative;
}

#salesCateBox {
	height: 400px;
}

#salesBox1, #salesBox2 {
	position: relative;
	top: 50px !important;
	height: 700px;
}

#sales1Title {
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	letter-spacing: 2px;
	border-bottom: 1px solid lightgray;
	border-radius: 10px 10px 0px 0px;
	background-color: #FAF9F6;
	height: 60px;
}

#calendarApply>div {
	position: relative;
	top: -7px;
}
/*매출분석*/
#excelContainer {
	position: relative;
	top: -60px;
	margin-left: 25px !important;
}

#salesCateTitle, #sales1Title, #sales2Title {
	padding-top: 10px !important;
}

.page_wrap{
    position: relative;
    top: -90px;
    margin-top: 0 !important;
}
#totalMoney{
	width:100%;
	text-align: right;
	margin: 5px 5px 5px 25px;
	font-weight: bold;
	
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 10px;
	background-color: #f8faf7;
	position: relative;
    top: -60px;
}

.wrapContainer{
	margin: 0px;
}
#excelViewNum{
	float: right;
	height: 30px;
	line-height: 30px;
	padding: 0 5px;
	margin-right: 5px;
}

#excelContainer{
	width: 100%;
	max-height: 450px;
	margin: 0 auto;
	overflow: auto;
}
#excelList{
	width: 100%;
	padding: 0px !important;
	display: flex;
	flex-flow: wrap;
}

#excelList li{
	flex-basis: 18%;
	height: 40px;
	line-height: 40px;
	text-align: center;
	border: 1px solid #ddd;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#excelList li:nth-child(n+1):nth-child(-n+6){
	background-color: #eee;
	font-weight: bold;
}

#excelList li:nth-child(6n+2){
	flex-basis: 14%;
}

#excelList li:nth-child(6n+4){
	flex-basis: 10%;
}

#excelList li:nth-child(6n+1),#excelList li:nth-child(6n+5){
	flex-basis: 15%;
}

#excelList li:nth-child(6n+3){
	flex-basis: 28%
}
</style>
<script>
////////////////////////////////전역변수 선언 /////////////////////////////////
//선택된 날짜의 데이터를 저장해 높는 변수
let startCalendarDataValue = "";
let endCalendarDataValue = "";


//날짜 변경을 년별로 했었는지 체크하기 위한 yearCheck 변수 선언
let yearCheck="";

//존재하는 품목이 없는것으로 확인되었을 경우 resultData[] 배열에 넣어서 데이터 산출 하는데 사용되어야 한다.
let resultData = new Array();
//년별, 월별, 일별인지 체크하기 위한 변수 선언
let dateCheck = "";

//페이징 번호
let excelListNum = 0;

//엑셀에서 사용할 값이 들어있는 리스트 변수
let excelArrList ;

//엑셀에서 사용할 표시되는 페이지 갯수 정하는 변수
let excelViewListNum;

//엑셀 최대 페이지 갯수
let excelMaxPage;

//엑셀 페이징 설정
let MathNum;

/////////////////////////////// 차트 함수 /////////////////////////////
let myChart ;



//기능

//차트 추가하기
function addData(chart, data) {
chart.data.datasets.push(data);
chart.update();
}

//차트 삭제하기
function removeData(chart,delData) {
chart.data.datasets.splice(delData,1);
chart.update();
}

//콤마 찍은 숫자 표현하기, 정규표현식
function reqularExpression(num){
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}

//콤마 풀고 계산하기 위한 기능
function revertNumType(num){
	return num.replace(/\,/g,'');
}






//차트와 엑셀에 데이터가 들어가는데 필요한 기능에게 변화되는 도움만 주고 관여는 하지 않는 기능들 모아놓은 스크립트



//날짜를 년별, 월별, 일별을 바꿀 경우 그 조건에 맞게 input 박스를 change 한다.
function typeChange(e){
	let optionCheck = $(e).val();
	
	if(optionCheck=="년별"){
		// 년별 넣을때 스타트와 엔드를 드롭박스로 만든다.
		// start date
		let start = "<select id='categoryCalendar_start'>";
			for(let i=2018; i<=${yearCheck};i++){
				start += "<option>"+i+"</option>";
			}
			start += "</select>";
		
		// end date
		let end = "<select id='categoryCalendar_end'>";
			for(let i=2018; i<=${yearCheck};i++){
				//마지막 년도는 selected 하도록 한다.
				if(i==${yearCheck}){
					end += "<option selected>"+i+"</option>";
				} else {
					end += "<option>"+i+"</option>";
				}
			}
			end += "</select>";	
			
		// tag를 변수를 넣어서 치환한다.
		$("#categoryCalendar_start").replaceWith(start);
		$("#categoryCalendar_end").replaceWith(end).attr('selected',${yearCheck});
		yearCheck="년별";
	}else if(optionCheck=="월별"){
		// 년별을 눌렀었을 경우에는 태그가 변경 되었기 때문에 다시 치환해줘야 한다.
		if(yearCheck=="년별"){
			let start = "<input class='categorySearch_container_child' ";
				start+= " type='month' min='2018-01' max='${monthPtn }' id='categoryCalendar_start'/>";
				
			let end = "<input class='categorySearch_container_child' ";
				end+= " type='month' min='2018-01' max='${monthPtn }' id='categoryCalendar_end'/>";
			
			$("#categoryCalendar_start").replaceWith(start);
			$("#categoryCalendar_end").replaceWith(end);
					
		} else{ // 년별 선택이 아니었을 경우 원래대로 넣는다.
			$("#categoryCalendar_start").attr('type','month').attr('max','${monthPtn}');
			$("#categoryCalendar_end").attr('type','month').attr('max','${monthPtn}');
		}
		yearCheck="";
	}else if(optionCheck=="일별"){
		// 년별을 눌렀었을 경우에는 태그가 변경 되었기 때문에 다시 치환해줘야 한다.
		if(yearCheck=="년별"){
			let start = "<input class='categorySearch_container_child' ";
				start+= " type='date' min='2018-01-01' max='${datePtn }' id='categoryCalendar_start'/>";
				
			let end = "<input class='categorySearch_container_child' ";
				end+= " type='date' min='2018-01-01' max='${datePtn }' id='categoryCalendar_end'/>";
			
			$("#categoryCalendar_start").replaceWith(start);
			$("#categoryCalendar_end").replaceWith(end);
					
		} else{// 년별 선택이 아니었을 경우 원래대로 넣는다.
			$("#categoryCalendar_start").attr('type','date').attr('max',"${datePtn}");
			$("#categoryCalendar_end").attr('type','date').attr('max',"${datePtn}");
		}
		yearCheck="";
	}
	
}


//대분류 카테고리 클릭시 : 데이터 베이스로 불러왔던 중분류 카테고리를 선택된 대분류 카테고리 종류에 따라 값을 불러와 li로 넣는 기능

$(document).on('click',"#category>li",function(){
	// 선택된 카테고리 넘버를 변수에 넣어둔다.
	let cateNum = $(this).val();
	// 태그를 이용해 선택된 카테고리의 중분류 카테고리를 담는 변수를 생성한다.
	let tag ="";
	
	// category 대분류 클릭시 색상 변화
	$('#category>li').css('font-weight','normal');
	$(this).css('font-weight','bold');
	
	
	// 카테고리 리스트가 널이 아닐경우
	<c:if test="${cateList!=null }">
		//  카테고리 넘버가 무엇인지에 따라서 불러온다, 카테고리 넘버가 1이면 중분류 카테고리 1번의 값들을 불러온다.
		<c:forEach var="mcateList" items="${cateList}">
			if(${mcateList.catenum}==cateNum){
				tag += "<li value='${mcateList.catename}'>"
						+"<input type='hidden' name='mcatenum' value='${mcateList.mcatenum}'/>"
						+"<a href='#' onclick = 'return false;'/>${mcateList.mcatename}</a></li>";
			}
		</c:forEach>
		$('#mcategory').html(tag);
	</c:if>

});

$( ()=>{
	//pdf 다운로드 누르면 실행
	$('#pdfDown').click( () => {
		// 페이지의 크기를 구한다.
		var reportPageHeight = $('#chartContainer').innerHeight();
		var reportPageWidth = $('#chartContainer').innerWidth();

		console.log(reportPageHeight);
		console.log(reportPageWidth);
		  // 캔버스 개체를 만든다.
		  var pdfCanvas = $('<canvas />').attr({
		    id: "canvaspdf",
		    width: reportPageWidth,
		    height: reportPageHeight
		  });
		  
		  // 캔버스 포지션을 정한다.
		  var pdfctx = $(pdfCanvas)[0].getContext('2d');
		  var pdfctxX = 0;
		  var pdfctxY = 0;
		  var buffer = 100;
		  
			  // for each chart.js chart
		  $("canvas").each(function(index) {
		    // 차트의 크기를 구한다.
		    var canvasHeight = $(this).innerHeight();
		    var canvasWidth = $(this).innerWidth();
		    
		    // 새로운 캔버스 안에 넣는다.
		    pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
		    pdfctxX += canvasWidth + buffer;
	     
		    if (index % 2 === 1) {
		      pdfctxX = 0;
		      pdfctxY += canvasHeight + buffer;
		    }
		  }); 
		  
		  // pdf 객체를 생성하여 넣는다.
		  var pdf = new jsPDF('l', 'pt', [reportPageWidth, reportPageHeight]);
		  pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);
		  
		  // pdf 다운로드
		  pdf.save('BEETMALL 매출내역.pdf');
		  alert('BEETMALL 매출내역 PDF 파일 다운로드가 실행되어 다운로드 폴더에 생성됩니다.');
	});
})


$(function(){
	//////////////////// 수익 매출분석에 들어갈 labels 시작 /////////////////////
	// 날짜 적용 버튼 클릭시,, labels 추가
	$('#calendarApply').click(function(){
		// 월별 일별에 사용될 스플릿 값 저장할 전역변수 생성!
		let startSplit = null;
		let endSplit = null;

		// 차이값에 대한 계산 결과를 저장하는데 사용할 전역변수 생성!
		let gapResult = 0;
		
		// startDate, endDate 선택된 값을 가져온다.
		let startDateCheck = $('#categoryCalendar_start').val();
		let endDateCheck = $('#categoryCalendar_end').val();
		

		//=======================제한사항 걸러내기 3가지 ===========================//
		// 날짜 시작, 종료를 입력하지 않을 경우 걸러낸다.
		if(startDateCheck == '' ||endDateCheck == ''){
			alert('검색할 시작 날짜와 종료 날짜를 반드시 선택해야 합니다.');
			return false;
		}
		
		// 날짜 시작, 종료의 기준일을 반대로 누르는 사람 있으면 걸러야 한다..
		if(startDateCheck > endDateCheck){
			alert('검색 시작 날짜를 종료 날짜보다 미래로 지정 할 수 없습니다.');
			return false;
		}
		
		
		//========================제한사항 걸러내기 끝 ===============================//
		
		
		
		// 년도, 월별, 일별 어떤 조건인지 확인하고 이동한다.!!!
		dateCheck = $('#categoryDate>option:selected').val();
		
		
		if(dateCheck != "년별"){ // 년별이 아닐경우 스플릿 전역변수를 스플릿 해준다!
			// 날짜 - 표시 스플릿해서 없애기
			startSplit = startDateCheck.split("-");
			endSplit = endDateCheck.split("-");
		}
		
		// 차트에 새로운 값 업데이트 하기 전에 모두 지운다.
		// 지우는건 제한사항으로 걸러 낸 다음에 한다.
		let labelsLength = parseInt(Object.keys(myChart.data.labels).length);
		myChart.data.labels.splice(0,labelsLength);
		myChart.update();
		
		/* 생각하자..................
		1. 년도, 월, 일 을 기준으로 endDate와 startDate의 차이를 비교해서 
			년 차이가 있을 경우는 2가지다 ( 같은 년도가 같을 경우, 시작 년도가 작을경우)
			월은 1월 12월 기준으로 변화된 값에 대한 계산
			일은 해당 월의 일이 언제까지인지 계산해서 차이를 계산해야한다.
		2. 해당 차이 값(날짜)을 구해서 차트 labels에 넣어주어야 한다.
		3. "일". 그러니까 해당 월의 마지막 날을 구하는 것은 lastday가 언제인지 식으로 구해야한다.
		//const startCheck = new Date(startDateCheck);
		//const endCheck = new Date(endDateCheck).getFullYear();
		//const gapCheck = new Date(startSplit[0], startSplit[1], 0).getDate();
	
		*/
		
		
		// 월별, 년별, 일별 그리고 지정한 날짜에 따라 차트에 들어가지는 값이 달라진다.
		if(dateCheck=="월별"){
			// split 해 준 값을 계산하기 위해서 정수로 변환해준다.
			startSplit[0] = parseInt(startSplit[0],10);
			startSplit[1] = parseInt(startSplit[1],10);
			// 마지막 날짜 구하기
			let lastDay = new Date(endSplit[0],endSplit[1],0).getDate();
			
			// 날짜의 차이(년)을 구한다.
			if( startSplit[0] < endSplit[0] ){// 년도 차이가 있다! 
				
				gapResult = endSplit[1] - startSplit[1] +12; // "월" 계산된 값에 + 12를 해준다.
				for(let i = 0; i <= gapResult; i++){ // gapResult 만큼 반복한다.
					// 차트에 넣는다
					myChart.data.labels.push(startSplit[0]+"-"+startSplit[1]);
					
					//////////// 데이터 계산을 위해 저장해 놓아야 하는 변수 //////////////
					if(i==0){
						startCalendarDataValue = startSplit[0]+"-"+startSplit[1]+"-"+01;	
						if(gapResult==0){// 만약 같은 날짜를 선택 했을 경우에는 엔드 날짜도 구해줘야 한다.
							endCalendarDataValue =startSplit[0]+"-"+startSplit[1]+"-"+lastDay;
						}
					} else if(i==gapResult){
						endCalendarDataValue =startSplit[0]+"-"+startSplit[1]+"-"+lastDay;
					}
													
					//////////// 12월 기준으로 날짜를 바꿔줘야 한다 /////////////
					if(startSplit[1]!=12){
						startSplit[1] += 1;
					
					} else { //startSplit[1]이 12월이 되면 년도와 월을 바꿔서 대입 해줘야 한다.
						startSplit[0] += 1;
						startSplit[1] = 1;
					
					}
				}
			} else { // 년도 차이가 없다!
				
				gapResult = endSplit[1] - startSplit[1];
				for(let i = 0; i <= gapResult; i++){ // gapResult 만큼 반복한다.
					//////////// 데이터 계산을 위해 저장해 놓아야 하는 변수 //////////////
					if(i==0){
						startCalendarDataValue = startSplit[0]+"-"+startSplit[1]+"-"+01;	
						if(gapResult==0){// 만약 같은 날짜를 선택 했을 경우에는 엔드 날짜도 구해줘야 한다.
							endCalendarDataValue =startSplit[0]+"-"+startSplit[1]+"-"+lastDay;
						}
					} else if(i==gapResult){
						endCalendarDataValue =startSplit[0]+"-"+startSplit[1]+"-"+lastDay;
					}
					
					//차트에 넣는다.
					myChart.data.labels.push(startSplit[0]+"-"+startSplit[1]);
					
					startSplit[1] += 1;
				}
			}
			
			
		} else if(dateCheck=="일별"){
			// split 해 준 값을 계산하기 위해서 정수로 변환해준다.
			startSplit[0] = parseInt(startSplit[0],10);
			startSplit[1] = parseInt(startSplit[1],10);
			startSplit[2] = parseInt(startSplit[2],10);
			
			let startInstance = new Date(startDateCheck).getTime();
			let endInstance = new Date(endDateCheck).getTime();
			
			// 시간으로 바꾼 날짜의 차이를 구한다. 밀리초는 1초를 1000으로 나눈것 + 60초 + 60분 + 24시간을 나누면 1일이 구해진다
			gapResult = (endInstance-startInstance)/1000/60/60/24;
			
			/* 
				일별에 대해 구하기 위해서는
				1. 년도 차이가 있는지 확인
					--> 년도 차이가 있으면 월과 일의 마지막 날에 변화가 되어야 하고
				2. 월 차이가 있는지 확인
					--> 월의 차이가 있을 경우 일의 마지막 날에 변화가 되어야 한다.
				
				------------ 위에것은 취소!
				아래와 같이 date + 1만으로 년, 월 일 변화를 확인 할 수 있다.
			*/
			
			// 날짜를 객체화 한다.
			let dateCheck = new Date(startSplit);
			
			// 차트에 +1을 하며 넣어준다.
			for(let i = 0; i <= gapResult; i++){
				//////////// 데이터 계산을 위해 저장해 놓아야 하는 변수 //////////////
				if(i==0){
					startCalendarDataValue = dateCheck.getFullYear()+"-"+(dateCheck.getMonth()+1)+"-"+dateCheck.getDate();	
					if(gapResult==0){// 만약 같은 날짜를 선택 했을 경우에는 엔드 날짜도 구해줘야 한다.
						endCalendarDataValue = dateCheck.getFullYear()+"-"+(dateCheck.getMonth()+1)+"-"+dateCheck.getDate();
					}
				} else if(i==gapResult){
					endCalendarDataValue = dateCheck.getFullYear()+"-"+(dateCheck.getMonth()+1)+"-"+dateCheck.getDate();
				
				}
				
				//차트에 넣는다
				myChart.data.labels.push(dateCheck.getFullYear()+"-"+(dateCheck.getMonth()+1)+"-"+dateCheck.getDate());
				
				// 날짜 데이터에 +1일을 해준다!
				dateCheck.setDate(dateCheck.getDate()+1);
			}
		} else if(dateCheck=="년별"){
			gapResult = endDateCheck-startDateCheck;
			
			for(let i = 0; i <= gapResult; i++){
				//////////// 데이터 계산을 위해 저장해 놓아야 하는 변수 //////////////
				if(i==0){
					startCalendarDataValue = startDateCheck+"-"+01+"-"+01;	
					if(gapResult==0){// 만약 같은 날짜를 선택 했을 경우에는 엔드 날짜도 구해줘야 한다.
						endCalendarDataValue = startDateCheck+"-"+12+"-"+31;	
					}
				} else if(i==gapResult){
					endCalendarDataValue = startDateCheck+"-"+12+"-"+31;
				
				}
				
				//차트에 넣는다
				myChart.data.labels.push(startDateCheck);
				startDateCheck++;
			}
			
		}
		//myChart에 담긴 것을 업데이트한다.
		myChart.update();
		
		if($('#categoryManagement>li').length != 0){

			//데이터 컨트롤러 실행, 차트, 엑셀 재설정
			dataController();	
		
		}
		
	})
	//////////////////// 수익 매출분석에 들어갈 labels 끝 /////////////////////
	
	
	
	
	
	
	
	///////////////////////////////////////////////////////////////////////// 카테고리, 차트, 엑셀
	
	// 중분류 카테고리 선택시 추가하는 기능 categoryManagement
	$(document).on('click', '#mcategory>li', function(){
		/*========================  category에 포함  ==========================*/
		
		// 선택한 목록의 중분류 이름, 번호를 구한다.
		let selectName = $(this).text();
		let selectNum = $(this).children().val();
		
		// li 개수 구하여 10개 이상은 고르지 못하도록 막는다
		let liLength = $('#categoryManagement>li').length;
		if(liLength>=10){
			return alert('최대 10개의 품목만 선택 가능합니다.');
			
		}
		
		
		// li에 존재하는 품목 이름이 있으면 추가하지 못하도록 제한해야 한다.
		for(let i=0; i<liLength; i++){
			let getSelect = $('#categoryManagement>li:nth-child('+(i+1)+')').text();
			let gtPosition = getSelect.indexOf(">")+1;
			let boxPosition = getSelect.indexOf("⊠");
			let result = getSelect.substring(gtPosition,boxPosition);
			if(result===selectName){
				return alert("선택되어 있는 품목은 추가 할 수 없습니다.");	
			}
		}
		
		// 선택된 목록 추가 ( Management에서도 보여주고, 차트, 엑셀에도 추가가 되어야 한다.)
		let tag = "<li value="+selectNum+">"+"<input type='hidden' value="+selectName+">"+"<a href='#' onclick='return false'>"+$(this).attr('value')+"&gt;"+selectName+"<span>⊠</span></a></li>";
		$('#categoryManagement').append(tag);
		// append 된 selectName을 배열에 넣어서 저장해놓는다.
		// 1. DB 에서 데이터 구할때 쓰이고
		// 2. 나중에 지울때 써야한다.
		resultData.push(selectNum);
		// 데이터 컨트롤러 실행
		dataController();
		
	});
	


		//////////////////////////////////////////////////// 가장 중요한 데이터 차트, 엑셀 컨트롤러 ////////////////////////////////////////
	function dataController(){
		//계산은 언제 발동하는가?
		// 중분류 카테고리가 눌렸을 때,
		// 중분류 카테고리 삭제할 때
		   // 이 두가지는 값이 들어왔을 때마다 리스트의 값을 받아서 확인하고 쿼리문을 돌리는 방식으로..?
		// 날짜 적용 눌렀을 때
		   // -> 날짜에 따른 데이터를 불러와야 함
		
		// 계산은 어떻게 해야하나?
		// 월 단위인지, 년 단위인지, 일 단위인지에 따라서 계산되는 값이 달라져야 한다
		
		
		// 년, 월 일때 합계를 계산하기 위해 저장할 맵
		// ex) 년별을 골랐을때, 2018년 1월 01일 부터 ~ 2018년 12월 31일까지
		// ex) 월별을 골랐을때, 2018년 03월 01일 부터 ~ 2018년 04월 41일까지
		//let map = new Map();
		//map.clear();// 두번째 실행할 경우 데이터가 들어있기 때문에 초기화 시켜준다
		// 데이터의 날짜를 계산하기 위한 객체화  
		let minDate = new Date(startCalendarDataValue);
		
		$.ajax({
			type: "POST",
			url: "getListData2",
			traditional : true,
			data: {
				"resultData":resultData,
				"startCalendarDataValue":startCalendarDataValue,
				"endCalendarDataValue":endCalendarDataValue
			}, success: function(result){
				// 엑셀 리스트를 초기화 시킨다.
				let tag = "<li>매출일자</li>"
						+ "<li>주문번호</li>"
				  	    + "<li>상품명</li>"
					    + "<li>수량</li>"
					    + "<li>단가</li>"
				        + "<li>매출금액</li>";
				// 엑셀 리스트 li에 산출된 데이터 값을 넣는다.
				let $result = $(result);
				excelArrList = $result;
				$result.each(function(idx,vo){
					
					tag += "<li value=" + vo.mcatenum + ">" + vo.orderconfirm + "</li>";
					tag += "<li>" + vo.ordernum + "</li>";
					tag += "<li value=" + vo.mcatename + ">" + vo.productname + "</li>";
					tag += "<li>" + reqularExpression(vo.orderquantity) + "</li>";
					tag += "<li>" + reqularExpression(vo.orderprice) + "</li>";
					tag += "<li>" + reqularExpression(vo.orderquantity * vo.orderprice) + "</li>";
					
				});
				
				$('#excelList').html(tag);
				
				// 엑셀 페이징 				
				let excelPagingInit = 1; // 선택번호
				excelViewListNum = 10; // excel에 보여지는 갯수를 몇개로 할건지 초기화
				excelListNum = $result.length; // totalRecord 갯수
				excelMaxPage = 10; // excel Max Page 갯수
				excelPaging(excelListNum, excelPagingInit, excelViewListNum, excelMaxPage);
				$('#excelViewNum').val('10').prop('selected',true);
				
				// 총 합계 데이터 입력
				if($('#categoryManagement>li').length>0 && startCalendarDataValue != '' && endCalendarDataValue != ''){
					let totalMoney = 0;
					for(let i = 1; i <= excelListNum; i++){
						// 정규표현식으로 ,가 생성되어 있다. 다시 풀어주고 계산해야 한다.
						let revertData = revertNumType($('#excelList>li:nth-child('+(6+(6*i))+')').text());
						totalMoney += parseInt(revertData, 10);
					}
					//totalMoney / 100
					
					$('#totalMoney').html("총 합계금액 : " + reqularExpression(totalMoney) + "원");
				} else {
					$('#totalMoney').html('');
				}
				
				// 데이터를 저장해서 넘겨줄 값
				let resultArr = [];
				// resultArr에 저장해줄 값을 계산하는 변수
				let resultsum = 0;
				
				// 같은 년, 같은 월, 같은 일을 골랐을 때
				let startDate = new Date(startCalendarDataValue);
				let endDate = new Date(endCalendarDataValue);
				
				
				// borderColor random 차트 추가할 랜덤 색상
				let color1 = Math.floor(Math.random() * 256); 
				let color2 = Math.floor(Math.random() * 256);
				let color3 = Math.floor(Math.random() * 256);
				// 차트에 새로운 값 업데이트 하기 전에 저장되어 있던 모든 데이터를 지운다.
				if($('#categoryManagement>li').length!=null){
					let datasetsLength = parseInt($('#categoryManagement>li').length);
					myChart.data.datasets.splice(0,datasetsLength);
					myChart.update();
				}
				
				
				// 처음에 날짜 데이터가 있는지 없는지 확인한다.
				let existenceCheck = new Date($('#excelList li:nth-child(7)').text());
				if(existenceCheck=='Invalid Date'){
					alert('검색된 데이터가 없습니다.');
					return false;
				}
				
				// 월별 차트 추가하기
				if(dateCheck=="월별"){
					// li에 들어있는 값만큼 반복한다
					for(let i=0; i < $('#categoryManagement>li').length; i++ ){
						// 선택된 값의 중분류 값이 무엇이냐
						let liNum = $('#categoryManagement>li:nth-child('+(i+1)+')').attr('value');
						
						// mcatename : 숨겨져있는 값을 가져온다.
						let mcatename = $('#categoryManagement>li:nth-child('+(i+1)+')').children().val();
						
						//minDate 다시 초기화
						let minDate = new Date(startCalendarDataValue);
						//선택한 첫달의 1일보다 이상 ~ 선택한 다음달의 1일보다 작은 날짜 안에 있는 값을 다 구하고 다음달로 넘어가면 다음달 데이터를 구한다. 
						let maxDate = new Date(minDate);
						maxDate.setMonth(maxDate.getMonth()+1);// maxDate는 minDate의 1달 뒤로 설정
						
						//========================  chart추가  ==========================
						// borderColor random
						let color1 = Math.floor(Math.random() * 256); 
						let color2 = Math.floor(Math.random() * 256);
						let color3 = Math.floor(Math.random() * 256);
						
						// 현재 있는 데이터의 첫 시작 날짜가 minDate보다 2이상 차이 날 경우에 데이터 0을 미리 다 넣어놓고 시작해야 한다.
						let firstDateCheck = new Date($('#excelList li:nth-child(7)').text());
						
						if( 0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) || 1 < (firstDateCheck.getMonth() - minDate.getMonth()) )  {
							
							// year가 다르면 year 먼저 맞출 수 있도록 한다.
							if( 0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) ){
								do{
									minDate.setMonth( minDate.getMonth()+1 );
									maxDate.setMonth( maxDate.getMonth()+1 );
									resultArr.push(0);
								}while( 0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) )
							}
							
							do{
								// 1만 차이 날때까지 날짜를 더해주고 resultArr 에 0을 넣어준다.
								if( 1 < (firstDateCheck.getMonth() - minDate.getMonth()) ){
									minDate.setMonth( minDate.getMonth()+1 );
									maxDate.setMonth( maxDate.getMonth()+1 );
									resultArr.push(0);
								}
							}while(0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) || 1 < (firstDateCheck.getMonth() - minDate.getMonth()))
						}
						
						
						if(startDate.getFullYear() == endDate.getFullYear() && startDate.getMonth() == endDate.getMonth()){// 만약에 .... 시작날짜, 종료날짜를 같은 "월"을 선택했을 경우...
							//언제까지? 날짜가 끝날때까지
							for(let j=0; j < $('#excelList li:nth-child(6n+12)').length; j++){
								// orderconfirm : 엑셀 리스트에서 적혀있는 날짜를 Date로 객체화한다.
								let orderconfirm = new Date($('#excelList li:nth-child('+(7+(j*6))+')').text());
								// mcatenum : 엑셀리스트에서 숨겨져 있는 mcatenum을 가져온다.
								let mcatenum = $('#excelList li:nth-child('+(7+(j*6))+')').attr('value');
											
								// orderconfirm이 maxDate보다 낮을때까지
								// mcatenum과 liNum의 값이 같을때 포함해서 값을 저장한다.
								if(minDate.getMonth() == orderconfirm.getMonth()){
									// 지금 확인된 중분류 값이랑 li에 있는 중분류 값이랑 같으면 더해준다.
									if(mcatenum == liNum){
										// 정규표현식으로 콤마가 되어있는 값을 다시 바꿔줘야 한다.
										let resultData = revertNumType($('#excelList li:nth-child('+(12+(j*6))+')').text());
										//계산된 값을 계속해서 저장해준다.
										resultsum += parseInt(resultData, 10);
									}
								}
								
								
								
								// 만약, length 마지막이면 resultArr에 저장한 데이터를 차트에 넣는다.
								if(j==$('#excelList li:nth-child(6n+12)').length-1){
									let data = {
										label: mcatename, // 품목명을 넣는다
										data: [resultsum], // 같은 월은 데이터 하나만 넣는다.
										borderColor: 'rgb('+color1+','+color2+','+color3+')'
									};
									addData(myChart, data);
									//초기화 시켜준다
									resultArr = [];
									resultsum = 0;
								}
								
							}
						}else { // "월" 수 차이가 있게 했을 경우
							//언제까지? 날짜가 끝날때까지
							for(let j=0; j < $('#excelList li:nth-child(6n+12)').length; j++){
								
								// orderconfirm : 엑셀 리스트에서 적혀있는 날짜를 Date로 객체화한다.
								let orderconfirm = new Date($('#excelList li:nth-child('+(7+(j*6))+')').text());
								// mcatenum : 엑셀리스트에서 숨겨져 있는 mcatenum을 가져온다.
								let mcatenum = $('#excelList li:nth-child('+(7+(j*6))+')').attr('value');
						
								if(maxDate < orderconfirm && mcatenum == liNum){
									//배열에 넣는다.
									resultArr.push(resultsum);
									minDate.setMonth(minDate.getMonth()+1);
									maxDate.setMonth(maxDate.getMonth()+1);
									resultsum = 0;
								}

								if(minDate.getMonth() == orderconfirm.getMonth()){
									// 지금 확인된 중분류 값이랑 li에 있는 중분류 값이랑 같으면 더해준다.
									if(mcatenum == liNum){
										// 정규표현식으로 콤마가 되어있는 값을 다시 바꿔줘야 한다.
										let resultData = revertNumType($('#excelList li:nth-child('+(12+(j*6))+')').text());
										//계산된 값을 계속해서 저장해준다.
										resultsum += parseInt(resultData, 10);
									}
								}
								
								// 만약, length 마지막이면 resultArr에 저장한 데이터를 반복문을 넣는다.
								if(j==$('#excelList li:nth-child(6n+12)').length-1){
									
									resultArr.push(resultsum);
									let data = {
										label: mcatename, // 품목명을 넣는다
										data: resultArr, // 데이터를 넣고
										borderColor: 'rgb('+color1+','+color2+','+color3+')'
									};
									addData(myChart, data);
									//초기화 시켜준다
									resultArr = [];
									resultsum = 0;
								}
								
							}
						}
					}// 월별 차트 출력 끝 //
					
				} else if(dateCheck=="년별"){
					// li에 들어있는 값만큼 반복한다
					for(let i=0; i < $('#categoryManagement>li').length; i++ ){
						// 선택된 값의 중분류 값이 무엇이냐
						let liNum = $('#categoryManagement>li:nth-child('+(i+1)+')').attr('value');
						// mcatename : 숨겨져있는 값을 가져온다.
						let mcatename = $('#categoryManagement>li:nth-child('+(i+1)+')').children().val();
						
						//minDate 다시 초기화
						let minDate = new Date(startCalendarDataValue);
						//선택한 년도의 다음년도를 구한다.
						let maxDate = new Date(minDate);
						maxDate.setFullYear(maxDate.getFullYear()+1);// maxDate는 minDate의 1년 뒤로 설정

						//========================  chart추가  ==========================
						// borderColor random
						let color1 = Math.floor(Math.random() * 256); 
						let color2 = Math.floor(Math.random() * 256);
						let color3 = Math.floor(Math.random() * 256);
						
						// 현재 있는 데이터의 첫 시작 날짜가 minDate보다 2이상 차이 날 경우에 데이터 0을 미리 다 넣어놓고 시작해야 한다.
						let firstDateCheck = new Date($('#excelList li:nth-child(7)').text());
						
						//만약... 데이터 첫 시작 날짜가 다를 경우의 조건
						if( 0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) )  {
							
							// year가 다르면 year 먼저 맞출 수 있도록 한다.
							if( 0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) ){
								do{
									minDate.setFullYear( minDate.getFullYear()+1 );
									maxDate.setFullYear( maxDate.getFullYear()+1 );
									resultArr.push(0);
								}while( 0 < (firstDateCheck.getFullYear() - minDate.getFullYear()) )
							}
						}
						
						
						//언제까지? 날짜가 끝날때까지
						for(let j=0; j < $('#excelList li:nth-child(6n+12)').length; j++){
							
							// orderconfirm : 엑셀 리스트에서 적혀있는 날짜를 Date로 객체화한다.
							let orderconfirm = new Date($('#excelList li:nth-child('+(7+(j*6))+')').text());
							// mcatenum : 엑셀리스트에서 숨겨져 있는 mcatenum을 가져온다.
							let mcatenum = $('#excelList li:nth-child('+(7+(j*6))+')').attr('value');
							// 합계를 낼 시작날짜
							let startSumDate = new Date(orderconfirm.getFullYear(),1,1);
							// 합계를 낼 마지막 날짜
							let endSumDate = new Date(orderconfirm.getFullYear(),12,31);
							
							// orderconfirm가 maxDate보다 커지면 minDate와 maxDate를 한달 늘린다.
							if(maxDate < orderconfirm && mcatenum == liNum){
								//배열에 넣는다.
								resultArr.push(resultsum);
								minDate.setFullYear(minDate.getFullYear()+1);
								maxDate.setFullYear(maxDate.getFullYear()+1);
								resultsum = 0;
							}
							
							// 시작 날짜값과 엑셀리스트 날짜값이 같으면 계산을 한다.
							
							if(minDate.getFullYear() == orderconfirm.getFullYear()){
								// 지금 확인된 중분류 값이랑 li에 있는 중분류 값이랑 같으면 더해준다.
								if(mcatenum == liNum){
									//계산된 값을 계속해서 저장해준다.
									resultsum += parseInt(revertNumType($('#excelList li:nth-child('+(12+(j*6))+')').text()), 10);
								}
							}
							
							// 만약, length 마지막이면 resultArr에 저장한 데이터를 반복문을 넣는다.
							if(j==$('#excelList li:nth-child(6n+12)').length-1){
								resultArr.push(resultsum);
								let data = {
									label: mcatename, // 품목명을 넣는다
									data: resultArr, // 데이터를 넣고
									borderColor: 'rgb('+color1+','+color2+','+color3+')'
								};
								addData(myChart, data);
								//초기화 시켜준다
								resultArr = [];
								resultsum = 0;
							}
							
						}
					}// 년별 차트 출력 끝 //
						
				} else if(dateCheck=="일별"){
					// li에 들어있는 값만큼 반복한다
					for(let i=0; i < $('#categoryManagement>li').length; i++ ){
						// 선택된 값의 중분류 값이 무엇이냐
						let liNum = $('#categoryManagement>li:nth-child('+(i+1)+')').attr('value');
						// mcatename : 숨겨져있는 값을 가져온다.
						let mcatename = $('#categoryManagement>li:nth-child('+(i+1)+')').children().val();
						
						//minDate 다시 초기화
						let minDate = new Date(startCalendarDataValue);

						//========================  chart추가  ==========================
						// borderColor random
						let color1 = Math.floor(Math.random() * 256); 
						let color2 = Math.floor(Math.random() * 256);
						let color3 = Math.floor(Math.random() * 256);
						
						// 현재 있는 데이터의 첫 시작 날짜가 minDate보다 2이상 차이 날 경우에 데이터 0을 미리 다 넣어놓고 시작해야 한다.
						let firstDateCheck = new Date($('#excelList li:nth-child(7)').text());
						
						//만약... 데이터 첫 시작 날짜가 다를 경우의 조건
						if( firstDateCheck.getFullYear() != minDate.getFullYear() || firstDateCheck.getMonth() != minDate.getMonth() || 0 < (firstDateCheck.getTime()/1000/60/60/24) - (minDate.getTime()/1000/60/60/24) )  {
							// year가 다르면 year 먼저 맞출 수 있도록 한다.
							if( firstDateCheck.getFullYear() != minDate.getFullYear() ){
								do{
									minDate.setDate( minDate.getDate()+1 );
									resultArr.push(0);
								}while( firstDateCheck.getDate() != minDate.getDate() )
							}
							
							// 월이 다르면 더해주고 resultArr 에 0을 넣어준다.
							if( firstDateCheck.getMonth() != minDate.getMonth() ){
								do{
									minDate.setDate( minDate.getDate()+1 );
									resultArr.push(0);
								}while( firstDateCheck.getMonth() != minDate.getMonth() )
							}
							
							// 빈날짜가 있으면 0으로 채워준다.
							if(1 < (firstDateCheck.getTime()/1000/60/60/24) - (minDate.getTime()/1000/60/60/24) ){
								do{
									minDate.setDate( minDate.getDate()+1 );
									resultArr.push(0);
								}while( 1 < (firstDateCheck.getTime()/1000/60/60/24) - (minDate.getTime()/1000/60/60/24) )
							}
						}
						
						
						
						// 시작일부터 종료날까지 반복한다.
						let testGap = (endDate.getTime()/ 1000/ 60/ 60/ 24)-(minDate.getTime()/1000/60/60/24);
						// 엑셀리스트에 처음에 적혀있는 날짜를 구한다.
						let orderconfirm = new Date($('#excelList li:nth-child(7)').text());
						// mcatenum : 엑셀리스트에서 숨겨져 있는 mcatenum을 가져온다.
						let mcatenum = $('#excelList li:nth-child(7)').attr('value');
						let testVal = 0;
						// 시작일부터 종료일까지 반복하는데,  매출일자와 상품명이 맞으면 값을 넣고 아닐경우 0을 넣는다.
						// 매출일자와 상품명이 맞으면 +1 을 통해 산출된 데이터 개수만큼 확인한다.
						
						let testCode1 = 0;
						let testCode2 = 0;
						for(let t=0; t <= testGap; t++ ){ // 시작일부터 종료일까지의 갭차이 만큼 반복한다.
							
							// 다음 데이터가 없을경우 0을 넣는다.
							if(isNaN(orderconfirm.getDate())){
								
								resultArr.push(0);
								continue;
								
							}

							if( testCode1 == 0){ //첫번째 일 경우
								
								if( minDate.getDate() == orderconfirm.getDate() && mcatenum == liNum ){//모든 값이 같으면 데이터를 넣는다.
									let resultData = revertNumType($('#excelList li:nth-child('+(12+(testVal*6))+')').text());
									resultArr.push( parseInt(resultData, 10) );
									testVal++;
									orderconfirm = new Date($('#excelList li:nth-child('+(7+(testVal*6))+')').text());
									mcatenum = $('#excelList li:nth-child('+(7+(testVal*6))+')').attr('value');
									
								}else if( minDate.getDate() != orderconfirm.getDate() ){//날짜가 다르면
									
									if( mcatenum != liNum ){ // 날짜가 다른데 값도 다를 경우
										
										resultArr.push(0);
										testVal++;
										orderconfirm = new Date($('#excelList li:nth-child('+(7+(testVal*6))+')').text());
										mcatenum = $('#excelList li:nth-child('+(7+(testVal*6))+')').attr('value');
									
									} else { //날짜가 다르지만 값이 같을 경우 0을 푸시한다.
										
										resultArr.push(0);
										testCode2 = 0;
										
									}
									
								}else if( mcatenum != liNum ){//날짜는 같지만 값이 다를경우 0을 푸시한다. 
									
									resultArr.push(0);
									testVal++;
									orderconfirm = new Date($('#excelList li:nth-child('+(7+(testVal*6))+')').text());
									mcatenum = $('#excelList li:nth-child('+(7+(testVal*6))+')').attr('value');
									
								}
							
								if( minDate.getDate() == orderconfirm.getDate() ){ // 다음 데이터 확인해보니 만약 날짜가 같으면 반복으로 들어가야 한다. 즉, 날짜와 반복 변수가 ++ 되면 안된다.
									
									testCode2 = 1;
									testCode1 = 1;
									t--;
								
								} 
								
							}
							
							if( testCode2 == 1 ) { // 두번째 일 경우. 즉, 반복일 경우
								
								if( minDate.getDate() == orderconfirm.getDate() && mcatenum == liNum ){ // 반복했는데, 날짜와 값이 모두 같을 경우 값을 더해준다.
									let resultData = revertNumType($('#excelList li:nth-child('+(12+(testVal*6))+')').text());
									let saveData = resultArr[resultArr.length-1];
									resultArr.pop();	
									resultArr.push( saveData + parseInt(resultData, 10) );
									
								} else if( minDate.getDate() != orderconfirm.getDate() ){ // 두번째 이상 반복했는데, 날짜가 다르다면 0을 푸시해줘야 한다.
									
									resultArr.push(0);
									
								} else if( mcatenum != liNum ){ // 날짜는 같지만 값이 다르면
									
								}
									
								testVal++;
								orderconfirm = new Date($('#excelList li:nth-child('+(7+(testVal*6))+')').text());
								mcatenum = $('#excelList li:nth-child('+(7+(testVal*6))+')').attr('value');
								
								if( minDate.getDate() != orderconfirm.getDate() ){ // 만약 날짜가 같지 않으면 첫번째를 실행시킨다.
									
									testCode1 = 0;
									testCode2 = 0;
									
								} else { // 만약 날짜와 값이 같거나 ,, 날짜가 같지만 값이 다르면
									
									// testCode2 == 1;을 유지하고 반복해야 한다. 즉, 날짜와 반복 변수가 ++되면 안된다.
									t--;
									
								}
								
							}
							
							
							// 반복하지 않아도 되면 날짜를 업데이트 한다.
							if( testCode2 != 1 ){
								
								// 현재 확인하고 있는 날짜를 ++ 해준다.
								minDate.setDate(minDate.getDate()+1); 	
								
							}
							
						}
							
						let data = {
								label: mcatename, // 품목명을 넣는다
								data: resultArr, // 데이터를 넣고
								borderColor: 'rgb('+color1+','+color2+','+color3+')'
						};
						addData(myChart, data);
						//초기화 시켜준다
						resultArr = [];
						resultsum = 0;
					}// 일별 차트 출력 끝 //
				}
				
			}, error: function(e){
				console.log(e);
			}
		});// ajax 끝 
		
	}// 데이터 추가함수 끝
	
	
	
	
	
	
	/////////////////////////////////////// 중분류 삭제 할 때 사용할 기능
	//append로 값을 동적으로 추가해줄 경우 새로 html이 실행 된 것이 아니기 때문에 html에서는 그 값을 읽지 못한다.
	// 그렇기 때문에 document를 사용해 다시 html을 읽기만 해서 싹 둘러보고 찾아서 삭제한다고 생각하면 된다.
	$(document).on('click','#categoryManagement>li',function(){
		
		// 삭제하기 위해서는 어떤 것이 선택되었는지?
		// 그리고 삭제하는 데이터가 추가 된 것 중에 몇번째에 있는지 알 수 있어야 한다.
		let liLength = $('#categoryManagement>li').length;
		
		// 선택된 목록의 이름과 번호를 구한다.
		let selectName = $(this).text();
		let selectNum = $(this).children().val();
		
		
		// 선택된 아이템의 텍스트를 걸러야 한다.
		let selectGtPosition = selectName.indexOf(">")+1;
		let selectBoxPosition = selectName.indexOf("⊠");
		let selectNameResult = selectName.substring(selectGtPosition,selectBoxPosition);
		
		///////////////////////////////차트 데이터 삭제
		// li에 존재하는 품목 이름을 찾아서 삭제한다.
		for(let i=0; i<liLength; i++){
			let getSelect = $('#categoryManagement>li:nth-child('+(i+1)+')').text();
			let gtPosition = getSelect.indexOf(">")+1;
			let boxPosition = getSelect.indexOf("⊠");
			let result = getSelect.substring(gtPosition,boxPosition);
			
			// result와 selectNameResult가 맞는 차트데이터를 삭제한다
			if(result===selectNameResult){
				// result 데이터에 데이터도 삭제한다.
				resultData.splice(i,1);
				// 차트에 들어가있는 데이터를 삭제한다
				removeData(myChart, i);
			}
			
		}
		// 이건 선택되서 아래에 내려온것들 클릭했을때 지워주는거 ex) 채소>땅콩
		$(this).remove();
		
		
		if($('#categoryManagement>li').length != 0){
			
			//데이터 컨트롤러 실행, 차트, 엑셀 재설정
			dataController();	
		
		} else {
			// 엑셀 리스트를 초기화 시킨다.
			let tag = "<li>매출일자</li>"
					+ "<li>주문번호</li>"
			  	    + "<li>상품명</li>"
				    + "<li>수량</li>"
				    + "<li>단가</li>"
			        + "<li>매출금액</li>";
			
			$('#excelList').html(tag);
			$('#totalMoney').html('');
		}
	})// 삭제 함수 끝
	
})

/////////////////////////////// 엑셀 기능 함수 /////////////////////////////////////
//                li갯수,    excelpageNum,  excel 1page당 보이는갯수 ,    excel last page
function excelPaging(num , excelPagingInit, excelViewListNum, excelMaxPage){
	// excelPaging 할때, html 변화를 render
	let excelPagingTag = '<a class="arrow pprev" href="javascript:void(0);" onclick="apprev(this);"></a> <a class="arrow prev" href="javascript:void(0);" onclick="aprev(this);"></a>';
	// 모든 display none으로 초기화하고 시작
	$('#excelList>li:nth-child(n+7)').css('display','none');
	
	// num에는 li 갯수가 몇 개 있는지 들어있다.
	// num을 10으로 나눈 값
	MathNum = Math.ceil(num/excelViewListNum);
	
	//시작번호 ((excelPagingInit -1 / excelViewListNum*excelViewListNum)+1
	let startPageNum = (Math.floor((excelPagingInit-1) / excelMaxPage)*excelMaxPage)+1;
	
	if(MathNum==1){// 초기화 총 페이지수가 1이면 실행한다.
		if(num<=excelViewListNum){ // num 갯수가 페이지 갯수보다 적으면
			excelPagingTag += '<a class="active" href="javascript:void(0);" onclick="anum(this);">1</a>';  
			for(let i = 1; i <= num; i++){
				$('#excelList>li:nth-child(n+7):nth-child(-n+'+(6+(6 * num))+')').css('display','inline');
			}
		} else if(num>excelViewListNum){
			for(let i = 0; i < MathNum; i++){
				if( i == 0 ){
					excelPagingTag += '<a class="active" href="javascript:void(0);" onclick="anum(this);">' + (i+1) + '</a>';
				} else {
					excelPagingTag += '<a class="arrow" href="javascript:void(0);" onclick="anum(this);">' + (i+1) + '</a>';
				}
				if(excelViewListNum==i) break;
			}
			
			$('#excelList>li:nth-child(n+7):nth-child(-n+'+(6+(6 * excelViewListNum))+')').css('display','inline');
		}
		
		excelPagingTag += '<a class="arrow next" href="javascript:void(0);" onclick="anext(this);"></a> <a class="arrow nnext" href="javascript:void(0);" onclick="annext(this);"></a>';
		 
	} else {// 페이지 이동 ( 이전, 숫자, 다음 , 맨 마지막 시 ) 사용
		// 만약, 1이 아닌
		// 2 3 4 5 가 눌렸을때 그 페이지의 정보들을 보여줘야 한다.
		// 1 * 10 ,,, 2 * 10
		// excelPagingInit == 페이지 눌린 번호
		// excelPagingInit / 10 == 페이지 눌린 번호가 10페이지 이하냐
		// MathNum == 10으로 나눴을때 페이지 수
		
		// 추가적으로 필요한 것은 이게 1~10페이지인지, 11~ 20페이지인지 알 수 있어야 한다.
		// MathNum/10 == 1 ---> 1~10페이지      MathNum/10 == 2 ----> 11 ~ 20페이지
		// 이걸 자동으로 하는 계산해서 페이징 숫자를 표현하는 함수를 만들어야 한다.
		
		// 숫자표시
		// 만약 눌린 페이지가 10 이하면  1 2 3 4 5 6 7 8 9 10
		// 만약 눌린 페이지가 11 이상 20 이하면 11 12 13 14 15 16 17 18 19 20
		// 만약 눌린 페이지가 21 이상 30 이하면 21 22 23 24 25 26 27 28 29 30
		for( let i = startPageNum; i <= startPageNum + excelMaxPage-1 ; i++){
			if( i == excelPagingInit ){
				excelPagingTag += '<a class="active" href="#">' + i + '</a>';
			} else {
				excelPagingTag += '<a class="arrow" href="javascript:void(0);" onclick="anum(this);">' + i + '</a>';
			}
			if(i == MathNum) break;
		}
		
		$('#excelList>li:nth-child(n+'+ (7+ ((6*excelViewListNum) * (excelPagingInit-1) ) ) +'):nth-child(-n+'+ (6+(6*excelViewListNum) + ( (6*excelViewListNum) * (excelPagingInit-1) ) ) +')').css('display','inline');
		
		/*
		let result = excelPagingInit%excelViewListNum - excelPagingInit+1; // 시작값 ex) (25%10) - 25 + 1= 21
		// MathNum = 즉, 총 보유하고 있는 페이지와 result를 비교했을때의 차이값 만큼 표시 한다 
		// MathNum == 25이고
		// result == 21부터 시작이면 25까지만 표시되게
		// 만약 돌리다가 10을 넘을경우 브레이크 한다.
		if(excelPagingInit <= excelViewListNum){
			for(let i = 1; i <= MathNum; i++){
				if( i == excelPagingInit ){
					excelPagingTag += '<a class="active" href="javascript:void(0);" onclick="anum(this);">' + i + '</a>';
				} else {
					excelPagingTag += '<a class="arrow" href="javascript:void(0);" onclick="anum(this);">' + i + '</a>';
				}
				if(MathNum==excelViewListNum) break;
			}
		} else {
			for(let i = result; i <= (MathNum-result); i++){				
				if( i == excelPagingInit ){ // 눌린번호가 active가 된다.
					excelPagingTag += '<a class="active" href="javascript:void(0);" onclick="anum(this);">' + i + '</a>';
				} else {
					excelPagingTag += '<a class="arrow" href="javascript:void(0);" onclick="anum(this);">' + i + '</a>';
				}
				if((result%10)== excelViewListNum) break;
			}
		}
		// 어디부터 어디까지 나오게 할건지
		// 1일때는 7 ~ 66
		// 2일때는 67 ~ 126      +60
		// 3일때는 127 ~ 186    +120

		$('#excelList>li:nth-child(n+'+ (7+ (60 * (excelPagingInit-1) ) ) +'):nth-child(-n+'+ (66 + ( 60 * (excelPagingInit-1) ) ) +')').css('display','inline');
		*/	
		
		
		
		excelPagingTag += '<a class="arrow next" href="javascript:void(0);" onclick="anext(this);"></a> <a class="arrow nnext" href="javascript:void(0);" onclick="annext(this);"></a>'; 
	} 
	
	$('.page_nation').html(excelPagingTag);
}

//맨 첫페이지
function apprev(){
	// excelList에 값이 10개 이상있으면 엑셀 페이징 초기 
	if(excelListNum > excelViewListNum){
		excelPaging(excelListNum, 1, excelViewListNum, excelMaxPage);
	}
}

//이전 페이지 이동
function aprev(){
	if(excelListNum > excelViewListNum){
		// 1이상이면 이전페이지로 한다.
		if(parseInt($('.active').text(),10) > 1 ){
			excelPaging(excelListNum, parseInt($('.active').text(),10)-1, excelViewListNum, excelMaxPage);	
		} 
	}
}

//숫자 누르기
function anum(clickNum){
	// 누른 페이지 번호가 무엇인지 확인
	if(excelListNum > excelViewListNum){
		excelPaging(excelListNum, parseInt($(clickNum).text(),10), excelViewListNum ,excelMaxPage);
	}
}

//다음페이지
function anext(){
	if(excelListNum > excelViewListNum){
		// MathNum 즉, 마지막페이지가 아닐 경우 다음페이지로 이동 가능하다.
		if(parseInt($('.active').text(),10) < MathNum ){
			excelPaging(excelListNum, parseInt($('.active').text(),10)+1, excelViewListNum, excelMaxPage);	
		}
	}
}

//맨 끝페이지
function annext(){
	if(excelListNum > excelViewListNum){
		// MathNum 즉, 마지막 페이지로 이동
		excelPaging(excelListNum, MathNum, excelViewListNum, excelMaxPage);
	}
}
$(()=>{
	// 엑셀저장
	$('#excelDown').click( () => {
		if($('#categoryManagement>li').length<1 || startCalendarDataValue=='' || endCalendarDataValue==''){
			alert('데이터를 조회 및 선택된 데이터가 있을경우 다운로드가 가능합니다');
			return false;
		}
		let excelData = [];
		for(let i =0; i<excelArrList.length; i++){
			excelData.push(excelArrList[i].ordernum);
			excelData.push(excelArrList[i].orderconfirm);
			excelData.push(excelArrList[i].productname);
			excelData.push(excelArrList[i].orderquantity);
			excelData.push(excelArrList[i].orderprice);
			excelData.push(parseInt(excelArrList[i].orderquantity,10) * parseInt(excelArrList[i].orderprice,10));
		}
		
		$.ajax({
			type: "POST",
			url: "excel_down",
			traditional : true,
			data: {
				"excelData":excelData
			}, success: function(result){
				alert('BEETMALL 매출관리 엑셀파일이 다운로드에 성공하여 다운로드 폴더에 다운되었습니다.');
			}, error: function(error){
				alert('엑셀 다운로드 실패');
			}
		});
	});
})

// 엑셀의 보는 갯수를 조정한다 10개, 50개 100개
function changeViewListNum(num){
	excelViewListNum = $('#excelViewNum option:selected').val();
	excelPaging(excelListNum , 1, parseInt(excelViewListNum), excelMaxPage);
}


</script>
<%@ include file="/inc/top.jspf"%>
<div id="topBarContainer">
	<div id="topBar">
		<ul>
			<li><h5>
					<strong><a href="salesCateAnalasysA">카테고리별 매출 분석</a></strong>
				</h5></li>
		</ul>
	</div>
</div>
<div id="body1">
	<%@ include file="/inc/leftBar.jspf"%>
	<div id="container">
		<div id="contentBox">
			<section>

				<!-- 본문 시작 -->
				<article style="position:relative; top:0px;">
					<div class="wrap">
						<!-- 카테고리 선택 -->
						<div id="salesCateBox">
							<div class="wrapTitle" style="">
								<div id="salesCateTitle">카테고리</div>

								<div class="wrapContainer" id="salesCateContainer">
									<div id="categoryList">
										<!-- 날짜 적용 할 수 있는 기능들 모여있는 컨테이너 -->
										<div id="categorySearch_container">
											<select class="categorySearch_item" id="categoryDate" name="categoryDate" onchange="typeChange(this)">
												<option value="년별">년별</option>
												<option value="월별" selected>월별</option>
												<option value="일별">일별</option>
											</select> <input type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_start" /> <b style="top:0;">&nbsp;&nbsp;~&nbsp;&nbsp;</b> <input type="month" min="2018-01" max="${monthPtn }" id="categoryCalendar_end" />
											<button id="calendarApply" style="margin-left: 10px;">날짜 적용</button>
										</div>
									
										<div id="categoryListMiddle">
											<!-- 대분류 카테고리!!!! -->
											<ul id="category">
												<!-- 카테고리 리스트에서 모든 카테고리 리스트를 가져오지만 우선 대분류만 보이게 한다.-->
												<c:if test="${cateList!=null}">
													<!-- 변수 i를 선언해주고 -->
													<c:set var="i" value="1" />
													<!-- 변수 i 즉, catenum이 i와 일치하는 데이터 하나를 가지고 오면 
												i를 더해주어 다음 조건을 만들어 다음 번호 것만 가져오게 한다 -->
													<c:forEach var="categoryList" items="${cateList}">
														<c:if test="${categoryList.catenum==i}">
															<li value="${categoryList.catenum}"><a href="#" onclick="return false">${categoryList.catename}</a><span>&gt;</span></li>
															<c:set var="i" value="${i+1 }" />
														</c:if>
													</c:forEach>
													<c:remove var="i" />
												</c:if>
											</ul>

											<!-- 중분류 카테고리 -->
											<ul id="mcategory"></ul>
										</div>

										<!-- 중분류 카테고리 선택하면 선택된 사항이 삽입되는 위치 -->
										<ul id="categoryManagement"></ul>

									</div>
									<!-- categoryList 끝 -->
								</div>
							</div>
							<!-- 카테고리 선택 끝 -->

							<!-- 수익 매출 분석 -->
							<div id="salesBox1">
								<div class="wrapTitle">
									<div id="sales1Title">
										<p>
											<strong>수익 매출분석</strong>
										</p>
									</div>
									<button class="normalBtn" id="pdfDown">PDF 저장</button>
								</div>
								<div class="wrapContainer">
									<div id="chartContainer">
										<canvas id="myChart" style="width: 400px; height: 200px;"></canvas>

										<script> // 차트 선언, 카테고리, 날짜, 차트, 엑셀 관여하는 스크립트
						
										let ctx = document.getElementById("myChart").getContext("2d");
										myChart = new Chart(ctx, {
											type: 'line',
											data:{
												labels: [], // 몇년 몇월 몇일 표시하는 데이터
												datasets: [] // 차트에 그려지는 데이터를 표시하는 데이터
											},
											options: {
												scales:{
													y:{
														beginAtZero: true // 차트 숫자는 0부터 표시
													}
													
												}
												
											}
										});
										
										</script>
										
										<c:if test="${resultStr0 != null || resultStr1 != null || resultStr !=null}">
											<script>
												
											let data = {
													label : '3개월 매출 내역',
													data : [${resultStr0},${resultStr1},${resultStr2}],
													borderColor : [
														'rgba(255,99,132,1)',
													]
											}
											
											myChart.data.labels.push('${resultDate0}','${resultDate1}','${resultDate2}');
											myChart.data.datasets.push(data);
											myChart.update();
												
											</script>
										</c:if>
									</div>
								</div>
							</div>
							<!-- 수익 매출분석 끝 -->
							<!-- 매출분석 시작 -->
							<div id="salesBox2">
								<div class="wrapTitle">
									<div id="sales2Title">
										<p>
											<strong>매출분석</strong>
										</p>
									</div>
									<button class="normalBtn" id="excelDown">엑셀 저장</button>
									<select id="excelViewNum" onchange="javascript:changeViewListNum(this)">
										<option selected="selected">10</option>
										<option>50</option>
										<option>100</option>
									</select>
								</div>
								<div class="wrapContainer">
									<div id="excelContainer">
										<ul id="excelList">
											<li>매출일자</li>
											<li>주문번호</li>
											<li>상품명</li>
											<li>수량</li>
											<li>단가</li>
											<li>매출금액</li>
											<c:if test="${mainData != null }">
												<c:forEach var="initialData" items="#{mainData }">  
													<li>${initialData.orderconfirm}</li>
													<li>${initialData.ordernum}</li>
													<li>${initialData.productname }</li>
													<li>${initialData.orderquantityStr }</li>
													<li>${initialData.orderpriceStr }</li>
													<li>${initialData.realpaymentStr }</li>
												</c:forEach>
											</c:if>
										</ul>
									</div>
									<div id="totalMoney"><c:if test="${totalMoney!=null }">총 합계금액 : ${totalMoney }</c:if></div>
									<!--------------페이징 표시-------------------->
									<c:if test="${pageVO != null }">
										<div class="page_wrap">
											<div class="page_nation">
											   <c:if test="${pageVO.pageNum>1}"><!-- 이전페이지가 있을때 -->
											   		<a class="arrow prev" href="/sshj/salesCateAnalasysA?pageNum=${pageVO.pageNum-1}"></a>
											   </c:if>
											   <!-- 페이지 번호                   1                                    5                     -->
									           <c:forEach var="p" begin="${pageVO.startPageNum}" step="1" end="${pageVO.startPageNum + pageVO.onePageNum-1}">
									              <c:if test="${p<=pageVO.totalPage}">
									                 <c:if test="${p==pageVO.pageNum}"> <!-- 현재페이지일때 실행 -->
									                    <a class="active">${p}</a>
									                 </c:if>   
									                 
									                 <c:if test="${p!=pageVO.pageNum}"> <!-- 현재페이지가 아닐때 실행 -->
									                    <a class="arrow" href="/sshj/salesCateAnalasysA?pageNum=${p}">${p}</a>
									                 </c:if>
									              </c:if>
									           </c:forEach>
									           <c:if test="${pageVO.pageNum < pageVO.totalPage}">
									              <a class="arrow next" href="/sshj/salesCateAnalasysA?pageNum=${pageVO.pageNum+1}"></a>
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
								</div>
							</div>
						</div>
					</div>
				</article>
			</section>

		</div>
	</div>
</div>