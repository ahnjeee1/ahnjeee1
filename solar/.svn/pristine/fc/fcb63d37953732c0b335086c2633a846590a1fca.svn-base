<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>인터페이스</title>
</head>
<body>
<jsp:include page="/WEB-INF/main/menu.jsp" />
<div class="container">
	<div style="text-align:right;">
		<input type="button" class="btn btn-default" name="registerBtn" value="등록">
		<input type="button" class="btn btn-default" name="clearBtn" value="취소">
		<input type="button" class="btn btn-default" name="modifyBtn" value="수정" disabled>
		<input type="button" class="btn btn-default" name="deleteBtn" value="삭제" disabled>
	</div>
	<div class="table-responsive">
	<table class="table table-hover" id="memberList">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비번</th>
				<th>권한</th>
				<th>이름</th>
				<th>부서</th>
				<th>외선번호</th>
				<th>내선번호</th>
				<th>등록날짜</th>
				<th>비번변경일</th>
				<th>로그인시도횟수</th>		
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	</div>
	<hr/>
	<div>
	<form id="memberForm">
		<input type="hidden" name="uniqueId">
		<div class="form-group col-md-9">
			<label>아이디</label>
			<input type="text" class="form-control" name="id">
		</div>
		<div class="form-group col-md-3">
			<label>비번</label>
			<input type="text" class="form-control" name="pw"/>
		</div>
		<div class="form-group col-md-6">
			<label>권한</label>
			<input type="text" class="form-control" name="auth">
		</div>
		<div class="form-group col-md-6">
			<label>이름</label>
			<input type="text" class="form-control" name="name">
		</div>
		<div class="form-group col-md-9">
			<label>부서</label>
			<input type="text" class="form-control" name="department">
		</div>
		<div class="form-group col-md-3">
			<label>내선번호</label>
			<input type="text" class="form-control" name="phoneIn">
		</div>
		<div class="form-group col-md-4">
			<label>외선번호</label>
			<input type="text" class="form-control" name="phoneEx">
		</div>
		<div class="form-group col-md-4">
			<label>등록날짜</label>
			<input type="text" class="form-control" name="registDate" readonly>
		</div>
		<div class="form-group col-md-4">
			<label>비번변경일</label>
			<input type="text" class="form-control" name="pwUpdate" readonly>
		</div>
			<div class="form-group col-md-4">
			<label>로그인시도횟수</label>
			<input type="text" class="form-control" name="loginCnt" readonly>
		</div>
	</form>
	</div>
