<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#cMyPageLeft{
		display: block;
	}
	#myInfoDiv{
		font-size:20px;
		overflow:auto;
		margin-bottom:100px;
	}
	.formUl>li:nth-child(2n+1){
		width:49%;
		text-align:right;
		margin-right:5px;
	}
	.formUl>li:nth-child(2n){
		width:49%;
		margin-left:5px;
	}
	.spanstar{
		color:red;
	}
	.formUl, .formUl li{
		padding:0px;
		padding-top:5px;
		margin:0px;
	}
	#userinputDiv>h2{
		padding-top: 20px;
		padding-left: 20px;
	}
	#infoCheckDiv{
		padding-top:20px;
		padding-bottom:30px;
		border-bottom: 1px solid rgb(252,118,45);
	}
	
	#userinputDiv{
		height:500px;
		background-color:white;
	}
	#infoView, #infoView2{
		width:1080px;
		height:50px;
		background-color:rgb(252,118,45);
		color:white;
		line-height:50px;
		font-size:25px;
		padding-left:10px;
	}
	.btnClass{
		background-color:rgb(252,118,45);
		color:white;
		border:none;
		border-radius:5%;
		width:100px;
		height:40px;
		margin:1px;
		padding:1px;
	}
	#infosubmit{
		margin-left:490px;
	}
	#sFrm{
		margin-bottom: 30px;
	}
	#notice{
		font-size:0.8em;
		color:#aaa;
	}
	.radiusClass{
		border-radius:5px;
	}
	button, .btn{
		padding: 3px 10px;
		color: #666666;
		background:#fff;
		border:1px solid #eee;
		text-align: center;
 		text-decoration: none;
		display: inline-block;
		margin:0 3px;
	}
	/*버튼*/
	.btn:hover{
		background: rgb(252,118,45);
		color:white;
		display: inline-block;
	}
	input{
		border:1px solid #eee;
	}
