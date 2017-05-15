<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������̽�</title>
</head>
<body>
<jsp:include page="/WEB-INF/main/menu.jsp" />
<div class="container">
	<div style="text-align:right;">
		<input type="button" class="btn btn-default" name="registerBtn" value="���">
		<input type="button" class="btn btn-default" name="clearBtn" value="���">
		<input type="button" class="btn btn-default" name="modifyBtn" value="����" disabled>
		<input type="button" class="btn btn-default" name="deleteBtn" value="����" disabled>
	</div>
	<div class="table-responsive">
	<table class="table table-hover" id="memberList">
		<thead>
			<tr>
				<th>���̵�</th>
				<th>���</th>
				<th>����</th>
				<th>�̸�</th>
				<th>�μ�</th>
				<th>�ܼ���ȣ</th>
				<th>������ȣ</th>
				<th>��ϳ�¥</th>
				<th>���������</th>
				<th>�α��νõ�Ƚ��</th>		
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
			<label>���̵�</label>
			<input type="text" class="form-control" name="id">
		</div>
		<div class="form-group col-md-3">
			<label>���</label>
			<input type="text" class="form-control" name="pw"/>
		</div>
		<div class="form-group col-md-6">
			<label>����</label>
			<input type="text" class="form-control" name="auth">
		</div>
		<div class="form-group col-md-6">
			<label>�̸�</label>
			<input type="text" class="form-control" name="name">
		</div>
		<div class="form-group col-md-9">
			<label>�μ�</label>
			<input type="text" class="form-control" name="department">
		</div>
		<div class="form-group col-md-3">
			<label>������ȣ</label>
			<input type="text" class="form-control" name="phoneIn">
		</div>
		<div class="form-group col-md-4">
			<label>�ܼ���ȣ</label>
			<input type="text" class="form-control" name="phoneEx">
		</div>
		<div class="form-group col-md-4">
			<label>��ϳ�¥</label>
			<input type="text" class="form-control" name="registDate" readonly>
		</div>
		<div class="form-group col-md-4">
			<label>���������</label>
			<input type="text" class="form-control" name="pwUpdate" readonly>
		</div>
			<div class="form-group col-md-4">
			<label>�α��νõ�Ƚ��</label>
			<input type="text" class="form-control" name="loginCnt" readonly>
		</div>
	</form>
	</div>
</div>
</body>
<script>
$(function(){
	
	getMemberList();
	
	//��� ��ư�� ������ �� ó��
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
	
	//��ҹ�ư�� ������ �� ó��
	$("input[name='clearBtn']").click(function(){
		clearInfo();
		$("#memberForm  input[name='loginCnt']").attr("readonly",true);
		$("input[name='registerBtn']").attr("disabled",false);
		$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",true);
	});
	
	//����Ʈ���� ���̵� Ŭ������ �� ó��
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
	
	//����Ʈ���� ���࿡�� �������� ������ư�� ������ �� �̺�Ʈ ó��
	$(document).on('click', "input[type='button'][value='����']",function(){
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
	
	//���� ��ư Ŭ���� ó��
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
	
	//�޴� ���� ���� ��ư Ŭ���� ó��
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
					alert("error : "+xhr.status+" �����͸� �ҷ� ���� �� �����Ͽ����ϴ�.");
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
				'value':"����"}).appendTo($td);
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