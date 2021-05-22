<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#loginDiv{
		height:1180px;
	}
	#loginDiv>h2{
		text-align: center;
		padding:100px 0;
	}
	.searchBtn{
		height:50px;
		width:300px;
		float:left;
		margin-left:390px;
		margin-right:390px;
		margin-top:1px;
	}
	#useremail, #userid{
		height:50px;
		width:358px;
		margin:4px auto;
		padding:13px 40px 13px 18px;
		background-color: #fafafa;
		border:1px solid #dddddd;
	}
	#formcenter{
		margin:0 auto;
		width:358px;
	}
	#pwdFindBtn{
		background-color: rgb(252,118,45);
		color:white;
		font-weight:700;
		border:none;
		height:50px;
		width:358px;
		float:left;
	}
	#nameInput, #idInput, #emailInput{
		margin-top:5px;
	}
	#searchBtn{
		margin-top:30px;		
	}
	.popupForm{
		height:270px;
		width:400px;
		background-color:#ddd;
	}
	.popupForm>h2{
		text-align:center;
		padding-top:50px;
	}
	.popupForm>div{
		font-size:17px;
		text-align:center;
	}
	.popupForm>input:last-child{
		margin-left:50px;
		margin-right:50px;
		margin-top:10px;
	}
	.howSearch{
		height:40px;
		width:100px;
		margin:0 5px;
		background-color:#555;
		color:white;
	}
</style>
<script>
	$(function(){
		// 이메일 인증코드 전송
		$("#pwdFindBtn").click(function(){
			if(regCheck()!=false){
				var url = 'pwdemailSend';
				var param = "useremail="+$("#useremail").val()+"&userid="+$("#userid").val();
				$.ajax({
					url : url,
					data : param,
					success :function(data){
						console.log(data);
						if(data == '성공'){
							alert("이메일로 임시 비밀번호를 전송했습니다. 이메일을 확인해주세요!");
						}else{
							alert("없는 이메일이거나, 잘못된 이메일입니다.");
						}
					}, error : function(){
						alert("없는 이메일이거나, 잘못된 이메일입니다.");
					}
				})
			}
		})
		
		function regCheck(){
			// 아이디 검사
			var idreg = /^[a-zA-z0-9]{6,15}$/;
			if(!idreg.test(document.getElementById("userid").value)){
				alert("아이디가 잘못 입력되었습니다.");
				return false;
			}
			// 이메일 검사
			var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			if(!emailreg.test(document.getElementById("useremail").value)){
				alert("이메일이 잘못 입력되었습니다.");
				return false;			
			}
		}
	})
</script>
<div class="section" id="loginDiv">
	<h2>비밀번호 찾기</h2>
	<form id="formcenter">
		<input type="text" name="userid" placeholder="고객님의 아이디를 입력해주세요" id="userid"/><br/>
		<input type="text" name="useremail" placeholder="가입 시 등록하신 이메일주소를 입력해주세요" id="useremail"/><br/>
		<input type="button" value="이메일 전송" id="pwdFindBtn"/>
	</form>
</div>