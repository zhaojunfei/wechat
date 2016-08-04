<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>微信地理位置管理</title>
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
		<li class="active"><a href="${ctx}/location/wechatLocation/">微信地理位置列表</a></li>
		<shiro:hasPermission name="location:wechatLocation:edit"><li><a href="${ctx}/location/wechatLocation/form">微信地理位置添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="wechatLocation" action="${ctx}/location/wechatLocation/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="location:wechatLocation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="wechatLocation">
			<tr>
				<td><a href="${ctx}/location/wechatLocation/form?id=${wechatLocation.id}">
					<fmt:formatDate value="${wechatLocation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${wechatLocation.remarks}
				</td>
				<shiro:hasPermission name="location:wechatLocation:edit"><td>
    				<a href="${ctx}/location/wechatLocation/form?id=${wechatLocation.id}">修改</a>
					<a href="${ctx}/location/wechatLocation/delete?id=${wechatLocation.id}" onclick="return confirmx('确认要删除该微信地理位置吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>