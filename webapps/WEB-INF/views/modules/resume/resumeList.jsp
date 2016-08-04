<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人基础信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/resume/resume/">学员信息审核</a></li>
<!-- 		<shiro:hasPermission name="resume:resume:edit"><li><a href="${ctx}/resume/resume/form">个人基础信息添加</a></li></shiro:hasPermission>
 -->
	</ul>
	<form:form id="searchForm" modelAttribute="resume" action="${ctx}/resume/resume/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>性别</th>
				<th>手机号</th>
				<th>证件类型</th>
				<th>证件号</th>
				<shiro:hasPermission name="resume:resume:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="resume">
			<tr>
				<td><a href="${ctx}/resume/resume/form?id=${resume.id}">
					${resume.name}
				</a></td>
				<td>${fns:getDictLabel(resume.gender, 'sex', '女')}
				</td>
				<td>${resume.mobile}
				</td>
				<td>${fns:getDictLabel(resume.cardType, 'card_type', '身份证')}
				</td>
				<td>${resume.idnumber}
				</td>
				<shiro:hasPermission name="resume:resume:edit"><td>
    				<a href="${ctx}/resume/resume/form?id=${resume.id}">审核信息</a>
					<a href="${ctx}/resume/resume/delete?id=${resume.id}" onclick="return confirmx('确认要删除该个人基础信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>