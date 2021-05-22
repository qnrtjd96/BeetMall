<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#loginDiv{
		height:575px;
		overflow:auto;
	}
	#loginDiv>h2{
		text-align: center;
		padding:75px 0;
	}
	.searchBtn, .confirmBtn{
		height:50px;
		width:300px;
		float:left;
		margin-left:390px;
		margin-right:390px;
		margin-top:1px;
	}
	#FindBtn{
		height:50px;
		width:358px;
		float:left;
		background-color: rgb(252,118,45);
		color:white;
		font-weight:700;
		border:none;
		margin-left:370px;
	}
	#idInput, #emailInput{
		height:50px;
		width:358px;
		margin-left:370px;
	}
	#idInput, #emailInput{
		padding-left:10px;
	} 
	#searchBtn{
		background-color: rgb(252,118,45);
		color:white;
		font-weight:700;
	}
	#idInput, #emailInput{
		margin-top:5px;
	}
	#searchBtn{
		margin-top:30px;		
	}
	.popupForm{
		height:250px;
		width:400px;
		background-color:rgb(250, 250, 250);
		border:1px solid black;
		position: absolute;
		left:860px;
		top:450px;
		display:none;
	}
	.popupForm>h2{
		text-align:center;
		padding-top:50px;
	}
	.popupForm>div{
		font-size:17px;
		text-align:center;
	}
	.popupForm>input{
		margin-left:50px;
		margin-right:50px;
		margin-top:10px;
	}
</style>
<script>
	$(function(){
		$(document).on('click','.confirmBtn',function(){
			$(this).parent().css("display","none");
		})
		
		// 이메일 인증코드 전송
		$("#FindBtn").click(function(){
			if(emailCheckCustom()!=false){
				var url = 'idemailSend';
				var param = "emailInput="+$("#emailInput").val();
				$.ajax({
					url : url,
					data : param,
					success :function(data){
						if(data == "성공"){
							alert("이메일로 아이디를 전송했습니다. 이메일을 확인해주세요!");
						}else{
							alert("없는 이메일이거나, 잘못된 이메일입니다. ");
						}
					}, error : function(){
						alert("없는 이메일이거나, 잘못된 이메일입니다. ");
					}
				})
			}
		})
		function emailCheckCustom(){
			var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			if($("#emailInput").val()==null||$("#emailInput").val()==''){
				alert("이메일을 입력하세요")
				return false;
			}else if(!emailreg.test(document.getElementById("emailInput").value)){
				alert("이메일이 잘못 입력되었습니다.");
				return false;			
			}
		}
	})
</script>
<div class="section" id="loginDiv">
	<h2>아이디 찾기</h2>
	<form>
		<input type="text" name="userid" placeholder="아이디를 입력해주세요" id="idInput" style="display:none;"/><br/>
		<input type="text" name="useremail" placeholder="가입 시 등록하신 이메일주소를 입력해주세요" id="emailInput"/><br/>
		<input type="button" value="아이디 찾기" id="FindBtn" class="searchBtn"/>
	</form>
	<div class="popupForm" id="idfail">
		<h2>아이디 찾기</h2>
		<div>고객님께서 입력하신 정보가<br/>정확한지 확인 후 다시 시도해주세요.</div>
		<input type="button" value="아이디 찾기" class="confirmBtn"/>
	</div>
	<div class="popupForm" id="idsuccess">
		<h2>아이디 찾기</h2>
		<div>고객님 이메일로<br/>아이디를 보냈습니다.<br/>확인 후 로그인해주세요,</div>
		<input type="button" value="확인" class="confirmBtn"/>
	</div>
</div>