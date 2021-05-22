<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/inc/menu_c.jspf"%>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<script>
	
</script>

</head>
<style>
/*  기본설정----------------------------------------------                 */
a:hover, a:active, a:visited, a:link {
    text-decoration: none;
    color: black;
}
#mypageMenubar{
	display:block;
	font-size:17px;
}

#searchBtn {
	top: 0px;
	left: 0px;
}

.section {
	width: 1080px;
	margin: 0 auto;
}
/* ------------------페이징처리부분-------------------- */
.page_wrap {
	text-align: center;
	font-size: 0;
	padding-bottom: 30px;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 35px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
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

/* ---------------페이징 처리끝-------------------- */

/* 전체설정----------------------------------------------                 */
ul>li {
	list-style-type: none;
}


#reciList, #recivb, #reciContenView {
	padding: 0px;
	margin: 0px;
}



#recipettile>b {
	float: left;
	width: 100%;
	color: rgb(252, 118, 45);
	height: 20px;
	margin-top: 10px;
}


/*  큰제목----------------------------------------------                 */
#recit {
	width: 300px;
	padding: 0px;
	margin: 0px;
	color: rgb(252, 118, 45);
}

/*  게시글 리스트----------------------------------------------                 */
#slist {
	width: 100%;
	height: 15px;
	margin-bottom: 10px;
}

#reciListT {
	padding: 0px;
	margin-top: 10px;
	border-bottom: 1px solid #ddd;
}

#reciList, #reciListT {
	width: 100%;
}

#reciList>li, #reciListT>li {
	width: 10%;
	float: left;
	height: 30px;
	line-height: 30px;
}

#reciList>li {
	border-bottom: 1px solid #ddd;
	margin-bottom: 5px;
}

#reciList>li:nth-child(6n+2), #reciListT>li:nth-child(6n+2) {
	width: 50%;
}

/*  글안에 내용----------------------------------------------                 */
#reciContenView {
	width: 100%;
	height: 40px;
	background-color: #eee;
	border-bottom: 1px solid #ddd;
}

#reciContenView>li {
	width: 10%;
	float: left;
	line-height: 40px;
}

#reciContenView>li:nth-child(6n+2) {
	width: 50%;
}

/*  해당 게시글 보기----------------------------------------------                 */
#rcontent {
	float: left;
	padding: 5%;
	width: 100%;
	text-align: center;
}

/*  하단표시----------------------------------------------                 */
#recivb {
	width: 100%;
	padding-top: 10px;
	margin-bottom: 15px;
	border-top: 1px solid #ddd;
}

#recivb>li{
	width: 2%;
	float: left;
	line-height: 20px;
	height:20px;
}



#recivb>li:nth-child(6n+1),#goodidli{
	width: 90px; 
	float:left;
}

#recivb>li:nth-child(6n+2),#keepidli{
	width: 90px;
	float:left;
}

#recivb>li>div>img {
	width: 20px;
}

#recivb>li>a>img {
	width: 20px;
}

#share1{
margin-left:800px;
height:20px;
}

/*  검색표시----------------------------------------------                 */
#searchbox {
	text-align: center;
	margin-bottom: 30px;
	margin-top: 10px;
}

#searchbtn {
	height: 30px;
	width: 69px;
}

#searchbtn {
	padding: 3px 10px;
	color: #666666;
	border-radius: 8px;
	background: #fff;
	box-shadow: 0 0px 3px 0 rgba(0, 0, 0, 0.5);
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border: none;
}
/*버튼*/
#searchbtn:hover {
	background: gray;
	color: white;
	display: inline-block;
}

/*표*/

table{
	width:100%%;	
	border-spacing: 0;
	text-indent: initial;
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
}
th, .th{
	display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
  		background-color:#f6f6f6;;
  		/*#fcfcfc*/
}
thead{
	border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
    width:100%;
}
tr{
	display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    height:50px;
}
.td, .content{
	padding-left:20px;
}
.content{
	padding: 20px 0 20px;
}
td, .td{
	height:50px;
	width:930px;
}
.tr_head{
	font-weight:bold;
	border-top:1px solid lightgray;
	border-bottom:1px solid lightgray;
}
.tr_head li{
	float:left;
}
.menu, .th{
	width:150px; text-align:center;
}
.td, .th{ line-height:50px;}
.td{
	width:930px; line-height:50px;
}

#btnviewbox{
width:100%;
float:left;
height:45px;
padding-top:5px;
paddig-bottom:5px;
}

</style>

