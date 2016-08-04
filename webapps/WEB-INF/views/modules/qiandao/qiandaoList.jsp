<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>签到成功管理</title>
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
		<li class="active"><a href="${ctx}/qiandao/qiandao/">我的签到</a></li>
		<shiro:hasPermission name="qiandao:qiandao:edit"><li><a href="${ctx}/qiandao/qiandao/form">签到成功添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="qiandao" action="${ctx}/qiandao/qiandao/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div style="margin-top:8px;">
			<label>日期范围：&nbsp;</label><input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${qiandao.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			<label>&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
				value="<fmt:formatDate value="${qiandao.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>&nbsp;&nbsp;
			
			&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
		</div>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>日期</th>
				<th>星期</th>
				<th>上课打卡</th>
				<th>下课打卡</th>
				<th>更新时间</th>
				
				<shiro:hasPermission name="qiandao:qiandao:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="qiandao">
			<tr>
			<td>${qiandao.date}</td>
			<td>${qiandao.week}</td>
			<td <c:if  test="${qiandao.clockIn=='缺勤'}" > style="color:red" </c:if> >${qiandao.clockIn}</td>
			<td <c:if  test="${qiandao.clockIn=='缺勤'}" > style="color:red" </c:if> >${qiandao.clockOut}</td>
				<td><fmt:formatDate value="${qiandao.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				
				<shiro:hasPermission name="qiandao:qiandao:edit"><td>
    				<a href="${ctx}/qiandao/qiandao/form?id=${qiandao.id}">修改</a>
					<a href="${ctx}/qiandao/qiandao/delete?id=${qiandao.id}" onclick="return confirmx('确认要删除该签到成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>