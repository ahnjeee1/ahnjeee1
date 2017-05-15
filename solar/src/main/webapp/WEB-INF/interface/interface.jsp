<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/solar/static/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="/solar/static/css/bootstrap-theme.min.css"/>
<script src="/solar/static/css/js/bootstrap.min.js"></script>
<script src="/solar/static/lib/jquery-3.2.1.js"></script>
<script src="/solar/static/lib/jquery.serializeJSON.js"></script>

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
	<table class="table table-hover" id="interfaceList">
		<thead>
			<tr>
				<th>���̵�</th>
				<th>�̸�</th>
				<th>����</th>
				<th>Ÿ��</th>
				<th>�����</th>
				<th>������¥</th>
				<th></th>	
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	</div>
	<hr/>
	<div>
	<form id="interfaceForm" class="hide">
		<input type="hidden" name="uniqueId">
		<div class="form-group col-md-9">
			<label>���̵�</label>
			<input type="text" class="form-control" name="id">
		</div>
		<div class="form-group col-md-3">
			<label>����</label>
			<input type="text" class="form-control" name="version"/>
		</div>
		<div class="form-group col-md-6">
			<label>�̸�</label>
			<input type="text" class="form-control" name="name">
		</div>
		<div class="form-group col-md-6">
			<label>�����</label>
			<input type="text" class="form-control" name="manager">
		</div>
		<div class="form-group col-md-9">
			<label>����</label>
			<input type="text" class="form-control" name="description">
		</div>
		<div class="form-group col-md-3">
			<label>Ÿ��</label>
			<select class="form-control" name="type">
				<option value="BAT">BAT</option>
				<option value="DFD">DFD</option>
				<option value="ONL">ONL</option>
			</select>
		</div>
		<div class="form-group col-md-4">
			<label>���Žý���ID</label>
			<input type="text" class="form-control" name="srcSystemId">
		</div>
		<div class="form-group col-md-4">
			<label>���Žý��� ���۹��</label>
			<input type="text" class="form-control" name="srcSystemType" readonly>
		</div>
		<div class="form-group col-md-4">
			<label>���Žý��� �����</label>
			<input type="text" class="form-control" name="srcSystemManager" readonly>
		</div>
		<div class="form-group col-md-4">
			<label>�۽Žý���ID</label>
			<input type="text" class="form-control" name="tgtSystemId">
		</div>
		<div class="form-group col-md-4">
			<label>�۽Žý��� ���۹��</label>
			<input type="text" class="form-control" name="tgtSystemType" readonly>
		</div>
		<div class="form-group col-md-4">
			<label>�۽Žý��� �����</label>
			<input type="text" class="form-control" name="tgtSystemManager" readonly>
		</div>
		<div class="form-group col-md-6">
			<label>ip</label>
			<input type="text" class="form-control" name="ip" readonly>
		</div>
		<div class="form-group col-md-3">
			<label>��ϳ�¥</label>
			<input type="text" class="form-control" name="registDate" readonly>
		</div>
		<div class="form-group col-md-3">
			<label>������¥</label>
			<input type="text" class="form-control" name="upDate" readonly>
		</div>
	</form>
	</div>