</style>
<script>
	$(function(){
		
		
		$("#infosubmit").click(function(){
	
			if($("#checkEmailResult").val()=='N'){
				alert("이메일 인증을 진행해주세요");
				return false;
			}
			if($("#userpwd").val()==null || $("#userpwd").val()==''){ 
				alert("비밀번호를 입력해주세요"); 
				return false;
			}
			if($("#userpwd").val() != $("#userpwd2").val()){ 
				alert("비밀번호 확인과 비밀번호가 일치하지 않습니다."); 
				return false;
			}
			if($("#username").val()==null || $("#username").val()==''){ 
				alert("이름을 입력해주세요"); 
				return false;
			}
			if($("#userphone2").val()==null || $("#userphone2").val()==''|| $("#userphone3").val()==null || $("#userphone3").val()==''){ 
				alert("휴대폰 번호를 입력해주세요"); 
				return false;
			}
			if($("#userzipcode").val()==null || $("#userzipcode").val()==''){ 
				alert("주소를 입력해주세요"); 
				return false;
			}
			if($("#useraddr").val()==null || $("#useraddr").val()==''){ 
				alert("주소를 입력해주세요"); 
				return false;
			}
			if($("#userdetailaddr").val()==null || $("#userdetailaddr").val()==''){ 
				alert("주소를 입력해주세요"); 
				return false;
			}
	
			
			
			
			// 맨 밑부분
			if(regCheck()==false){
				return false;
			}else{
				$("#regiFrm").submit();
			}
			return true;
		});
		



		// 주소검색
		$("#zipSearch").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            $("#userzipcode").val(data.zonecode);
		            $("#useraddr").val(data.address);
		            document.getElementById('userdetailaddr').focus();
		        }
		    }).open();
		});
		
		// 이메일 인증코드 전송
		$("#emailSend").click(function(){
			if(emailCheckCustom()!=false){
				var url = 'emailSend';
				var param = "SendToEmail="+$("#useremail").val();
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
		
		// 이메일 인증코드 확인
		$("#emailCheckBtn").click(function(){
			if($("#emailCheck").val()!=null || $("#emailCheck").val()!=''){
				var url = 'emailCheck';
				var param = "emailCode="+$("#emailCheck").val();
				$.ajax({
					url : url,
					data : param,
					success : function(data){
						console.log(data);
						if(data == 1){
							alert("인증에 성공하였습니다.");							
							$("#checkEmailResult").val('Y');
							$("#useremail").attr("readonly",true);
						}else{
							alert("인증코드가 일치하지 않거나 인증에 실패하였습니다.");
						}
					}, error : function(){
						alert("인증에 실패하였습니다.");
					}
				});
			}
		})
	});
	
	
	function regCheck(){
		// 비밀번호 검사
		var pwdreg = /^[A-Za-z1-9!@#]{6,15}$/;
		if(!pwdreg.test(document.getElementById("userpwd").value)){
			alert("비밀번호는 6~15자리, 특수문자는!@#만 사용 가능합니다.");
			return false;
		}
		// 이름 검사
		var namereg = /^[가-힣]{2,4}$/;
		if(!namereg.test(document.getElementById("username").value)){
			alert("이름은 2~4글자만 가능합니다.");
			return false;
		}
		// 이메일 검사
		var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if(!emailreg.test(document.getElementById("useremail").value)){
			alert("이메일이 잘못 입력되었습니다.");
			return false;			
		}
		
		// 전화번호 검사
		var midtelreg=/^[0-9]{3,4}$/;
		if(!midtelreg.test(document.getElementById("userphone2").value)){
		  alert("전화번호를 잘못입력하였습니다...");
		  return false;
		}
		
		var lasttelreg=/^[0-9]{4}$/;
		if(!lasttelreg.test(document.getElementById("userphone3").value)){
		  alert("전화번호를 잘못입력하였습니다...");
		  return false;
		}
	}
	// 이메일 검사
	function emailCheckCustom(){
		var emailreg = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if($("#useremail").val()==null||$("#useremail").val()==''){
			alert("이메일을 입력하세요")
			return false;
		}else if(!emailreg.test(document.getElementById("useremail").value)){
			alert("이메일이 잘못 입력되었습니다.");
			return false;			
		}
	}
</script>
<div class="section" id="myInfoDiv">
	<div id="userinputDiv">
		<h2>정보수정</h2><span class="spanstar">*</span>표시는 필수입력항목입니다
		<hr/>
		<form>	
			<ul class="formUl">
				<li><span class="spanstar">*</span>아이디</li> 		<li><input type="text" name="userid" style="margin-right:5px;" disabled value="${logId}"/></li>
				<li><span class="spanstar">*</span>비밀번호</li>		<li><input type="text" name="userpwd" id="userpwd"/></li>	
				<li><span class="spanstar">*</span>비밀번호 확인</li>	<li><input type="text" name="userpwd2" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>이름</li>			<li><input type="text" name="username" value="username"/></li>		
				<li><span class="spanstar">*</span>이메일</li>			<li><input type="text" name="useremail" style="margin-right:5px;"/><input type="button" class="btn" value="인증하기"/></li>			
				<li><span class="spanstar">*</span>휴대폰</li>			<li><input type="text" name="userphone"/></li>			
				<li><span class="spanstar">*</span>주소</li>			<li><input type="button" name="userzipcode" class="btn"  style="width:145px;"value="우편번호 검색" style="margin-right:5px;"/><input type="text" name="useraddr" readonly/><br/><input type="text" name="userdetailaddr" style="margin-top:5px; width:302px;"></li>				
			</ul>
		</form>
		</div>
		
		<div id="infoCheckDiv">
			<div style="margin-bottom:60px;margin-top: 70px;"><input type="submit" value="수정하기" class="btnClass" id="infosubmit"></div>
		</div>
		
</div>