<body onload="countg()">

	<div class="section">

		<!-- ------------------------큰제목----------------------------------- -->
		<div id="recipettile">
			<b>레시피</b>
		</div>
		<!-- ------------------------게시글 리스트----------------------------------- -->
		<div>

			


			<div id="slist">
			</div>
			<!-- slist -->



		</div>



		<!-- -----------------------------페이지 표시----------------------------------------- -->

		<div class="page_wrap">
			
		</div>


		<!-- ------------------------게시글 보기----------------------------------- -->

		<fieldset>
			<table>
				<tbody>
					<tr class="tr_head">
						<th class="menu">제목</th>
						<td><span class="td" id="td">${vo.recipetitle}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성자</th>
						<td ><span class="td" id="td">${vo.userid}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">추천수</th>
						<td ><span class="td" id="td">${vo.reciperecommend}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">조회수</th>
						<td ><span class="td" id="td">${vo.recipehit}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성일</th>
						<td ><span class="td" id="td">${vo.recipewritedate}</span></td>
					</tr>
					<tr>
						<td colspan="2">
							<span class="content" >
							
							${vo.recipecontent}							
						
							</span>
						</td>	
					</tr>
				</tbody>
			</table>
		</fieldset>
		 
		 
		<c:if test="${logId==vo.userid}">
			<div id="btnviewbox">
					<input type="button"  value="수정하기" class="btn" onClick="location.href='<%=request.getContextPath() %>/recipeEdite?recipenum=${vo.recipenum}'"/>
					<input type="button" value="삭제하기" class="btn" id="btn" onClick="Deletebtn()"/>
			</div>
		</c:if>
		
		


		<!-- ------------------------하단 표시들----------------------------------- -->
		<c:if test="${logId!=null}">
			
		
		<ul id="recivb">
			<li id="goodidli"><div id="goodid" onclick="goodset()">추천해요<img src="img/dunlike.png" id="goodimg"></div></li>
			<li id="keepidli"><div id="keepid" onclick="keepset()">즐겨찾기<img src="img/ccart2.png" id="keepimg"></div></li>
			<li id="share1"><a href=""><img src="img/cicon01.png"></a></li>
			<li><a href=""><img src="img/cicon02.png"></a></li>
			<li><a href=""><img src="img/cicon03.png"></a></li>
			<li><a href=""><img src="img/cicon05.png"></a></li>
		</ul>
		
		<div id="chatInfoTitle"><span id="chatHeaderSpan"><span id="reportChat">신고하기</span><span id="theyId"></span></span></div>
		
		
        </c:if>

		<!-- ------------------------검색 기능----------------------------------- -->
		<div id="searchbox">
		    <input type="button" id="listbtn" value="목록으로" onClick="location.href='<%=request.getContextPath() %>/recipeList'"/>
		</div>


<!-- 신고하기 부분 -->
	<div style="height:350px;width:500px;border:1px solid red;position:absolute;top:400px;left:800px;background-color:white;display:none;" id="reportDiv">
		<form style="height:400px;width:500px;float:left;" method="post" action="customreport" id="reportForm">
			<h2 style="margin-left:10px;">신고하기</h2>
			<span style="float:left;font-size:20px;margin-left:10px;">신고사유</span>
				<input type="hidden" name="userid" value="${logId}"/>												<!-- 신고자 아이디 -->
				<input type="hidden" name="reporteduser" id="${vo.userid}"/>											<!-- 신고할 사람 아이디 -->
				<input type="hidden" name="reportboard" value="레시피"/>							<!-- 신고한 게시판 -->
				<input type="hidden" name="reportboardnum" id="reportboardnum" value="${vo.recipenum}"/>										<!-- 신고한 글 번호 -->
				<select name="reportreason"  style="float:right;margin-right:10px;font-size:20px;">	<!-- 신고사유 -->
					<option value="비방/욕설">비방/욕설</option>
					<option value="허위">허위</option>
					<option value="성희롱">성희롱</option>
					<option value="기타">기타</option>
				</select>
			<textarea name="reportcontent" id="reportcontent" style="height:200px;width:480px;margin-left:10px; margin-right:10px;font-size:15px;" maxlength="149"></textarea><!-- 신고내용 -->
			<div style="font-size:20px;float:right;margin-right:10px;">
				<input type="button" value="신고하기" style="background-color:#ff3a3a;color:white;border:1px solid #aaa;"id="reportsubmit"/>
				<input type="button" value="닫기"style="background-color:#ddd;color:white;border:1px solid #aaa;"id="reportClose"/>
			</div>
		</form>
	</div>
	<!-- 신고하기 밑에 스크립트까지임 -->

	</div>
	
<script>

$(document).on('click','#chatHeaderSpan', function(){
	$("#reportDiv").css("display","block");
});