</div>
</body>
<script>
$(function(){
	
	getInterfaceList();
	
	$("input[name='registerBtn']").click(function(){
		if($("#interfaceForm").attr('class')=="hide"){
			$("#interfaceForm").attr('class',"show");
			return false;
		}
		if($("#interfaceForm").attr('class')=="show"){
			if($("input[name='modifyBtn']").attr("disabled")!="disabled"){
				clearInfo();
				$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",true);
				return false;
			}
			if(checkForm()==false){
				return false;
			}
			var $json = JSON.stringify($('#interfaceForm').serializeJSON());
			console.log($json);
			$.ajax({
				type:"POST",
				url:"/solar/interface",
				data:$json,
				success:function(data,status,xhr){
					location.href="/solar/interface";
				},
				error:function(xhr,status,error){
					alert("error"+xhr.status);				
				},
				async: false,
				contentType:"application/json"
			});
		}
	});
	
	$("input[name='clearBtn']").click(function(){
		clearInfo();
		$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",true);
	});
	
	$(".getInfo").on("click",function(){
		$("#interfaceForm").attr('class',"show");
		$("input[name='modifyBtn'], input[name='deleteBtn']").attr("disabled",false);
		$.ajax({
			type:"GET",
			url:"/solar/interface/"+$(this).attr("u-id"),
			success:function(data,status,xhr){
				interfaceInfo(data.interFace);	
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json",
			dataType:"json"
		});
	});
	
	$("input[name='modifyBtn']").on("click",function(){
		if(checkForm()==false){
			return false;
		}
		var $json = JSON.stringify($('#interfaceForm').serializeJSON());
		console.log($json);
		$.ajax({
			type:"PUT",
			url:"/solar/interface",
			data:$json,
			success:function(data,status,xhr){
				location.href="/solar/interface";	
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json"
		});
	});
	
	$("input[name='deleteBtn']").on("click",function(){
		var $json = JSON.stringify($('#interfaceForm').serializeJSON());
		console.log($json);
		$.ajax({
			type:"DELETE",
			url:"/solar/interface",
			data:$json,
			success:function(data,status,xhr){
				location.href="/solar/interface";
			},
			error:function(xhr,status,error){
				alert("error"+xhr.status);				
			},
			async: false,
			contentType:"application/json"
		});
	});	

	function getInterfaceList(){
		$.ajax({
				type:"GET",
				url:"/solar/interface/list",
				success:function(data,status,xhr){
					renderView(data.interfaceList);
				},
				async: false,
				error:function(xhr,status,error){
					console.log("error : "+xhr.status);
					alert("error : "+xhr.status);
					alert("�����͸� �ҷ����� �� �����Ͽ����ϴ�.")
				},
				contentType:"application/json",
				dataType:"json"
			});
	}
	
	function renderView(data){
		$(data).each(function(){
			var $tr = $("<tr/>",{
				"class":"getInfo",
				"u-id":this.uniqueId,
			}).appendTo("#interfaceList tbody");
			var $td = $("<td/>").appendTo($tr);
			$($td).text(this.id);			
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.name);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.version);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.type);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.manager);
			
			$td = $("<td/>").appendTo($tr);
			$($td).text(this.upDate);
			
			$td = $("<td/>").appendTo($tr);
			$btn = $("<input/>",{
				'type':"button",
				'class':"btn btn-default",
				'onclick':"location.href='/solar/interface/delete/"+this.uniqueId+"'",
				'value':"����"}).appendTo($td);
		});
	}
	
	function interfaceInfo(interFace){
		$("#interfaceForm input[name='id']").val(interFace.id);
		$("#interfaceForm input[name='version']").val(interFace.version);
		$("#interfaceForm input[name='name']").val(interFace.name);
		$("#interfaceForm input[name='description']").val(interFace.description);
		$("#interfaceForm select[name='type']").val(interFace.type);
		$("#interfaceForm input[name='manager']").val(interFace.manager);
		$("#interfaceForm input[name='srcSystemId']").val(interFace.srcSystemId);
		$("#interfaceForm input[name='srcSystemType']").val(interFace.srcSystemType);
		$("#interfaceForm input[name='srcSystemManager']").val(interFace.srcSystemManager);
		$("#interfaceForm input[name='tgtSystemId']").val(interFace.tgtSystemId);
		$("#interfaceForm input[name='tgtSystemType']").val(interFace.tgtSystemType);
		$("#interfaceForm input[name='tgtSystemManager']").val(interFace.tgtSystemManager);
		$("#interfaceForm input[name='ip']").val(interFace.ip);
		$("#interfaceForm input[name='registDate']").val(interFace.registDate);
		$("#interfaceForm input[name='upDate']").val(interFace.upDate);
		$("#interfaceForm input[name='uniqueId']").val(interFace.uniqueId);
	}
	
	function clearInfo(){
		$("#interfaceForm input[name='id']").val('');
		$("#interfaceForm input[name='version']").val('');
		$("#interfaceForm input[name='name']").val('');
		$("#interfaceForm input[name='description']").val('');
		$("#interfaceForm select[name='type']").val('BAT');
		$("#interfaceForm input[name='manager']").val('');
		$("#interfaceForm input[name='srcSystemId']").val('');
		$("#interfaceForm input[name='srcSystemType']").val('');
		$("#interfaceForm input[name='srcSystemManager']").val('');
		$("#interfaceForm input[name='tgtSystemId']").val('');
		$("#interfaceForm input[name='tgtSystemType']").val('');
		$("#interfaceForm input[name='tgtSystemManager']").val('');
		$("#interfaceForm input[name='ip']").val('');
		$("#interfaceForm input[name='registDate']").val('');
		$("#interfaceForm input[name='upDate']").val('');
		$("#interfaceForm input[name='uniqueId']").val('');
	}
	
	function checkForm(){
		if($("input[name='id']").val()==''){
			alert("���̵� �Է��ϼ���");
			return false;
		}
		if($("input[name='name']").val()==''){
			alert("�̸��� �Է��ϼ���");
			return false;
		}
		if($("input[name='manager']").val()==''){
			alert("����ڸ� �����ϼ���");
			return false;
		}
		if($("input[name='srcSystemId']").val()==''){
			alert("���Žý����� �����ϼ���");
			return false;
		}
		if($("input[name='tgtSystemId']").val()==''){
			alert("�۽Žý����� �����ϼ���");
			return false;
		}
	}
});
</script>
</html>