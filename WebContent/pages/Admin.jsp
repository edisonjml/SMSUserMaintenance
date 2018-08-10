<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="../Prototype/prototype.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">

	
	
	.userId{
		font-color:blue;
		text-decoration:underline;
	}
	
</style>
</head>
<body>

  	<div id="isEmpty" class="alert alert-danger alert-dismissible">
  	 	<a id="isEmptyClose" class="close">&times;</a>
    	<strong>Empty textfield/s detected</strong> Please fill out all the textfields.
  	</div>

  	<div id="isExisting" class="alert alert-danger">
  		<a id="isExistingClose" class="close">&times;</a>
    	<strong>ID already exists</strong> Please think of another user ID
  	</div>
	
	<h4 id="title"></h4>
	<div align="right">
	
		<h4>Current User:</h4>
		<h4 id="currentUser"><c:out value="${loggedIdAdmin}"></c:out></h4>
	
	</div>
	<br/>
	<div id="viewUser">
	
		<div class="input-group">
		
			<input type="text" id="txtSearch" class="form-control" placeholder="Search ID"/>
			<div class="input-group-btn">
				<button class="btn btn-default" id="btnSearch">
				<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		
		</div>
		
		<table id="tblUsers" class="table">
			<thead>
		
			<tr id="UsersHeader">
			
				<th> User ID </th>
				<th> First Name </th>
				<th> Last Name </th>
				<th> M.I. </th>
				<th> Email </th>
				<th> Active </th>
				<th> Access Level </th>
				<th> Entry Date </th>
				<th> Last Login </th>
				<th> Last Updated By </th>
				<th> Last Update </th>
			
			</tr>
			</thead>
			<tbody>
			
			<c:forEach var="user" items="${record}">
			
				<tr class="userRecords">
				
					<td class="userId"><c:out value="${user.userId}"></c:out></td>
					<td><c:out value="${user.firstName}"></c:out></td>
					<td><c:out value="${user.lastName}"></c:out></td>
					<td><c:out value="${user.middleInitial}"></c:out></td>
					<td><c:out value="${user.email}"></c:out></td>
					<td><c:out value="${user.activeTag}"></c:out></td>
					<td><c:out value="${user.accessLevel}"></c:out></td>
					<td><fmt:formatDate pattern="dd/MM/20yy" value="${user.entryDate}"/></td>
					<td><fmt:formatDate pattern="dd/MM/20yy" value="${user.lastLogin}"/></td>
					<td><c:out value="${user.lastUser}"></c:out></td>
					<td><fmt:formatDate pattern="dd/MM/20yy" value="${user.lastUpdate}"/></td>
				
				</tr>
			
			</c:forEach>
			</tbody>
		
		</table>
		
		<button type="button" id="btnAddUsr" class="btn btn-primary">Add New User</button>
	
	</div>
	
	<div align="center">
	
	<div align="left" id="viewBoxes" style="width:50%">
	
		<div class="row">
		
			<div class="col-sm-6" id="user">
			<b>User ID:</b><input type="text" class="form-control" id="txtUser">
			</div>
		
			<div class="col-sm-6" id="pass">
			<b>Password:</b><input type="password" class="form-control"  id="txtPass">
			</div>
		
		</div>
	
		<div class="row">
		
			<div class="col-sm-5">
			<b>First Name:</b><input type="text" class="form-control" id="txtFirst">
			</div>
		
			<div class="col-sm-5">
			<b>Last Name:</b><input type="text" class="form-control" id="txtLast">
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
	
		<div class="row">
		
			<div class="col-sm-6">
				<b>Active Tag:</b>
				<div class="radio">
				
				<label>
				<input type="radio" id="rdoActive" name="rdoActiveTag" value="Y"/>Yes
				</label>
				&nbsp&nbsp
				<label>
				<input type="radio" id="rdoInactive" name="rdoActiveTag" value="N" checked="checked"/>No
				</label>
				
				</div>
				
			</div>
			
			<div class="col-sm-6">
			<b>Access Level:</b>
			
			<select class="form-control" id="accessLevel">
			
				<option value=""></option>
				<option value="A">Admin</option>
				<option value="U">User</option>
			
			</select>
			
			</div>
		
		</div>
	
	</div>
	
	<input type="button" id="confirmAdd" value="Save" class="btn btn-primary">
	<input type="button" id="updateUser" value="Save" class="btn btn-primary">
	<input type="button" id="btnCancel" value="Cancel" class="btn btn-primary">
	
	</div>
	
