<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>中软瑞达-签到成功</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<meta name="description"
	content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">

<link rel="stylesheet" href="../static/weui/css/weui.min.css">
<link rel="stylesheet" href="../static/weui/css/jquery-weui.css">
<script src="../static/weui/js/jquery-2.1.4.js"></script>
<script src="../static/weui/js/jquery-weui.js"></script>


</head>

<body ontouchstart>

	<div class="weui_msg">
      <div class="weui_icon_area"><i class="weui_icon_success weui_icon_msg"></i></div>
      <div class="weui_text_area">
        <h2 class="weui_msg_title">签到成功</h2>
      </div>
      <div class="weui_opr_area">
        <p class="weui_btn_area">
           <a href="javascript:;" onclick="WeixinJSBridge.call('closeWindow');" class="weui_btn weui_btn_primary">确定</a>
        </p>
      </div>
    </div>
</body>
</html>
