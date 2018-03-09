<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#id").blur(function(){
		$.get("${pageContext.request.contextPath}/checkUser",
				{"username":this.value},
			function(data){
					if(data!=null){
						var username=data.username;
						$("#span1").html("用户名已被注册");
					}else{
						$("#span1").html("用户名可以使用");
					}
				},"json"
				);
	});
});
</script>
</head>
<body>
	<form>
		用户名：<input type="text" id="username" name="username" /><span id="span1"></span><br /> 
		密码：<input
			type="password" name="password" /><br /> <input type="submit"
			name="注册" />		
	</form>
</body>
</html>