</body>
<script>

	//VARIABLES
	
	var clickedId = "";
	var currentId = $('currentUser').innerHTML; //home login
	
	//EXECUTED FUNCTIONS
	
	defaultView();

	$('isEmptyClose').observe('click', function(){$('isEmpty').hide();});
	$('isExistingClose').observe('click', function(){$('isExisting').hide();});

	$('confirmAdd').observe('click', function(){insertRecord();});
	$('updateUser').observe('click', function(){updateRecord();});
	$('btnSearch').observe('click', function(){searchRecord();});
	
	$('btnAddUsr').observe('click', function(){
		$('title').innerHTML = "ADD NEW USER";
		$('viewUser').hide();
		$('viewBoxes').show();
		$('confirmAdd').show();
		$('btnCancel').show();
	});
	
	$('btnCancel').observe('click', function(){defaultView();});
	
	$('txtUser').observe('keyup', function(){$('txtPass').value = $F('txtUser');});
	
	clickableUserId();
	updateLogin();
	
	//DECLARED FUNCTIONS
	
	function defaultView(){
		clearAll();
		$('viewUser').show();
		$('viewBoxes').hide();
		$('confirmAdd').hide();
		$('updateUser').hide();
		$('btnCancel').hide();
		$('title').innerHTML = "";
		$('user').show();
		$('pass').show();
		$('isEmpty').hide();
		$('isExisting').hide();
		clickedId = "";
	}
	
	function userClicked(id){
		$$('.userRecords').each(function(user){
			if(user.down("td", 0).innerHTML == id){
				
				$('viewBoxes').show();
				$('updateUser').show();
				
				$('txtFirst').value = user.down("td", 1).innerHTML;
				$('txtLast').value = user.down("td", 2).innerHTML;
				$('txtMiddle').value = user.down("td", 3).innerHTML;
				$('txtEmail').value = user.down("td", 4).innerHTML;
				$('accessLevel').value = user.down("td", 6).innerHTML;
				
				$('viewUser').hide();
				
				$('title').innerHTML = "UPDATE USER";
				$('btnCancel').show();
				$('user').hide();
				$('pass').hide();
				
				clickedId = user.down("td", 0).innerHTML;
				
				$('title').innerHTML += " '" + clickedId + "'";
				
				if (user.down("td", 6).innerHTML == 'A'){
					$('rdoActive').checked = true;
					$('rdoInactive').checked = false;
				} else if (user.down("td", 6).innerHTML == 'I'){
					$('rdoActive').checked = false;
					$('rdoInactive').checked = true;
				}
			}
		});
	}
	
	function clearAll(){

		$('txtUser').value = "";
		$('txtPass').value = "";
		$('txtFirst').value = "";
		$('txtLast').value = "";
		$('txtMiddle').value = "";
		$('txtEmail').value = "";
		$('accessLevel').value = "";
		$('rdoActive').checked = false;
		$('rdoInactive').checked = true;
		
	}
	
	function insertRecord(){

		var isActive;
		
		if($('rdoActive').checked == true){
			isActive = $('rdoActive').value;
		} else if ($('rdoInactive').checked == true){
			isActive = $('rdoInactive').value;
		}
		
		if(
			$F('txtUser') == "" ||
			$F('txtFirst') == "" ||
			$F('txtLast') == "" ||
			$F('accessLevel') == ""	
		) {
			$('isEmpty').show();
		} else if(IdExists()){
			$('isExisting').show();
		} else {
			if ($F('txtPass') == "" || $F('txtPass') == null){
				$('txtPass').value = $F('txtUser')
			}
			var record = new Element('tr');
			record.addClassName('userRecords')
			record.insertCell(0).innerHTML = $F(txtUser);
			record.insertCell(1).innerHTML = $F(txtPass);
			record.insertCell(2).innerHTML = $F(txtFirst);
			record.insertCell(3).innerHTML = $F(txtLast);
			record.insertCell(4).innerHTML = $F(txtMiddle);
			record.insertCell(5).innerHTML = $F(txtEmail);
			record.insertCell(6).innerHTML = isActive;
			record.insertCell(7).innerHTML = $F(accessLevel);
			record.insertCell(8).innerHTML = getCurrentDate();
			record.insertCell(9).innerHTML = getCurrentDate();
			record.insertCell(10).innerHTML = currentId;
			record.insertCell(11).innerHTML = getCurrentDate();
			record.down("td", 0).addClassName('userId');
			clickableUserId();
			
			new Ajax.Request(contextPath + "/insertRecord", {
				method:"POST",
				parameters:{
					userId:$F('txtUser'),
					password:$F('txtPass'),
					firstName:$F('txtFirst'),
					lastName:$F('txtLast'),
					middleInitial:$F('txtMiddle')==""?null:$F('txtMiddle'),
					email:$F('txtEmail')==""?null:$F('txtEmail'),
					activeTag:isActive,
					accessLevel:$F('accessLevel'),
					entryDate:getCurrentDate(),
					lastLogin:getCurrentDate(), //home login
					lastUser:currentId, //home login
					lastUpdate:getCurrentDate(),
					action:"insert"
				},
				onComplete:function(response){
					searchRecord();
					defaultView();
				}
			});
			defaultView();
			
		}
	}
	
	function updateRecord(){

		var isActive;
		
		if($('rdoActive').checked == true){
			isActive = $('rdoActive').value;
		} else if ($('rdoInactive').checked == true){
			isActive = $('rdoInactive').value;
		}
		
		if(
			$F('txtFirst') == "" ||
			$F('txtLast') == "" ||
			$F('accessLevel') == ""	
		) {
		} else {
			new Ajax.Request(contextPath + "/updateRecord", {
				method:"POST",
				parameters:{
					userId:clickedId,
					firstName:$F('txtFirst'),
					lastName:$F('txtLast'),
					middleInitial:$F('txtMiddle')==""?null:$F('txtMiddle'),
					email:$F('txtEmail')==""?null:$F('txtEmail'),
					activeTag:isActive,
					accessLevel:$F('accessLevel'),
					lastUser:currentId, //home login
					lastUpdate:getCurrentDate(),
					action:"update"
				},
				onComplete:function(response){
					searchRecord();
					defaultView();
				}
			});
			
		}
	}
	
	function searchRecord(){
		new Ajax.Request(contextPath + "/searchRecord", {
			method:"GET",
			parameters:{
				search:$F("txtSearch")
			},
			onComplete:function(response){
				$("content").update(response.responseText);
				defaultView();
				$('currentUser').innerHTML = currentId;
			}
		});
		new Ajax.Request(contextPath + "/searchRecord", {
			method:"GET",
			parameters:{
				search:$F("txtSearch")
			},
			onComplete:function(response){
				$("content").update(response.responseText);
				defaultView();
				$('currentUser').innerHTML = currentId;
			}
		});
	}
	
	function updateLogin(){
		//Updating login date only if record exists. this doesn't verify login itself
		$$(".userId").each(function(id){
			if(id.innerHTML == "${loggedIdAdmin}"){
				new Ajax.Request(contextPath + "/updateAdminLogDate", {
					method:"POST",
					parameters:{
						userId:"${loggedIdAdmin}",
						lastLogin:getCurrentDate(),
						action:"updateAdminLogDate"
					},
					onComplete:function(response){
						searchRecord();
						defaultView();
					}
				});
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
	
	function clickableUserId(){
		
		$$('.userId').each(function(id){
			id.observe('click', function(){userClicked(id.innerHTML);});
		});
		
	}
	
	function IdExists(){
		var hadExistingId = false;
		$$(".userRecords").each(function(rec){
			if(rec.down("td", 0).innerHTML == $F("txtUser")){
				hadExistingId = true;
			}
		});
		return hadExistingId;
	}

</script>
</html>