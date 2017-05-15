<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.display{display: none;}

#systemRegisterArea {
	margin-left: 2%;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="/solar/static/lib/jquery-3.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/solar/static/lib/jquery.serializeJSON.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/main/menu.jsp" />
<div class="container">
	<!-- <div style="text-align:right;">
		<input type="button" class="btn btn-default" name="registerBtn" value="���" disabled>
		<input type="button" class="btn btn-default" name="clearBtn" value="���">
		<input type="button" class="btn btn-default" name="modifyBtn" value="����" disabled>
		<input type="button" class="btn btn-default" name="deleteBtn" value="����" disabled>
	</div>		 -->

<div class="table-responsive">
	<table id="listTable" class="table table-hover">
		<thead>
			<th>���̵�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
			<th>���� ���</th>
			<th>Ÿ��</th>
			<th>������</th>
			<th>��ϳ�¥</th>
		</thead>
		<tbody></tbody>
	</table>
</div>

<!-- ������  -->
<input type="button" class="btn btn-default" name="register" value="�ý��� ���" style="margin-left: 90%;"/>
<div id="systemInfoArea" class="display">
	<form id="modifyForm">

	<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">ID</label>  			
    		<input class="form-control" type="text" id="example-text-input" name="id"> 			
		</div>
		<div class="form-group col-md-5">
 			 <label class="col-2 col-form-label">�̸�</label>
    		 <input class="form-control" type="text" id="example-search-input" name="name">
		</div>
		<div class="form-group col-md-10">
  			<label class="col-2 col-form-label">����</label>
    		<input class="form-control" type="text" id="example-email-input" name="description">
		</div>
		<div class="form-group col-md-5">
			<label class="col-2 col-form-label">����</label>
    		<input class="form-control" type="text" id="example-url-input" name="version">
		</div>
		<div class="form-group col-md-5">
		 	<label class="col-2 col-form-label">���� ���</label>
			<input class="form-control" type="text" id="example-tel-input" name="transmission_type">
		</div>
		<div class="form-group col-md-5">
			<label class="col-2 col-form-label">Ÿ��</label>
			<input class="form-control" type="text"id="example-password-input" name="type">
		</div>
		<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">������</label>
  			<input class="form-control" type="text" id="example-password-input" name="manager">
  		</div>
  		<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">��ϳ�¥</label>
  			<input class="form-control" type="text" id="example-password-input" name="regist_date" readonly="readonly">
  		</div>
  		<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">������¥</label>
  			<input class="form-control" type="text" id="example-password-input" name="up_Date" readonly="readonly"> 
  		</div>
  		<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">IP</label>
  			<input class="form-control" type="text" id="example-password-input" name="ip" readonly="readonly">
  		</div>
  		<div class="form-group col-md-12">
			<input type="hidden" name="unique_Id" />
			<input type="button" class="btn btn-default" name="modify" value="����" style="margin-left:30%;"/>
			<input type="button" class="btn btn-default" name="delete" value="����" />
			<input type="button" class="btn btn-default" name="close" value="�ݱ�" />
	    </div>
	</form>	
</div>

<!-- �����  -->

<div id="systemRegisterArea" class="display" class="form-group col-md-9">
	<form id="registerForm">
		<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">ID</label>  			
    		<input class="form-control" type="text" id="example-text-input" name="id"> 			
		</div>
		<div class="form-group col-md-5">
 			 <label class="col-2 col-form-label">�̸�</label>
    		 <input class="form-control" type="text" id="example-search-input" name="name">
		</div>
		<div class="form-group col-md-10">
  			<label class="col-2 col-form-label">����</label>
    		<input class="form-control" type="text" id="example-email-input" name="description">
		</div>
		<div class="form-group col-md-5">
			<label class="col-2 col-form-label">����</label>
    		<input class="form-control" type="text" id="example-url-input" name="version">
		</div>
		<div class="form-group col-md-5">
		 	<label class="col-2 col-form-label">���� ���</label>
			<input class="form-control" type="text" id="example-tel-input" name="transmission_type">
		</div>
		<div class="form-group col-md-5">
			<label class="col-2 col-form-label">Ÿ��</label>
			<input class="form-control" type="text" id="example-password-input" name="type">
		</div>
		<div class="form-group col-md-5">
  			<label class="col-2 col-form-label">������</label>
  			<input class="form-control" type="text" id="example-password-input" name="manager">
  		</div>
  		<div class="form-group col-md-12">
  			<input type="button" class="btn btn-default" name="register" value="���" style="margin-left: 38%;" />
			<input type="button" class="btn btn-default" name="close" value="�ݱ�" />
  		</div>
  	
  </form>
	</div>
</div>

