<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品列表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function ajaxSupermarketType(id){
			 $.post("../../type/supermarketType/detail",{id:id},function(result){
				 $("#name").val(result.label)
				    $("#value").val(result.value)
				  });
		}
		function Percent(){
			if($("#value").val()==""||$("#price").val()==""){
				console.log("当前数据为不可用");
				return;
			}
			var a = parseFloat($("#price").val()) - parseFloat($("#value").val());
			var b = parseFloat(a)/parseFloat($("#price").val());
			$("#gain").val(b);
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/supermarket/stop/supermarketShop/">商品列表列表</a></li>
		<li class="active"><a href="${ctx}/supermarket/stop/supermarketShop/form?id=${supermarketShop.id}">商品列表<shiro:hasPermission name="supermarket:stop:supermarketShop:edit">${not empty supermarketShop.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="supermarket:stop:supermarketShop:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="supermarketShop" action="${ctx}/supermarket/stop/supermarketShop/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">商品分类：</label>
			<div class="controls">
				<form:select path="typeId" class="input-xlarge required" onchange="ajaxSupermarketType(this.options[this.options.selectedIndex].value)">
					<form:option value="" label=""/>
					<form:options items="${typeList}" itemLabel="label" itemValue="id" htmlEscape="false"/>
				</form:select>
				
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品名称：</label>
			<div class="controls">
				<form:input path="name" id="name" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单位：</label>
			<div class="controls">
				<form:select path="company" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('company')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">进货价：</label>
			<div class="controls">
				<form:input path="value" id="value" htmlEscape="false" class="input-xlarge required" onblur="Percent()"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">零售价：</label>
			<div class="controls">
				<form:input path="price" id="price" htmlEscape="false" class="input-xlarge required" onblur="Percent()"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">利润百分比：</label>
			<div class="controls">
				<form:input path="gain" id="gain" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">描述：</label>
			<div class="controls">
				<form:input path="description" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="supermarket:stop:supermarketShop:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>