<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
	<head>
		<meta charset="utf-8"/>
		<title>meetroom登录</title>
		<link rel="stylesheet" href="${path}/css/bootstrap/css/bootstrap.min.css" type="text/css"></link>
	    <script type="text/javascript" src="${path}/js/jquery.min.js"></script>
	    <script src="${path}/js/gt.js"></script>
	    
	    <style>
	    .show {
            display: block;
        }
        .hide{
            display: none;
        }
         #notice1,#notice2 {
            color: red;
        }
         #wait1, #wait2 {
            text-align: left;
            color: #666;
            margin: 0;
        }
        .myTop{
        	margin-top:100px
        }
    	</style>
	</head>
  	<body>
  		
  		<div class="container myTop">
  			<div class="row">
  			 <div class="col-md-6 col-md-offset-3">
  			 
  			 
  			 <form class="form-horizontal">
  <div class="form-group has-feedback has-success">
    <label for="inputEmail3" class="col-sm-3 control-label">Account:</label>
    <div class="col-sm-7 input-group">
   		<span class="input-group-addon"> <span class="glyphicon glyphicon-user"></span> </span>
        <input type="text" id="account" name="account" class="form-control" id="inputEmail3" placeholder="Email"> 
    </div>
  </div>
  <div class="form-group has-feedback has-success">
    <label for="inputPassword3" class="col-sm-3 control-label">Password:</label>
    <div class="col-sm-7 input-group">
    <span class="input-group-addon"> <span class="glyphicon glyphicon-lock"></span> </span> 
      <input type="password" id="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
    </div>
  </div>
  
  
  <div class="form-group  has-warning">
	    <label for="inputPassword3" class="col-sm-3 control-label">完成验证：</label>
	    <div class="col-sm-7" style="padding-left:0px;padding-right:0px" id="captcha2">
	     	<p id="wait2" class="hide">正在加载验证码......</p>
	    </div>
  </div>
  <!-- 没有滑动极速时，出现的提示信息 -->
  <div class="form-group">
    <div class="col-sm-10">
       <p id="notice2" class="hide">请先完成验证</p>
   	   <input id="submit2" type="submit" class="btn btn-info pull-right" value="登录">
    </div>
  </div>
</form>


					</div>
					</div>
	</div>
	<script>
	var start;
    var handler2 = function (captchaObj) {
        $("#submit2").click(function (e) {
            var result = captchaObj.getValidate();
            //	没滑动极速验证，出现的提示 
            if (!result) {
                $("#notice2").removeClass("hide").attr("class","show")
                setTimeout(function () {
                    $("#notice2").attr("class","hide")
                }, 2000);
            } else {
                $.ajax({
                    url: "${path}/user/login.action?tt=" + (new Date()).getTime(),
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        account: $('#account').val(),
                        password: $('#password').val(),
                        geetest_challenge: result.geetest_challenge,
                        geetest_validate: result.geetest_validate,
                        geetest_seccode: result.geetest_seccode
                    },
                    success: function (data) {
                        if (data.status === 'success') {
                        	if(data.account == "success"){
                        		window.location.href="${path}/user/main.action"
                        	}else{
                        		alert("账户或者密码错误！！！");
                        		$(".geetest_holder").attr("class","hide")
                        		start(); // 重新一个滑动验证
                        	}
                        } else if (data.status === 'fail') {
                            // 第一次滑动正确，账户或密码错误，修改密码再登录，滑动就会出错啦！！！
                            //alert(data.gtResult)
                            alert("验证码错误11111");
                        }
                    }
                })
            }
            e.preventDefault();
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha2");
        captchaObj.onReady(function () {
            $("#wait2").attr("class","hide")
        });
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };
    
    start = function(){
	     $.ajax({
	        url: "${path}/user/gt.action?t=" + (new Date()).getTime(), // 加随机数防止缓存
	        type: "get",
	        dataType: "json",
	        success: function (data) {
	            // 调用 initGeetest 初始化参数
	            // 参数1：配置参数
	            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
	            initGeetest({
	                gt: data.gt,
	                challenge: data.challenge,
	                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
	                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
	                product: "popup", // 产品形式，包括：float，popup
	                width: "100%"
	                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
	            }, handler2);
	        }
	    });
    }
    start();
</script>
  	</body>
</html>