</body>
<script>
$(function(){
	
	getSystemList();
	
	//���̵� Ŭ�� -> �ý��� ����
	$(document).on('click', '#systemId', function(event){
		event.preventDefault();
		$("#systemRegisterArea").hide();
		var $id = $(this).text();
				
		$.ajax({
			type:"GET",
			url:"/solar/system/"+$id,
			success:function(data,status,xhr){
				renderSystemInfoView(data.system);
			},
			async: false,
			error:function(xhr,status,error){
				console.log("error : "+xhr.status);
				alert("error : "+xhr.status+" �����͸� �ҷ����� �� �����Ͽ����ϴ�.");
			},
			contentType:"application/json",
			dataType:"json"
		});		
	});
	
	//���� ��ư Ŭ���� ó��
	$(document).on('click', "#modifyForm  input[type='button'][name='modify']", function(){
		var $json = JSON.stringify($('#modifyForm').serializeJSON());				
		$.ajax({
			type:"PUT",
			url:"/solar/system",
			data:$json,
			success:function(data,status,xhr){
				renderView(data.systemList);
				alert("�����Ǿ����ϴ�");
			},
			async: false,
			error:function(xhr,status,error){
				console.log("error : "+xhr.status);
				alert("error : "+xhr.status+" �����͸� ���� �ϴ� �� �����Ͽ����ϴ�.");
			},
			contentType:"application/json",
			dataType:"json"
		});		 
		
	});
	
	//���� ��ư Ŭ���� ����ó��
	$(document).on('click', "#modifyForm  input[type='button'][name='delete']", function(){
		var $json = JSON.stringify($('#modifyForm').serializeJSON());
		console.log($json);
		$.ajax({
			type:"DELETE",
			url:"/solar/system",
			data:$json,
			success:function(data,status,xhr){
				$("#systemInfoArea").hide();
				renderView(data.systemList);
				alert("���� �Ǿ����ϴ�");
			},
			async: false,
			error:function(xhr,status,error){
				console.log("error : "+xhr.status);
				alert("error : "+xhr.status+" �����͸� ���� �ϴ� �� �����Ͽ����ϴ�.");
			},
			contentType:"application/json",
			dataType:"json"
		});		 		
	});
	
	//��� ��ư Ŭ����ó��
	$(document).on('click', "input[type='button'][name='register']", function(){
		$("#systemInfoArea").hide();
		$("#systemRegisterArea").show();
	});
	
	//�ý��� �� ����  ��� ��ư Ŭ���� ó��
	$(document).on('click', "#registerForm  input[type='button'][name='register']", function(){
		var $json = JSON.stringify($('#registerForm').serializeJSON());
		$.ajax({
			type:"POST",
			url:"/solar/system",
			data:$json,
			success:function(data,status,xhr){
				$("#systemRegisterArea").hide();
				renderView(data.systemList);				
				alert("��ϵǾ����ϴ�.");
			},
			async: false,
			error:function(xhr,status,error){
				console.log("error : "+xhr.status);
				alert("error : "+xhr.status+" �����͸� ��� �ϴ� �� �����Ͽ����ϴ�.");
			},
			contentType:"application/json",
			dataType:"json"
		});		 
	});
	
	//��ư Ŭ���� ó��
	$(document).on('click', "input[type='button'][name='close']", function(){
		$("#systemInfoArea").hide();
		$("#systemRegisterArea").hide();
	});
	
	//system modify �� �ֱ�
	function renderSystemInfoView(system){
		$("#modifyForm input[name='id']").val(system.id);
		$("#modifyForm input[name='name']").val(system.name);
		$("#modifyForm input[name='description']").val(system.description);
		$("#modifyForm input[name='version']").val(system.version);
		$("#modifyForm input[name='transmission_type']").val(system.transmission_type);
		$("#modifyForm input[name='type']").val(system.type);
		$("#modifyForm input[name='manager']").val(system.manager);
		$("#modifyForm input[name='regist_date']").val(system.regist_date);
		$("#modifyForm input[name='up_Date']").val(system.up_Date);
		$("#modifyForm input[name='ip']").val(system.ip);
		$("#modifyForm input[name='unique_Id']").val(system.unique_Id);
		$("#systemInfoArea").show();
	}
	
	//�並 �ҷ����� ���� ajax�� ��������� ���� �´�
	function getSystemList(){
		$.ajax({
				type:"GET",
				url:"/solar/system/systemList",
				success:function(data,status,xhr){
					renderView(data.systemList);
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
	
	//systemList
	function renderView(data){
		$("#listTable > tbody").empty();
		
				
		$(data).each(function(){
			var $tr = $("<tr/>").appendTo("#listTable");
			var $td = $("<td/>").appendTo($tr);
			
			var $a = $("<a/>",{"href":"#","id":"systemId"}).appendTo($td);			
			$($a).text(this.id);			
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.name);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.description);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.version);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.transmission_type);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.type);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.manager);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.regist_date);
			
			
			$td = $("<td/>").appendTo($tr);
			$("<input/>",{"type":"hidden","value":this.unique_Id}).appendTo($td);
		});
	}
});
</script>
</html>