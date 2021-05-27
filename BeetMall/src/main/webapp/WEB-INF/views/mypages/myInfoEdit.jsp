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
		
	}
	
	#userinputDiv{
		height:600px;
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
		background-color:#f25757;
		color:white;
		border:none;
		border-radius:5%;
		width:100px;
		height:40px;
		margin:1px;
		padding:1px;
	}
	#infosubmit{
	    margin-top:25px;
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
	
	input{
		border:1px solid #eee;
	}
</style>
<script>
	$(function(){
		
		//var sphone="${vo3.userphone}";
		//var sph=sphone;
		//var userphoneArr=sph.split("-");
		//var pnum1=parseInt(userphoneArr[0]);
		//var pnum2=parseInt(userphoneArr[1]);
		//var pnum3=parseInt(userphoneArr[2]);
		
		
		
		$("#infosubmit").click(function(){
	
			
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
	
			
			
			if(regCheck() == false){
				return false;
			}
			//alert("2342343");
			
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
<form method="post" id="regiFrm" action="editinfoOk">	
			<ul class="formUl">
				<li><span class="spanstar">*</span>아이디</li> 		<li><input type="text" name="userid" style="margin-right:5px;" disabled value="${logId}"/></li>
				<li><span class="spanstar">*</span>비밀번호</li>		<li><input type="password" name="userpwd" id="userpwd"/></li>	
				<li><span class="spanstar">*</span>비밀번호 확인</li>	<li><input type="password" name="userpwd2" id="userpwd2" style="float:left"/><div id="passwordCheck" style="margin-left:200px"></div></li>	
				<li><span class="spanstar">*</span>이름</li>			<li><input type="text" name="username" id="username" value="${vo3.username}" /></li>		
				<li><span class="spanstar">*</span>이메일</li>			<li><input type="text" name="useremail" style="margin-right:5px;" value="${vo3.useremail}"/></li>			
				<li><span class="spanstar">*</span>휴대폰</li>			<li><select  id="userphone1" name="userphone1" style="height:30px;">
																			<option value="010">010</option>
																			 <option value="02">02</option>
																			<option value="031">031</option>
																			<option value="032">032</option>
																			<option value="033">033</option>
																			<option value="041">041</option>
																			<option value="042">042</option>
																			<option value="043">043</option>
																			<option value="044">044</option>
																			<option value="051">051</option>
																			<option value="052">052</option>
																			<option value="053">053</option>
																			<option value="054">054</option>
																			<option value="055">055</option>
																			<option value="061">061</option>
																			<option value="062">062</option>
																			<option value="063">063</option>
																			<option value="064">064</option>
																			</select> -
																			<input type="text" name="userphone2" id="userphone2" style="width:80px;" maxlength="4"  value="${pnum2}" /> -
																			<input type="text" name="userphone3" id="userphone3" style="width:80px;" maxlength="4"  value="${pnum3}"/></li>
				<li><span class="spanstar">*</span>주소</li>			<li><input type="button"  id="zipSearch" value="우편번호 검색" style="margin-right:5px;" class="btn"/>
																		<input type="text" name="userzipcode" id="userzipcode" readonly  style="width:100px;" value="${vo3.userzipcode}"/>
																		<input type="text" name="useraddr" id="useraddr" style="margin-top:5px; width:400px;" value="${vo3.useraddr}"/>
																		<input type="text" name="userdetailaddr" id="userdetailaddr" style="margin-top:5px; width:420px;" value="${vo3.userdetailaddr}"/></li>			
			</ul>
			
			
			<div id="infoCheckDiv">
			<div style="margin-bottom:60px;margin-top: 70px;"><input type="submit" value="수정하기" class="btnClass" id="infosubmit"></div>
		    </div>
		    
		</form>
		</div>
		
	
		
</div>