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
			function searchfn(obj){
				$.post("${pageContext.request.contextPath}/searchServlet",
						{"word",obj.value},
						function(data){
							var content="";
							if(data!=null){
								for(var i=0;i<data.length;i++){
									content+=
										"<div onmouseover='overfn(this)' onclick='clickfn(this)' onmouseout='outfn(this)'>"
										+data[i].pname+"</div>";
								}
								$("#searchContentDiv").html(content);
								$("#searchContentDiv").css("display","block");
							}
						},"json"
						);
				function clickfn(obj){
					$("#searchInput").val($(obj).html());
				}
				function overfn(obj){
					$(obj).css("background-color","#999");
				}
				function outfn(obj){
					$(obj).css("background-color","#fff");
				}

			}
</script>
</head>
<body>
<div align="center">
		<div>
			<input id="searchInput" type="text" size="100px" onkeyup="searchfn(this)" />
			<button type="button" >搜索</button><br>
		</div>
		<div style="position:relative;width:675px">
			<div id="searchContentDiv" style="position:absolute;
			border:1px solid #999999;width:631px;display:none">	
			</div>
		</div>
	</div>
</body>
</html>