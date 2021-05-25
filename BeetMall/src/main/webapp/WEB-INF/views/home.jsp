<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	.slider{
		width:100%;
		height:450px;
		overflow:hidden;
		position:relative; 
	}
	.slider>div:nth-child(2){
		width:5760px;
		height:450px;
		position:relative;
	}
	.slider img{ 
		height:450px;
		margin:0;
		padding:0;
		width:1920px;
	}
	#prevBtn, #nextBtn{
		width:30px;
		height:30px;
		background-repeat:no-repeat;
		top:200px;
		position:absolute;
		z-index:3;
		background-color:white;
		background-position:-1px -1px;
	}
	#prevBtn{
		left:110px;
		background-image:url(/sshj/img/dleft-arrow2.png);
	}
	#nextBtn{
		background-image:url(/sshj/img/dright-arrow2.png);
		left:1100px;
	}
	.nextBtn, .prevBtn{
		width:30px;
		height:30px;
		top : 112px;
		background-repeat:no-repeat;
		position:absolute;
		z-index:3;
		background-color:white;
		background-position:-1px -1px;
	}
	.nextBtn{
		background-image:url(/sshj/img/dright-arrow2.png);
		left:1040px;
	}
	.prevBtn{
		background-image:url(/sshj/img/dleft-arrow2.png);
		left:10px;
	}
	#banner{
		position:relative;
		width:100%;
	}
	.roundImg{
		border-radius:100%;
		opacity:70%;
	}
	.productList{
		padding-left:10px;
		padding-right:10px;
		float:left;
		width:1080px;
		height:360px;
		position:relative;
		overflow:hidden;
		margin-bottom:50px;
	}
	.product{
		position:relative;
	}
	.product, .product>div{
		float:left;
	}
	
	.productPanel>div:nth-child(4n+1), .productPanel img{
		width:255px;
		height:250px;
	}
	.productPanel>div:nth-child(4n+2){
		width:255px;
		height:40px;
		font-size:16px;
		font-weight:800;
		padding-top:5px;
	}
	.productPanel>div:nth-child(4n+3){
		width:255px;
		height:40px;
		font-size:15px;
		font-weight:800;
		text-align:right;
	}
	.productPanel>div:nth-child(4n){
		width:255px;
		height:30px;
		font-size:12px;
		color:#999;		
	}
	.productPanel{
		width:255px;
		height:360px;
		margin-left:5px;
		margin-right:5px;
	}
	h2{
		text-align:center;
		line-height:100px;
	}
	a:active , a:link, a:hover, a:visited{
		color:black;
		text-decoration: none;
	}
	.product{
		width:3180px;		/* 상품 전체 */
		height:360px;
		position:relative;
	}
	.productSetWidth{
		width:1060px;		/* 상품 표현 너비*/
		overflow:hidden;
	}
	.todayRecipt{
		width:1080px;
		height:360px;
		padding:0 12px;
		margin-bottom:50px;
	}
	.reciptList>div:nth-child(3n+1), .reciptList>div:nth-child(3n+1) img{
		width:342px;
		height:250px;
	}
	.reciptList>div:nth-child(3n+2){
		width:342px;
		height:40px;
		font-size:1.3em;
		font-weight:600;
		line-height:40px;
	}
	.reciptList>div:nth-child(3n){
		width:342px;
		height:30px;
		text-align:right;
		position:relative;
	}
	.reciptList{
		width:342px;
		height:330px;
		float:left;
		margin:0 5px;
	}
	.like, .unlike{
		height:20px;
		width:20px;
		background-size:20px 20px;
		float:right;
		position:absolute;
		left:280px;
		top:2px;
	}
	.like{
		background-image:url(/sshj/img/dlike.png);
	}
	.unlike{
		background-image:url(/sshj/img/dunlike.png);
	}
	.reciptList>div>div{
		float:left;
	}
	.likeCount{
		color:red;
		padding-left:5px;
		line-height:20px;
		height:20px;
	}
	.bClassSale{
		background-color:#f4f4f4;
		height:400px;
		width:100%;
	}
	#bClassSale{
		position:relative;
	}
	#bTitle{
		padding-top:30px;
	}
	#bSubject{
		margin-left:220px;
		font-size:2em;
		font-weight:800;
	}
	#bSpices{
		margin-left:220px;
		margin-top:10px;
		
	}
	#bSaleInfo{
		margin-left:220px;
	}
	#bSaleInfo>span:nth-child(1){
		color:red;
		font-size:3em;
		font-weight:900;
		position:absolute;
		left:470px;
		top:200px;
	}
	#bSaleInfo>span:nth-child(2){
		color:red;
		text-align:right;
		position:absolute;
		font-size:1.4em;
		left:688px;
		top:210px;
	}
	#bSaleInfo>span:nth-child(3){
		color:black;
		text-align:right;
		position:absolute;
		left:713px;
		top:240px;
		text-decoration:line-through;
	}
	#bNotice{
		margin-top:180px;
		color:rgb(46, 204, 113);
		font-size:1em;
	}
	#bInfoImg{
		position:absolute;
		left:800px;
		top:20px;
		width:360px;
		height:360px;
	}
	#bInfoTitle{
		position:absolute;
		left:960px;
		top:20px;
		height:50px;
		line-height:50px;
		width:200px;
		font-size:1.5em;
		text-weight:800;
		text-align:center;
		background-color:rgb(224,102,102);
		opacity: 80%;
		color:white;
	}
	#bInfoTime{
		position:absolute;
		left:800px;
		top:330px;
		height:50px;
		line-height:50px;
		width:360px;
		font-size:1.5em;
		text-weight:800;
		text-align:center;
		background-color:rgb(224,102,102);
		opacity: 80%;
		color:white;
	}
	#sliderImgs img{
		width:100%;
	}
	#homeVideo{
		width:100%;
		height:650px;
		position: relative;
	}
	#videoPlay{
		width:100%;
		height:650px;
	}
	#videoModal{
		width:100%;
		height:650px;
		background-color:black;
		opacity: 50%;
		position:absolute;
		
	}
	video{
		width:100%;
		height:450px;
		object-fit:fill;
	}
	nonlink:active {
	
	}
