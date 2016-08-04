<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE >
<html>
<head>
<title>人才登记</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description"
	content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<link rel="stylesheet" href="${ctxStatic}/weui/css/weui.min.css">
<link rel="stylesheet" href="${ctxStatic}/weui/css/jquery-weui.css">
<script src="${ctxStatic}/weui/js/jquery-2.1.4.js"></script>
<script src="${ctxStatic}/weui/js/jquery-weui.js"></script>


</head>

<body ontouchstart>


	<h2 class="demos-second-title">人才登记</h2>
	<form id="inputForm" enctype="multipart/form-data"   action="${ctx}/resume/resume/resumeSubmit" method="post" class="form-horizontal">
	<input class="weui_input" type="hidden" name="channel" value="WECHAT" />
	<div class="weui_cells weui_cells_form">
		
				<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">班级</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" id="officeId_title">
				<input class="weui_input" type="hidden" id="officeId" name="officeId">
			</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">姓名</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" id="name" name="name"
					placeholder="请输入真实姓名">
			</div>
		</div>

		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">性别</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" id="sex_title">
				<input class="weui_input" type="hidden" id="sex" name="gender">
			</div>
		</div>
		

		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">证件类型</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="text" id="card_type_title" >
				<input class="weui_input" type="hidden" id="card_type" name="cardType">
			</div>
		</div>


		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">证件号码</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
			<input class="weui_input" type="text" id="idnumber" name="idnumber">
			</div>
		</div>
		
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">手机号码</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="tel" id="tel" name="mobile">
			</div>
		</div>

		
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">出生日期</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input class="weui_input" type="date" id="birthday" name="birthday">
			</div>
		</div>
		
		<div class="weui_cell weui_vcode weui_cell_warn">
			<div class="weui_cell_hd">
				<label class="weui_label">验证码</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
				<input id='code' class="weui_input" type="type" name="validateCode"
					placeholder="请输入验证码">
			</div>
			<div class="weui_cell_ft">
				<i class="weui_icon_warn"></i> <img
					src="${pageContext.request.contextPath}/servlet/validateCodeServlet">
			</div>
		</div>
		<div class="weui_cells_tips">底部说明文字底部说明文字</div>
		<div class="weui_btn_area">

				<a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips">确定</a>
		</div>
	</div>
</form>
	


	<script>
	$(document).ready(function(){
	$("#birthday").calendar();
    
	var officeId_items; 
	$.ajax({ 
		async: false, 
		type : "POST", 
		url : "/api/clazz", 
		dataType : 'json', 
		success : function(data) { 
			officeId_items=data; 
		} 
	}); 
	
	var sex_items; 
	$.ajax({ 
		async: false, 
		type : "POST", 
		url : "/api/sex", 
		dataType : 'json', 
		success : function(data) { 
			sex_items=data; 
		} 
	}); 
	
	
	var cardType_items; 
	$.ajax({ 
		async: false, 
		type : "POST", 
		url : "/api/cardType", 
		dataType : 'json', 
		success : function(data) { 
			cardType_items=data; 
		} 
	}); 
	
	$("#officeId_title").select({
        title: "选择班级",
        items: officeId_items, onChange: function(d) {
        	$("#officeId").val(this.data.values);
        }
      });
	
	
	$("#sex_title").select({
        title: "选择性别",
        items:sex_items, onChange: function(d) {
        	$("#sex").val(this.data.values);
        }
      });
    $("#card_type_title").select({
        title: "选择证件类型",
        items: cardType_items, onChange: function(d) {
    	$("#card_type").val(this.data.values);
      }
      });
    
	    $("#showTooltips").click(function() {
	        var tel = $('#tel').val();
	        var code = $('#code').val();
	        var name = $("#name").val();
	        var card_type = $("#card_type").val();
	        var idnumber = $("#idnumber").val();
	        if(!name)$.toptip('请输入真实姓名');
	        else if(!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入正确手机号');
	        else if (!card_type) $.toptip('请选择证件类型');
	        else if (!idnumber) $.toptip('请输入证件号码');
	        else if(!code ) $.toptip('请输入验证码');
	        else {
	        	$("#inputForm").submit();
	        }
	      });
	})
    </script>
</body>
</html>
