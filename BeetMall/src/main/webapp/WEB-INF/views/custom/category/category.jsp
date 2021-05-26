<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header{
		display: none;
	}
	footer{
		display:none;
	}
	/* #productMain{
    	padding-left: 0px;
	} */
	.productname{
		font-size: 18px;
		font-weight: 600;
		color: brown;
	}
	
	#productMain div{
		text-align: left;
		margin-right: 65px;
		margin-bottom: 30px;
		height: 340px;
	}
</style>
	<c:forEach var="data" items="${list}">
		<div id="productDiv">
			<ul style="width:200px;">
				<li><img src="/sshj/resources/sellerProductImgs/${data.thumbimg}"></li>
				<li class="productname" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${data.productname}</li>
				<li style="font-size: 14px; font-size: large; font-weight: bold;">
					<c:if test="${data.saleprice==null || data.saleprice=='' || data.salefinish=='1' || data.salestart=='1'}">
						${data.productprice}원
					</c:if>
					<c:if test="${data.saleprice != null && data.saleprice != '' && data.salefinish !='1' && data.salestart !='1'}">
						<span style="color:red; font-size: 14px;">${data.productprice-data.proprice}원 할인</span>&nbsp;${data.proprice}원
					</c:if>
				</li>
				<li style="text-decoration: line-through; color: gray;">
					<c:if test="${data.saleprice != null && data.saleprice != ''}">
						${data.productprice}원
					</c:if>
				</li>
					<c:if test="${data.totalscore==null}">
						<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">☆☆☆☆☆</span></li>
					</c:if>
					<c:if test="${data.totalscore==1}">
						<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★☆☆☆☆</span></li>
					</c:if>
					<c:if test="${data.totalscore==2}">
						<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★☆☆☆</span></li>
					</c:if>
					<c:if test="${data.totalscore==3}">
						<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★☆☆</span></li>
					</c:if>
					<c:if test="${data.totalscore==4}">
						<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★☆</span></li>
					</c:if>
					<c:if test="${data.totalscore==5}">
						<li>리뷰 ${data.sumreview} &nbsp;&nbsp;&nbsp;<span id="coloor">★★★★★</span></li>
					</c:if>
				<li>${data.storeaddr}</li>
			</ul>
		</div>
	</c:forEach>