</style>
</head>
<script>
	var wid100= window.outerWidth;
	var bannerLength = 8; // 배너 개수
	var maxRan = 7;	// 랜덤 범위(최대값 - 1)
	var ran = parseInt(Math.random()*maxRan);	// 배너의 수에 따라 조절할 수 있어야함
	var proWidth = 265; /* 상품 너비 */ 
	$(function(){		
		imgWidthSet()
		function banner(idx){
			var left= -(idx*wid100);
			$(".slider>div").eq(1).animate({marginLeft:left+"px"},1000);
		}
		banner(ran);
		
		$("#prevBtn").click(function(){
			ran--;
			if(ran<0){
				ran=maxRan;
			}
			banner(ran);
		});
		$("#nextBtn").click(function(){
			ran++;
			if(ran>maxRan){
				ran=0;
			}
			banner(ran);
		});
		
		
		function todayProduct(idx){
			var left= -(idx*proWidth);
			$("#todayProduct").eq(0).animate({marginLeft:left+"px"},1000);
		}
		
		var todaySelect = 4;
		todayProduct(todaySelect);
		
		$("#todayPrev").click(function(){
			todaySelect-=4;
			if(todaySelect < 0){
				todaySelect = 8;
			}
			todayProduct(todaySelect);
		});
		$("#todayNext").click(function(){
			todaySelect+=4;
			if(todaySelect > 8){
				todaySelect = 0;
			}
			todayProduct(todaySelect);
		});
		
		function newProduct(idx){
			var left= -(idx*proWidth);
			$("#newProduct").eq(0).animate({marginLeft:left+"px"},1000);
		}
		var newProductSelect = 4;
		newProduct(todaySelect);
		
		$("#newProductPrev").click(function(){
			newProductSelect-=4;
			if(newProductSelect < 0){
				newProductSelect = 8;
			}
			newProduct(newProductSelect);
		});
		$("#newProductNext").click(function(){
			newProductSelect+=4;
			if(newProductSelect > 8){
				newProductSelect = 0;
			}
			newProduct(newProductSelect);
		});
		
		function bestProduct(idx){
			var left= -(idx*proWidth);
			$("#bestProduct").eq(0).animate({marginLeft:left+"px"},1000);
		}
		var bestSelect = 4;
		bestProduct(bestSelect);
		
		$("#bestProductPrev").click(function(){
			bestSelect-=4;
			if(bestSelect < 0){
				bestSelect = 8;
			}
			bestProduct(bestSelect);
		});
		$("#bestProductNext").click(function(){
			bestSelect+=4;
			if(bestSelect > 8){
				bestSelect = 0;
			}
			bestProduct(bestSelect);
		});
		
		
		//좋아용 싫어용
		/* $(".reciptList>div:nth-child(3n)>div:first-child").click(function(){
			console.log("이벤트");
			if(ran%4==1){
				$(this).toggleClass('like').toggleClass('unlike').animate({left:"276px", top:"-2px"},100).animate({left:"280px", top:"2px"},100);	
			}else if(ran%4==2){
				$(this).toggleClass('like').toggleClass('unlike').animate({left:"284px", top:"-2px"},100).animate({left:"280px", top:"2px"},100);
			}else if(ran%4==3){
				$(this).toggleClass('like').toggleClass('unlike').animate({left:"276px", top:"6px"},100).animate({left:"280px", top:"2px"},100);
			}else{
				$(this).toggleClass('like').toggleClass('unlike').animate({left:"284px", top:"6px"},100).animate({left:"280px", top:"2px"},100);
			}
		}) */
	});
	
	$(window).resize(function(){
		if(wid100>1080){
			imgWidthSet();
		}
		if(wid100<=1080){
			imgWidthMinSet();
			$("body").css("overflow-x","hidden");
			var w = window.innerWidth;
			var h = window.innerHeight;
			window.resizeTo(1080,h);
		}
	});
	
	function imgWidthSet(){
		wid100 = window.outerWidth;
		$("#sliderImgs img").css("width",wid100);
		$(".slider>div:nth-child(2)").css("width",(bannerLength*wid100));
		$(".slider>div").eq(1).css("margin-left",-(ran*wid100));
		$("#nextBtn").css("left",wid100-150);
	}
	
	function imgWidthMinSet(){
		wid100 = window.outerWidth;
		$("#sliderImgs img").css("width",1080);
		$(".slider>div:nth-child(2)").css("width",(bannerLength*1080));
		$(".slider>div").eq(1).css("margin-left",-(ran*1080));
		$("#nextBtn").css("left",1080-150);
	}
	
	$("#banner").hover(function(){
		console.log('올라옴');
	}, function(){
		console.log("나감");
	});
	
	
