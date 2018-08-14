<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SMS Module: User Maintenance</title>
		
		<script src="Prototype/prototype.js"></script>
		<script>var contextPath = "${pageContext.request.contextPath}";</script>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
	
	</head>
	
	<body>
	
	<div class="container">	
	
		<h4 id="loading">loading...</h4>
		<div id="content" align="center">
		
		<div style="width: 400px; ">
		
			<br><br> <br>
		
			<div class="form-group">
			<input type="text" id="txtUsername" name="username" class="form-control" placeholder="Username" required="required"/>
			</div>
			
			<div class="form-group">
			<input type="password" id="txtPassword" name="password" class="form-control" placeholder="Password" required="required"/>
			</div>
			
			<br>
			
			<input type="button" value="User Maintenance Page" id="btnAdmin"/>
			<input type="button" value="User Profile Page" id="btnUser"/>
		
		</div>
		
		</div>
		<br/>
		<div align="right">
		<form action=""><input type="Submit" value="Log out" id="logout"/></form>
		</div>
		
	</div>
	
	</body>
	
	<script>
	
	$('btnAdmin').observe('click', function(){redirect("/admin");});
	$('btnUser').observe('click', function(){redirect("/user");});
	
	$('loading').hide();
	$('logout').hide();
	
	function redirect(path){
		
		if($F('txtUsername') == "" || $F('txtPassword') == ""){
		} else {
			new Ajax.Request(contextPath + path, {
				method:"GET",
				parameters:{
					username:$F('txtUsername'),
					password:$F('txtPassword')
				},
				onLoading:function(response){
					$('loading').show();
				},
				onComplete:function(response){
					$('loading').hide();
					$('logout').show();
					$("content").update(response.responseText);
				}
			});
		}
	}
	
	</script>

</html>