</div>
</body>
<script>
$(function(){
	
	getMemberList();
	
	//등록 버튼을 눌렀을 때 처리
	$("input[name='registerBtn']").click(function(){
		var $json = JSON.stringify($('#memberForm').serializeJSON());
		console.log($json);
		$.ajax({
			type:"POST",
			url:"/solar/member",
			data:$json,
			success:function(data,status,xhr){
				renderView(data.memberList);
				clearInfo();
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json"
		});
	});
	
	//취소버튼을 눌렀을 때 처리
	$("input[name='clearBtn']").click(function(){
		clearInfo();
		$("#memberForm  input[name='loginCnt']").attr("readonly",true);
		$("input[name='registerBtn']").attr("disabled",false);
		$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",true);
	});
	
	//리스트에서 아이디를 클릭했을 때 처리
	$(document).on('click', '#memberId', function(event){
		$("#memberForm  input[name='loginCnt']").attr("readonly",false);
		$("input[name='registerBtn']").attr("disabled",true);
		$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",false);
		var $id = $(this).text()
		
		$.ajax({
			type:"GET",
			url:"/solar/member/"+$id,
			success:function(data,status,xhr){
				memberInfo(data.member);	
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json",
			dataType:"json"
		});
	});
	
	//리스트에서 각행에서 보여지는 삭제버튼을 눌렀을 때 이벤트 처리
	$(document).on('click', "input[type='button'][value='삭제']",function(){
		var x = {};
		x.uniqueId = $(this).attr("id");
		var $json = JSON.stringify(x);
		$.ajax({
			type:"DELETE",
			url:"/solar/member",
			data:$json,
			success:function(data,status,xhr){
				renderView(data.memberList);
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json"
		});
	});
	
	//수정 버튼 클릭시 처리
	$("input[name='modifyBtn']").on("click",function(){
		var $json = JSON.stringify($('#memberForm').serializeJSON());
		console.log($json);
 		$.ajax({
			type:"PUT",
			url:"/solar/member",
			data:$json,
			success:function(data,status,xhr){
				renderView(data.memberList);
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json"
		}); 
	});
	
	//메뉴 위쪽 삭제 버튼 클릭시 처리
	$("input[name='deleteBtn']").on("click",function(){
		var $json = JSON.stringify($('#memberForm').serializeJSON());
		console.log($json);
		$.ajax({
			type:"DELETE",
			url:"/solar/member",
			data:$json,
			success:function(data,status,xhr){
				clearInfo();
				renderView(data.memberList);
				$("input[name='registerBtn']").attr("disabled",false);
				$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",true);
				$("#memberForm  input[name='loginCnt']").attr("readonly",true);
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json"
		});
	});	

	function getMemberList(){
		$.ajax({
				type:"GET",
				url:"/solar/member/memberList",
				success:function(data,status,xhr){
					console.log("success");
					renderView(data.memberList);
				},
				async: false,
				error:function(xhr,status,error){
					console.log("error : "+xhr.status);
					alert("error : "+xhr.status+" 데이터를 불러 오는 데 실패하였습니다.");
				},
				contentType:"application/json",
				dataType:"json"
		});
	}
	
	function renderView(data){
		
		$("#memberList > tbody").empty();
		
		$(data).each(function(){
			var $tr = $("<tr/>").appendTo("#memberList");
			var $td = $("<td/>").appendTo($tr);
			
			var $a = $("<a/>",{"href":"#","id":"memberId"}).appendTo($td);			
			$($a).text(this.id);			
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.pw);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.auth);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.name);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.department);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.phoneEx);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.phoneIn);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.registDate);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.pwUpdate);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.loginCnt);
			
			$td = $("<td/>").appendTo($tr);
			$btn = $("<input/>",{
				'type':"button",
				'class':"btn btn-default",
				'id':this.uniqueId,
				'value':"삭제"}).appendTo($td);
		});
	}
	

	
	function memberInfo(member){
		$("#memberForm input[name='id']").val(member.id);
		$("#memberForm input[name='pw']").val(member.pw);
		$("#memberForm input[name='auth']").val(member.auth);
		$("#memberForm input[name='name']").val(member.name);
		$("#memberForm input[name='department']").val(member.department);
		$("#memberForm input[name='phoneIn']").val(member.phoneIn);
		$("#memberForm input[name='phoneEx']").val(member.phoneEx);
		$("#memberForm input[name='registDate']").val(member.registDate);
		$("#memberForm input[name='pwUpdate']").val(member.pwUpdate);
		$("#memberForm input[name='loginCnt']").val(member.loginCnt);
		$("#memberForm input[name='uniqueId']").val(member.uniqueId);
	}
	
	function clearInfo(){
		$("#memberForm input[name='id']").val('');
		$("#memberForm input[name='pw']").val('');
		$("#memberForm input[name='auth']").val('');
		$("#memberForm input[name='name']").val('');
		$("#memberForm input[name='department']").val('');
		$("#memberForm input[name='phoneIn']").val('');
		$("#memberForm input[name='phoneEx']").val('');
		$("#memberForm input[name='registDate']").val('');
		$("#memberForm input[name='pwUpdate']").val('');
		$("#memberForm input[name='loginCnt']").val('');
		$("#memberForm input[name='uniqueId']").val('');
	}
	
/* 	function refreshList(){
		getMemberList();
	} */
});
</script>
</html>