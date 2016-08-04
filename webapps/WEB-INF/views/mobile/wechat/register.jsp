<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>中软瑞达官方网站</title>
<link rel="stylesheet" href="../static/weui/css/weui.min.css" />
<link rel="stylesheet" href="../static/weui/css/jquery-weui.css">
<script src="../static/weui/js/jquery-2.1.4.js"></script>
<script src="../static/weui/js/jquery-weui.js"></script>
<script src="../static/jquery-validation/1.11.1/jquery.validate.min.js"></script>
</head>
<body ontouchstart>

<header class='demos-header'>
      <h1 class="demos-title">绑定用户信息</h1>
    </header>

	<form action="checkCode" id="registerForm" method="post">
	<input class="weui_input" name="code" type="hidden" value="${code}"/>
		<div class="weui_cells weui_cells_form">
      <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">姓名</label></div>
        <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" id="truename" name="truename" type="text" placeholder="请输入真实姓名" />
        </div>
      </div>
		<div class="weui_cell">
			<div class="weui_cell_hd">
				<label class="weui_label">证件号码</label>
			</div>
			<div class="weui_cell_bd weui_cell_primary">
			<input class="weui_input" type="text" id="idnumber" name="idnumber" placeholder="请输入身份证号码">
			</div>
		</div>
      <div class="weui_cell">
        <div class="weui_cell_hd"><label class="weui_label">手机号</label></div>
        <div class="weui_cell_bd weui_cell_primary">
          <input class="weui_input" id="tel" name="phone" type="number"
						pattern="[0-9]*" placeholder="注册人手机号" />
        </div>
      </div>
     <div class="weui_btn_area">
        <a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips">确定</a>
      </div>
    </div>
	</form>
	<script>
	
	 $("#showTooltips").click(function() {
	        var tel = $('#tel').val();
	        var name = $("#truename").val();
	        var idnumber = $("#idnumber").val();
	        if(!name)$.toptip('请输入真实姓名');
	        else if(!tel || !/1[3|4|5|7|8]\d{9}/.test(tel)) $.toptip('请输入正确手机号');
	        else if (!idnumber) $.toptip('请输入证件号码');
	        else {
	        	$("#registerForm").submit();
	        }
	      });
    </script>
</body>
</html>
