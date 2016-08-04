<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>个人基础信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										loading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
										} else {
											error.insertAfter(element);
										}
									}
								});
			});
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/resume/resume/">学员待审息列表</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="resume"
		action="${ctx}/resume/resume/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="20"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<form:select path="gender" class="input-xlarge ">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('sex')}" itemLabel="label"
						itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">手机号码：</label>
			<div class="controls">
				<form:input path="mobile" htmlEscape="false" maxlength="20"
					class="input-xlarge required" />
					<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件类型：</label>
			<div class="controls">
				<form:select path="cardType" class="input-xlarge required">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('card_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">证件号：</label>
			<div class="controls">
				<form:input path="idnumber" htmlEscape="false" maxlength="25"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人头像：</label>
			<div class="controls">
				<form:hidden id="headimgurl" path="headimgurl" htmlEscape="false"
					maxlength="200" class="input-xlarge" />
				<sys:ckfinder input="headimgurl" type="files"
					uploadPath="/resume/resume" selectMultiple="true" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出生日期：</label>
			<div class="controls">
				<input name="birthday" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate "
					value="${resume.birthday}"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作年限：</label>
			<div class="controls">
				<form:input path="workYear" htmlEscape="false" maxlength="11"
					class="input-xlarge " />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">居住地：</label>
			<div class="controls">
				<form:input path="location" htmlEscape="false" maxlength="150"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">email：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="80"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">目前年薪：</label>
			<div class="controls">
				<form:input path="salary" htmlEscape="false" maxlength="11"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">求职状态：</label>
			<div class="controls">
				<form:input path="currentSituation" htmlEscape="false"
					maxlength="11" class="input-xlarge " />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">户口：</label>
			<div class="controls">
				<form:input path="hukou" htmlEscape="false" maxlength="150"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">关键字：</label>
			<div class="controls">
				<form:input path="resumekey" htmlEscape="false" maxlength="12"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身高：</label>
			<div class="controls">
				<form:input path="stature" htmlEscape="false" maxlength="11"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">婚姻状况：</label>
			<div class="controls">
				<form:input path="marrige" htmlEscape="false" maxlength="11"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">qq号：</label>
			<div class="controls">
				<form:input path="qqTalk" htmlEscape="false" maxlength="20"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮编：</label>
			<div class="controls">
				<form:input path="zipCode" htmlEscape="false" maxlength="6"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">旺旺id：</label>
			<div class="controls">
				<form:input path="aliTalk" htmlEscape="false" maxlength="100"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人主页：</label>
			<div class="controls">
				<form:input path="homePage" htmlEscape="false" maxlength="200"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地址：</label>
			<div class="controls">
				<form:input path="address" htmlEscape="false" maxlength="150"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工作经验：</label>
			<div class="controls">
				<form:input path="studentGroup" htmlEscape="false" maxlength="11"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:select path="status" class="input-xlarge required">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="resume:resume:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>