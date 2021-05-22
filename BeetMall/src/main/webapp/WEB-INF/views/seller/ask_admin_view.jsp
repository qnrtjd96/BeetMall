<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		<!-- font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">

	
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/basicStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/headerStyle.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/jcss/csStyle.css">
</head>

<script>
	function askDel(){
		if(confirm("문의글을 삭제하시겠습니까?")){
			location.href="ask_admin_delete?qmnum=${saavo.qmnum}"
		}
		
	};
</script>
<body>
	<div class="main">
	<!------------------ 고객센터 상단 사이드바 ----------------------->
      <nav class="cs_nav">
		<div id="headerMember">
			<c:if test="${logStatus != 'Y'}">
				<div class="sellerLoginBtn">
					<!-- 로그인 전 -->
					<input type="button" value="회원가입" class="sellerMenuButtons" /> <input type="button" value="로그인" class="sellerMenuButtons" /> <input type="button" value="고객센터" class="sellerMenuButtons" />
				</div>
			</c:if>
			<c:if test="${logStatus == 'Y' }">
				<div class="sellerLoginBtn">
					<!-- 로그인 후 -->
					<c:if test="${logType==2}">
						<input type="button" value="판매자 페이지로 이동하기" class="sellerMenuButtons" />
					</c:if>
					<a href="myinfoEdit">${logName}님</a><span id="sellerMenuButtons">▼</span> <input type="button" value="로그아웃" class="sellerMenuButtons" /> <input type="button" value="고객센터" class="sellerMenuButtons" onClick="location.href='<%=request.getContextPath()%>/notice'" />
				</div>
			</c:if>
		</div>
         <!-- headerMember end -->
         <!-- 고객센터 상단 메뉴 판매자홈, 공지사항, 자주묻는질문, 문의하기 -->
         <ul id="seller_cs_menu">
            <li><a href="<%=request.getContextPath()%>/sellerMain">Beetmall</a></li>
            <li><a href="notice">공지사항</a></li>
            <li><a href="faq">자주묻는 질문</a></li>
            <li><a href="ask_admin_list">문의하기</a></li>
         </ul>
      </nav>
  
   </div> 
	<!-- 가운데 메인 div -->
	<div id="article">
		<div class="cs_wrapTitle">문의하기</div>
		<!-- 문의하기 상단 메세지 -->	
		<div class="cs_message">
			무엇을 도와드릴까요?<br/>
			<span id="notice">고객님께서 작성하신 질문은 관리자가 답변을 한 후에는 수정 또는 삭제하실 수 없습니다.</span>
		</div>
		<!-- 내글 보기 -->	
		<fieldset>
		<input type="hidden" value="${saavo.qmnum}"/>
			<table>
				<tbody>
					<tr>
						<th colspan="4">고객 문의</th>
					</tr>
					<tr class="tr_head">
						<th class="menu" >제목</th>
						<td class="td" colspan="3" ><span >${saavo.qmtitle}</span></td>
					</tr>
					<tr class="tr_head">
						<th class="menu">작성자</th>
						<td class="td"><span >${saavo.userid}</span></td>
							<th class="menu">문의날짜</th>
						<td class="td"><span>${saavo.qmdate}</span></td>
					</tr>
				
					<tr>
						<td class="question_content" colspan="4">
							<span class="content" >
							${saavo.qmcontent}
							</span>
						</td>	
					</tr>
				</tbody>
				<!-- 답변 -->
				</br>
				<tbody style="margin-top:20px;">
					<tr>
						<th colspan="4">
						답변
						</th>
					</tr>
					<tr class="tr_head">
						<th class="menu">문의번호</th>
						<td  class="td"><span>${saavo.qmnum}</span></td>
						<th class="menu">답변일</th>
						<td class="td" >
							<span>
								<c:if test="${vo.qmanserdate==null}">
										답변예정
								</c:if>
								<c:if test="${vo.qmanserdate!=null}">
										${vo.qmanserdate}
								</c:if>
							</span>
						</td>
					</tr>
				
					<tr>
						<td class="question_content" colspan="4">
							<span class="content" >
								<c:if test="${vo.qmanswer==null}">
								<strong>
								아직 답변이 도착하지않았습니다<br/>
								 <br/>
								</strong>
								</c:if>
								<c:if test="${vo.qmanswer!=null || vo.qmanswer!=''}">
									${vo.qmanswer}
								</c:if>
							</span>
						</td>	
					</tr>
				</tbody>
			</table>
		</fieldset>
			<div class="bottom_wrap">
				<input type="button" value="확인" id="btn" onClick="location.href='<%=request.getContextPath()%>/ask_admin_list'"/>
			<c:if test="${vo.qmanswer==null}">
				<input type="button"  value="수정하기" id="btn" onClick="location.href='<%=request.getContextPath()%>/ask_admin_edit?qmnum=${saavo.qmnum}'"/>
				<input type="button" value="삭제하기" id="btn" onClick="askDel()"/>
			</c:if>	
			</div>
		</div>
	</div>
</body>
</html>