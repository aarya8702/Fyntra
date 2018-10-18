<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<title>Fashion Store: Registration</title>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/style.css'></c:url>">
<script>
	$(document).ready(function() {

		$("#txtConfirmPassword").keyup(checkPasswordMatch);
		$("#txtNewPassword").keyup(checkPasswordMatch);
	});
	function checkPasswordMatch() {
		var password = $("#txtNewPassword").val();
		var confirmPassword = $("#txtConfirmPassword").val();

		if (password == "" && confirmPassword == "") {
			$("#checkPasswordMatch").html("");
			$("#registerRetailer").prop('disabled', false);
		} else {
			if (password != confirmPassword) {
				$("#checkPasswordMatch").html("Passwords do not match!");
				$("#registerRetailer").prop('disabled', true);
			} else {
				$("#checkPasswordMatch").html("Passwords match");
				$("#registerRetailer").prop('disabled', false);
			}
		}
	}
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<h2>Registration Hub</h2>
		<!--  <p>To make the tabs toggleable, add the data-toggle="tab" attribute to each link. 
  Then add a .tab-pane class with a unique ID for every tab and wrap them inside a div element with class .tab-content.</p> 
  -->

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#customer">Register
					as a Customer?</a></li>
			<li><a data-toggle="tab" href="#retailer">Register as a
					Retailer?</a></li>
		</ul>

		<div class="tab-content">
			<div id="customer" class="tab-pane fade in active">
			
				<h3>Customer Registration Form</h3>
				<hr>
				<c:if test="${EmailSent }">
					<div class="row">
						<div class="col-md-6">
							<div class="alert alert-success">*An Email has been
								sent.Kindly check your email to verify your account and update
								your personal Information.</div>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty error }">
					<div class="row">
						<div class="col-md-6">
							<div class="alert alert-danger">*Email Already Exists</div>
						</div>
					</div>
				</c:if>
				<div class="row">
				<spring:url value="/newCustomer" var="saveUrl"/>
					<form:form action="${saveUrl }" method="post"
						class="form-horizontal" modelAttribute="customerForm">
						<form:hidden path="custId" />

						<div class="form-group">
							<label class="col-md-2 control-label"><b>Email
									Address: </b></label>
							<div class="col-md-4">
								<form:input type="text" path="user.email" class="form-control"
									placeholder="Enter Email Address" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label"><b>Password: </b></label>
							<div class="col-md-4">
								<form:input type="password" path="user.password"
									class="form-control" placeholder="Enter Password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label"><b>Confirm
									Password: </b></label>
							<div class="col-md-4">
								<form:input id="password" type="password" path=""
									class="form-control" placeholder="Enter Confirm Password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-success">Register!</button>
							</div>
						</div>
					</form:form>
				</div>
				
			</div>
			<div id="retailer" class="tab-pane fade">
			
				<h3>Retailer Registration Form</h3>
				<hr>
				<c:if test="${EmailSent }">
					<div class="row">
						<div class="col-md-6">
							<div class="alert alert-success">*An Email has been
								sent.Kindly check your email to verify your account and update
								your personal Information.</div>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty error }">
					<div class="row">
						<div class="col-md-6">
							<div class="alert alert-danger">*Email Already Exists</div>
						</div>
					</div>
				</c:if>
				<div class="row">
				<spring:url value="/newRetailer" var="saveUrl"/>
					<form:form action="${saveUrl }" method="post"
						class="form-horizontal" modelAttribute="retailerForm">
						<form:hidden path="retId" />

						<div class="form-group">
							<label class="col-md-2 control-label"><b>Email
									Address: </b></label>
							<div class="col-md-4">
								<form:input type="text" path="user.email" class="form-control"
									placeholder="Enter Email Address" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label"><b>Password: </b></label>
							<div class="col-md-4">
								<form:input type="password" path="user.password"
									class="form-control" placeholder="Enter Password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label"><b>Confirm
									Password: </b></label>
							<div class="col-md-4">
								<form:input id="password" type="password" path=""
									class="form-control" placeholder="Enter Confirm Password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2"></label>
							<div class="col-md-4">
								<button type="submit" class="btn btn-success">Register!</button>
							</div>
						</div>
					</form:form>
				</div>
				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>