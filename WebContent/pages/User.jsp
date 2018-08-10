<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../Prototype/prototype.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	
	legend{
		text-align:right;
	}
	
</style>
</head>
<body>

	<br/>

	<div id="viewProfile" align="center">
	<c:forEach var="user" items="${profile}">
	<c:set var="pass" value="${user.password}"></c:set>
	<c:set var="currentUser" value="${user.userId}"></c:set>
	
		<div class="row">
		
			<h4><small>User ID:</small>
			<span id="user">
			<c:out value="${currentUser}"></c:out>
			</span>
			</h4>
		
		</div>
	
		<div class="row">
		
			<h4><small>First Name:</small>
			<span id="firstName"><c:out value="${user.firstName}"></c:out></span>
			</h4>
		
		</div>
	
		<div class="row">
		
			<h4><small>Last Name:</small>
			<span id="lastName"><c:out value="${user.lastName}"></c:out></span>
			</h4>
			
		</div>
	
		<div class="row">
		
			<h4><small>Middle Initial:</small>
			<span id="midInitial"><c:out value="${user.middleInitial}"></c:out></span>
			</h4>
		
		</div>
	
		<div class="row">
		
			<h4><small>Email Address:</small>
			<span id="email"><c:out value="${user.email}"></c:out></span>
			</h4>
			
		</div>
	
		<div class="row">
		
			<h4><small>Last Login:</small>
			<span id="user"><fmt:formatDate pattern="dd/MM/20yy" value="${user.lastLogin}"/></span>
			</h4>
		
		</div>
	
		<div class="row">
		
			<h4><small>Account Created on:</small>
			<span id="user"><fmt:formatDate pattern="dd/MM/20yy" value="${user.entryDate}"/></span>
			</h4>
		
		</div>
	
	</c:forEach>
	
	<input type="button" id="updateProfile" value="Update Profile" class="btn btn-primary"/>
	<input type="button" id="changePass" value="Change Password" class="btn btn-primary"/>
	
	</div>

	<div id="update" align="center">
	
		<div align="left" style="width:50%">
		
			<div class="row">
			
				<div class="col-sm-12">
				<b>User ID:</b><input type="text" class="form-control" id="txtUser">
				<br/><h4 id="showId"></h4>
				</div>
			
			</div>
			<div class="row">
			
				<div class="col-sm-5">
				<b>First Name:</b><input type="text" class="form-control" id="txtFirst">
				</div>
			
				<div class="col-sm-5">
				<b>Last Address:</b><input type="text" class="form-control" id="txtLast">
				</div>
			
				<div class="col-sm-2">
				<b>M.I.:</b><input type="text" class="form-control" id="txtMiddle">
				</div>
				
			</div>
			<div class="row">
			
				<div class="col-sm-12">
				<b>Email Address:</b><input type="text" class="form-control" id="txtEmail">
				</div>
			
			</div>
		
			<br/>
			
			<input type="button" id="confirmUpdate" value="Save" class="btn btn-primary"/>
			
		</div>
	
	</div>

	<div id="password" align="center">
	<h4 id="greeting"></h4>
	
		<div align="left" style="width:40%">

		<div class="row">
		
			<div class="col-sm-12">
			<b>Current Password:</b><input type="password" class="form-control" id="currentPass">
			</div>
		
		</div>
		<div class="row">
		
			<div class="col-sm-12">
			<b>New Password:</b><input type="password" class="form-control" id="newPass">
			</div>
		
		</div>
		<div class="row">
		
			<div class="col-sm-12">
			<b>Retype Password:</b><input type="password" class="form-control" id="retypePass">
			</div>
		
		</div>
	
		<br/>
		<input type="button" id="confirmPass" value="Save" class="btn btn-primary"/>
		
		</div>
	
	</div>
	
	<br/>
	
	<div align="right" style="width:70%">
		<input type="button" id="btnCancel" value="Cancel" class="btn btn-primary"/>
	</div>