</script>
<div id="homeVideo" class="centerTarget">
	<div id="videoModal"></div>
	<video autoplay muted loop preload="auto" id="videoPlay">
		<source src="<%=request.getContextPath()%>/video/dvideo.webm" type="video/webm"/>
	</video>
</div>	
<div class="section">
	<h2>${toptitle}<span id="numm"></span></h2>
	<hr/>
	<div class="productList">
		<div class="prevBtn roundImg" id="todayPrev"></div>
		<div class="productSetWidth">
		<div class="product" id="todayProduct">
			<c:forEach var="vo" items="${topList}">
				<div class="productPanel">
					<div>
						<c:if test="${vo.productnum>0}">
							<a href="customproduct?productnum=${vo.productnum}">
								<img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" onerror="this.src='/sshj/img/derror.png'"/>
							</a>
						</c:if>
						<c:if test="${vo.productnum<0}">
							<a href=""onclick="return false;">
								<img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" onerror="this.src='/sshj/img/derror.png'"/>
							</a>
						</c:if>
					</div>
					<div class="wordcut">
						<c:if test="${vo.productnum>0}">
							<a href="customproduct?productnum=${vo.productnum}" class="wordcut">${vo.productname}</a>
						</c:if>
						<c:if test="${vo.productnum<0}">
							<a href="" class="wordcut" onclick="return false;">${vo.productname}</a>
						</c:if>
					</div>
						<c:if test="${vo.saleprice>0}">
							<div><span style="margin-right:5px;font-size:12px;text-decoration: line-through;">${vo.productprice}원</span><span style="color:red;">${vo.productprice-vo.saleprice}원</span></div>	
						</c:if>
						<c:if test="${vo.saleprice==0}">
							<div>${vo.productprice}원</div>
						</c:if>
					<div class="wordcut">${vo.productinfomation}</div>
				</div>			
			</c:forEach>
		</div>
		</div>
		<div class="nextBtn roundImg" id="todayNext"></div>
	</div>
	<div>
	<h2>가장 인기있는 레시피</h2>
		<hr/>
		<div class="todayRecipt">
			<c:forEach var="vo" items="${toprecipe}">
				<div class="reciptList">
					<div><a href="http://localhost:9090/sshj/recipeView?recipenum=${vo.recipenum}&id=<c:if test="${logId != null}">${logId}</c:if>"><img src="/sshj/img/${vo.recipemainimg}"onerror="this.src='/sshj/img/derror.png'"/></a></div>
					<div><a href="http://localhost:9090/sshj/recipeView?recipenum=${vo.recipenum}&id=<c:if test="${logId != null}">${logId}</c:if>">${vo.recipetitle}</a></div>
					<c:if test="${vo.recipehit > 999}">
						<div><div class="like"></div><span class="likeCount">999+</span></div>
					</c:if>
					<c:if test="${vo.recipehit < 999}">
						<div><div class="like"></div><span class="likeCount">${vo.recipehit}</span></div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div id="banner" class="centerTarget" style="margin:0 auto;">
	<div id="prevBtn" class="roundImg"></div>
	<div class="slider">
		<div></div>
		<div id="sliderImgs">
			<a href="/sshj/"><img src="/sshj/img/dbanner1.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner2.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner3.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner4.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner5.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner6.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner7.jpg"/></a><a href="/sshj/"><img src="/sshj/img/dbanner8.jpg"/></a>
		</div>
	<div id="nextBtn" class="roundImg"></div>
	</div>
