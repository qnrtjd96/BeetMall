<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	.regiImg{
		position:absolute;
		left:50px;
		top:40px;
	}
	.regiLink{
		position:absolute;
		width:400px;
		text-align:center;
		top:400px;
	}
	#costomer, #seller{
		height:500px;
		width:400px;
		float:left;
		margin:0 60px;
		text-align:center;
		position:relative;
	}

	div a:active, div a:visited, div a:hover, div a:link {
		color:black;
		text-decoration: none;
	}
	#costomerbutton, #sellerbutton{
		width:150px;
		height:50px;
		line-height:50px;
		background-color:rgb(252,118,45);
		color:white;
		margin:auto;
		cursor:pointer;
	}
	#what_Type{
		overflow: auto;
	}
	.radiusClass{
		border-radius:5px;
		 
	}
</style>
<script>
	$(function(){
		$("#costomerbutton").click(function(){
			location.href="cregister";
		})
		$("#sellerbutton").click(function(){
			location.href="sregister";
		})
	});
</script>
<div class="section">
	<h1>회원가입</h1>
	<hr/>
	<h3 style="text-align:center">비트몰에 오신것을 환영합니다.</h3>
	<h4 style="text-align:center;margin-bottom:50px;">회원가입하신 후 비트몰의 다양한 서비스를 이용해보세요.</h4>
	<div id="what_Type">
		<div id="costomer">
			<img src="/sshj/img/dconsumer.png" style="height:300px;width:300px" class="regiImg"/>
			<div class="regiLink"><div id="costomerbutton"class="radiusClass">구매자 회원가입</div></div>
		</div>
		<div id="seller">
			<img src="/sshj/img/dentrepreneur.png" style="height:300px;width:300px" class="regiImg"/>
			<div class="regiLink"><div id="sellerbutton"class="radiusClass">판매자 회원가입</div></div>
		</div>
	</div>
	
</div>

</body>
</html>