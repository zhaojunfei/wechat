<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>超市种类信息表管理</title>
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
		<li class="active"><a href="${ctx}/supermarket/type/supermarketType/">超市种类信息表列表</a></li>
		<shiro:hasPermission name="supermarket:type:supermarketType:edit"><li><a href="${ctx}/supermarket/type/supermarketType/form">超市种类信息表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="supermarketType" action="${ctx}/supermarket/type/supermarketType/" method="post" class="breadcrumb form-search">
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
			<tr><th>商品名称</th>
			<th>单价</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="supermarket:type:supermarketType:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="supermarketType">
			<tr>
				<td><a href="${ctx}/supermarket/type/supermarketType/form?id=${supermarketType.id}">
					${supermarketType.label}
					</a>
				</td>
				<td>
					${supermarketType.value}
				</td>
				<td>
					<fmt:formatDate value="${supermarketType.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${supermarketType.remarks}
				</td>
				<shiro:hasPermission name="supermarket:type:supermarketType:edit"><td>
    				<a href="${ctx}/supermarket/type/supermarketType/form?id=${supermarketType.id}">修改</a>
					<a href="${ctx}/supermarket/type/supermarketType/delete?id=${supermarketType.id}" onclick="return confirmx('确认要删除该超市种类信息表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>