</div>
<div class="section">
	<br/>
	<h2>${midtitle}<span id="numm"></span></h2>
	<hr/>
	<div class="productList">
		<div class="prevBtn roundImg" id="newProductPrev"></div>
		<div class="productSetWidth">
		<div class="product" id="newProduct">
			<c:forEach var="vo" items="${midList}">
				<div class="productPanel">
					<div>
						<c:if test="${vo.productnum>0}">
							<a href="customproduct?productnum=${vo.productnum}">
								<img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" onerror="this.src='/sshj/img/derror.png'"/>
							</a>
						</c:if>
						<c:if test="${vo.productnum<0}">
							<a href=""onclick="return false;">
								<img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" onerror="this.src='/sshj/img/derror.png'"/>
							</a>
						</c:if>
					</div>
					<div class="wordcut">
						<c:if test="${vo.productnum>0}">
							<a href="customproduct?productnum=${vo.productnum}" class="wordcut">${vo.productname}</a>
						</c:if>
						<c:if test="${vo.productnum<0}">
							<a href="" class="wordcut" onclick="return false;">${vo.productname}</a>
						</c:if>
					</div>
						<c:if test="${vo.saleprice>0}">
							<div><span style="margin-right:5px;font-size:12px;text-decoration: line-through;">${vo.productprice}원</span><span style="color:red;">${vo.productprice-vo.saleprice}원</span></div>	
						</c:if>
						<c:if test="${vo.saleprice==0}">
							<div>${vo.productprice}원</div>
						</c:if>
					<div class="wordcut">${vo.productinfomation}</div>
				</div>			
			</c:forEach>
		</div>
		</div>
		<div class="nextBtn roundImg" id="newProductNext"></div>
	</div>
	<br/>
	<h2>${bottomtitle}<span id="numm"></span></h2>
	<hr/>
	<div class="productList">
		<div class="prevBtn roundImg" id="bestProductPrev"></div>
		<div class="productSetWidth">
		<div class="product" id="bestProduct">
			<c:forEach var="vo" items="${bottomList}">
				<div class="productPanel">
					<div>
						<c:if test="${vo.productnum>0}">
							<a href="customproduct?productnum=${vo.productnum}">
								<img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" onerror="this.src='/sshj/img/derror.png'"/>
							</a>
						</c:if>
						<c:if test="${vo.productnum<0}">
							<a href=""onclick="return false;">
								<img src="/sshj/resources/sellerProductImgs/${vo.thumbimg}" onerror="this.src='/sshj/img/derror.png'"/>
							</a>
						</c:if>
					</div>
					<div class="wordcut">
						<c:if test="${vo.productnum>0}">
							<a href="customproduct?productnum=${vo.productnum}" class="wordcut">${vo.productname}</a>
						</c:if>
						<c:if test="${vo.productnum<0}">
							<a href="" class="wordcut" onclick="return false;">${vo.productname}</a>
						</c:if>
					</div>
						<c:if test="${vo.saleprice>0}">
							<div><span style="margin-right:5px;font-size:12px;text-decoration: line-through;">${vo.productprice}원</span><span style="color:red;">${vo.productprice-vo.saleprice}원</span></div>	
						</c:if>
						<c:if test="${vo.saleprice==0}">
							<div>${vo.productprice}원</div>
						</c:if>
					<div class="wordcut">${vo.productinfomation}</div>
				</div>			
			</c:forEach>
		</div>
		</div>
		<div class="nextBtn roundImg" id="bestProductNext"></div>
	</div>
		<h2>신규등록 레시피</h2>
		<hr/>
		<div class="todayRecipt">
			<c:forEach var="vo" items="${bottomrecipe}">
				<div class="reciptList">
					<div><a href="http://localhost:9090/sshj/recipeView?recipenum=${vo.recipenum}&id=<c:if test="${logId != null}">${logId}</c:if>"><img src="/sshj/img/${vo.recipemainimg}"onerror="this.src='/sshj/img/derror.png'"/></a></div>
					<div><a href="http://localhost:9090/sshj/recipeView?recipenum=${vo.recipenum}&id=<c:if test="${logId != null}">${logId}</c:if>">${vo.recipetitle}</a></div>
					<c:if test="${vo.recipehit > 999}">
						<div><div class="like"></div><span class="likeCount">999+</span></div>
					</c:if>
					<c:if test="${vo.recipehit < 999}">
						<div><div class="like"></div><span class="likeCount">${vo.recipehit}</span></div>
					</c:if>
				</div>
			</c:forEach>
		</div>
		<c:if test="${popup.popupimg !=null && popup.popupimg != ''}">
			<div id="popupdiv" style="height:${popup.popupheight+25}px;width:${popup.popupwidth-2}px;border:1px solid black;position:absolute;top:40px;left:40px;background-color:white;display:none;">
				<a href="${popup.popuplink }"><img src="/sshj/resources/popupimgs/${popup.popupimg}" style="height:${popup.popupheight}px;width:${popup.popupwidth-4}px;"/></a>
				<div style="height:25px;line-height:25px;width:${popup.popupwidth-2}px;text-align:right;padding-right:10px;">${popup.popupterm}일간 보지 않기<input type="checkbox" id="popupclose"/>
				<input type="hidden" value="${popup.popupterm}" id="datehidden"/><input type="hidden" value="${popup.popupimg}" id="popupimghidden"/></div>
			</div>
			<script>
				$(function(){
					var cookie = document.cookie;
					if(cookie.indexOf("beet")==-1){
						$("#popupdiv").css("display","block");
					}
					$("#popupclose").click(function(){
						var now = new Date();
						now.setDate(now.getDate+$("#datehidden").val());
						document.cookie = "event=beet;path=/;expires="+now+";";
						$("#popupdiv").css("display","none");
					});
					
				});
				
			</script>
		</c:if>
		<div>
			
		</div>
</div>