</body>
<script>

	var pass = '${pass}';
	var currentUser = '${currentUser}';
	
	if(
			(currentUser == pass) || 
			(pass.length < 8 || pass.length > 20) || 
			(pass.includes(" "))
	){
		$('greeting').innerHTML = "Please change the password to continue.";
		$('viewProfile').hide();
		$('update').hide();
		$('btnCancel').hide();
		$('password').show();
	} else {
		defaultView();
		updateLogin();
	}

	$('btnCancel').observe('click', function(){defaultView();});

	$('updateProfile').observe('click', function(){showUserUpdate()});

	$('confirmUpdate').observe('click', function(){updateProfile();});
	
	$('confirmPass').observe('click', function(){updatePassword();});

	$('changePass').observe('click', function(){
		$('viewProfile').hide();
		$('password').show();
		$('btnCancel').show();
	});
	
	function clearAll(){
		
		$('txtUser').show();

		$('txtUser').value = "";
		$('txtFirst').value = "";
		$('txtLast').value = "";
		$('txtMiddle').value = "";
		$('txtEmail').value = "";
		$('currentPass').value = "";
		$('newPass').value = "";
		$('retypePass').value = "";
		
	}
	
	function defaultView(){
		clearAll();
		$('viewProfile').show();
		$('greeting').innerHTML = "";
		$('password').hide();
		$('update').hide();
		$('btnCancel').hide();
	}
	
	function showUserUpdate(){
		$('viewProfile').hide();
		$('update').show();
		$('btnCancel').show();
		$('txtUser').hide();

		$('showId').innerHTML = currentUser;
		
		$('txtFirst').value = $('firstName').innerHTML;
		$('txtLast').value = $('lastName').innerHTML;
		$('txtMiddle').value = $('midInitial').innerHTML;
		$('txtEmail').value = $('email').innerHTML;
	}
	
	function updateProfile(){
		
		if(
			$F('txtFirst') == "" ||
			$F('txtLast') == ""
		) {
		} else {
			new Ajax.Request(contextPath + "/updateProfile", {
				method:"POST",
				parameters:{
					userId:currentUser,
					firstName:$F('txtFirst'),
					lastName:$F('txtLast'),
					middleInitial:$F('txtMiddle')==""?null:$F('txtMiddle'),
					email:$F('txtEmail')==""?null:$F('txtMiddle'),
					lastUpdate:getCurrentDate(),
					action:"update"
				},
				onComplete:function(response){
					refresh();
					defaultView();
				}
			});
			
		}
		
	}
	
	function updatePassword(){
		
		if(
				$F('currentPass') != pass ||
				$F('newPass') != $F('retypePass')
		){
			
		} else if(pass == $F('newPass')){
			
		} else if($F('newPass').length < 8 ||
				$F('newPass').length > 20){
			
		} else if($F('newPass').includes(" ")){
			
		} else {
			new Ajax.Request(contextPath + "/updatePassword", {
				method:"POST",
				parameters:{
					userId:currentUser,
					password:$F('newPass'),
					lastUpdate:getCurrentDate(),
					action:"updatePass"
				},
				onComplete:function(response){
					refresh();
					defaultView();
				}
			});
			
		}
		
	}
	
	function updateLogin(){
		new Ajax.Request(contextPath + "/updateUserLogDate", {
			method:"POST",
			parameters:{
				userId:'${currentUser}',
				lastLogin:getCurrentDate(),
				action:"updateUserLogDate"
			},
			onComplete:function(response){
				defaultView();
			}
		});
	}
	
	function refresh(){
		new Ajax.Request(contextPath + "/user", {
			method:"GET",
			parameters:{
				username:currentUser
			},
			onComplete:function(response){
				$("content").update(response.responseText);
				defaultView();
				updateLogin();
			}
		});
	}
	
	function getCurrentDate(){
		
		var now = new Date();
		var day = now.getDate();
		var month = now.getMonth()+1;
		var year = now.getFullYear();
		var date = day + "/" + month + "/" + year;
		return date;
		
	}

</script>
</html>