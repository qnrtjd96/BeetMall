<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/menu_c.jspf"%>
<style>
	#infoTitle{
		height:40px;
		text-align:center;
		lineheight:40px;
		border-bottom:1px solid #ddd;
		margin-bottom:12px;
	}
	.infobusiz{
		margin-left:0px;
	}
	.infobusiz, .infomaition, .personaal{
		float:left;
		height:40px;
		margin-right:1px;
		line-height:40px;
		width:15%;
		background-color: rgb(252,118,45);
		text-align:center;
		color:white;
		font-size:1.2em;
	}
	#infoSelect{
		height:1080px;
		position:relative;
	}
	#infoPrint{
		position:absolute;
		width:1080px;
		height:980px;
		top:40px;
		border: 2px solid rgb(252,118,45);
		padding:10px;
		overflow: auto;
	}
	pre{
		 background-color: white;
   		 border: 1px solid white;
   		 overflow: visible;
   		 white-space: pre-line;
   		 font-size:14px;
	}
</style>
<script>
	$(function(){
		$(".infobusiz").click(function(){
			infobusiz();
		});
		
		$(".infomaition").click(function(){
			infomaition();
		});
		
		$(".personaal").click(function(){
			personal();
		});
		
	});
	function infobusiz(){
		var url = "/sshj/infobusiz";
         $.ajax({
            url : url,
            success : function(result){
            	var $result = $(result);
            	$result.each(function(idx, obj){
            		$("#infoPrint").html("<pre>"+obj.userinfocontent+"</pre>");
            	});
            }, error:function(){
               $("#infoPrint").html("전송받기 실패..");
            }
         });
	}
	function infomaition(){
		var url = "/sshj/infomaition";
         $.ajax({
            url : url,
            success : function(result){
            	var $result = $(result);
            	$result.each(function(idx, obj){
            		$("#infoPrint").html("<pre>"+obj.userinfocontent+"</pre>");
            	});
            }, error:function(){
               $("#infoPrint").html("전송받기 실패..");
            }
         });
	}
	function personal(){
		var url = "/sshj/personaal";
         $.ajax({
            url : url,
            success : function(result){
            	var $result = $(result);
            	$result.each(function(idx, obj){
            		$("#infoPrint").html("<pre>"+obj.userinfocontent+"</pre>");
            	});
            }, error:function(){
               $("#infoPrint").html("전송받기 실패..");
            }
         });
	}
</script>
<div class="section">
	<div id="infoTitle">
		<h2>이용안내</h2>
	</div>
	<div id="infoSelect">
		<c:if test="${type == 1}">
			<script>$(function(){
				infobusiz();
			})</script>
		</c:if>
		<c:if test="${type == 2}">
			<script>$(function(){
				infomaition();
			})</script>
		</c:if>
		<c:if test="${type == 3}">
			<script>$(function(){
				personal();
			})</script>
		</c:if>
		<div class="infobusiz" style="cursor: pointer;">회사소개</div>
		<div class="infomaition" style="cursor: pointer;">이용약관</div>
		<div class="personaal" style="cursor: pointer;">개인정보처리방침</div>
		<div><div id="infoPrint"></div></div>
	</div>
	
</div>