$(function(){
	$("#reportsubmit").click(function(){	// 신고처리하는 ajax부분
		var formdata = $("#reportForm").serialize();
		console.log("formdata === "+formdata);
		$.ajax({
			url: "customreport",
			type : "POST",
			cache:false,
			data:formdata,
			success:function(result){
				console.log(result);
				if(result == 1){
					alert('고객님의 신고가 접수되었습니다');
					location.href="myChatList";
				}else if(result != 1){
					alert('신고에 실패했습니다. error_code : 176');
					$("#reportcontent").val('');
					$("#reportDiv").css("display","none");
				}
			}, error:function(error){
				console.log(error);
			}
		})
		$("#reportcontent").val('');
		$("#reportDiv").css("display","none");
	})
	$("#reportClose").click(function(){			// 신고 닫기 부분
		$("#reportcontent").val('');
		$("#reportDiv").css("display","none");
	})
	$(document).on('click','input[value=신고하기]', function(){	// 신고창 여는 부분(여기서 신고할 유저아이디, 신고할 글번호 세팅해줌)
		var reporteduser = $(this).parent().prev().children().eq(0).html();
		$("#reporteduser").val(reporteduser);
		var reportboardnum = $(this).prev().prev().prev().val();
		$("#reportboardnum").val(reportboardnum);
		$("#reportDiv").css("display","block");
		
	});
})

function Deletebtn(){
	
		var recipenum=${vo.recipenum};
        //alert(recipenum+"r");
        
		  var url = "recipeDelete";
		  var data = "recipenum="+recipenum;
		  
			console.log(url,data);
			if(confirm("해당 게시글을 삭제 하시겠습니까?")){
				$.ajax({
					url:url,
					data:data,
					success:function(result){
						//console.log('내가쓴 레시피 삭제 성공');
						if(result>0){//삭제
							alert('내가쓴 레시피 삭제 성공');
							location.href="/sshj/recipeList";
						}else {//삭제실패
							alert('실패');
							location.href="/sshj/recipeList";
						}
						
					},error:function(e){
						console.log(e.responseText);
						console.log("내가쓴 레시피 삭제 실패");
					}
				});
			};
	
	
};

function countg(){
	if(${countrg>=1}){
		  var good="<div id='nogoodid' onclick='nogoodset()'>추천해요<img src='img/dlike.png' id='nogoodimg'></div>"
		  document.getElementById("goodidli").innerHTML=good;
	}
	
	if(${countrk>=1}){
		 var keep="<div id='nokeepid' onclick='nokeepset()''>즐겨찾기<img src='img/ccart.png' id='nokeepimg'></div>"
		 document.getElementById("keepidli").innerHTML=keep;
	}
	
}

function goodset(){
	
	  var good="<div id='nogoodid' onclick='nogoodset()'>추천해요<img src='img/dlike.png' id='nogoodimg'></div>"
	  document.getElementById("goodidli").innerHTML=good;
		
	    var url = "recigoodOk";		
		var data = "num=${vo.recipenum}";
		console.log(url, data);
		$.ajax({
			url:url,
			data:data,
			success:function(result){
				console.log('추천수 올리시 성공---> ');
				
			},error:function(e){
				console.log(e.responseText);
				console.log("추천수 올리시 실패");
			}
		})
		
		 var url = "recigoodOk2";		
		 var data= "id=${logId}&num=${vo.recipenum}";
		console.log(url,data);
		$.ajax({
			url:url,
			data:data,
			success:function(result){
				console.log('추천기록 올리기 성공---> ');
				
			},error:function(e){
				console.log(e.responseText);
				console.log("추천기록 올리기 실패");
			}
		})
		
	
	  }
	  
function nogoodset(){
	  var good="<div id='goodid' onclick='goodset()'>추천해요<img src='img/dunlike.png' id='goodimg'></div>"
	  document.getElementById("goodidli").innerHTML=good;
	  
		 var url = "recigoodDelete";		
		 var data= "id=${logId}&num=${vo.recipenum}";
		console.log(url,data);
		$.ajax({
			url:url,
			data:data,
			success:function(result){
				console.log('추천기록 빼기 성공---> ');
				
			},error:function(e){
				console.log(e.responseText);
				console.log("추천기록 빼기 실패");
			}
		})
		
		
	  }


function keepset(){
	var keep="<div id='nokeepid' onclick='nokeepset()''>즐겨찾기<img src='img/ccart.png' id='nokeepimg'></div>"
	document.getElementById("keepidli").innerHTML=keep;
	
		var url = "recikeepOk";		
		var data= "id=${logId}&num=${vo.recipenum}";
		console.log(url,data);
		$.ajax({
			url:url,
			data:data,
			success:function(result){
				console.log('장바구니 올리기 성공---> ');
				
				
			},error:function(e){
				console.log(e.responseText);
				console.log("장바구니 실패");
			}
		})
		
	
	  }
	 
function nokeepset(){
	var keep="<div id='keepid' onclick='keepset()''>즐겨찾기<img src='img/ccart2.png' id='keepimg'></div>"
	document.getElementById("keepidli").innerHTML=keep;
	
	var url = "recikeepDelete";		
	 var data= "id=${logId}&num=${vo.recipenum}";
	console.log(url,data);
	$.ajax({
		url:url,
		data:data,
		success:function(result){
			console.log('장바구니 빼기 성공---> ');
			
		},error:function(e){
			console.log(e.responseText);
			console.log("장바구니 빼기 실패");
		}
	})
	
	
	  }

	  


</script>
</body>
</html>