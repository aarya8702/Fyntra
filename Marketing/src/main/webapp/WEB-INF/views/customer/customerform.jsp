<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Quicksand:500" />
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
<script type="text/javascript">
	$(window).on('scroll', function() {

		if ($(window).scrollTop()) {
			$('.navbar').addClass('navbar-default');
		} else {
			$('.navbar').removeClass('navbar-default');
		}
	})
</script>
<title>Customer Registration</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-top: 100px;">
		<spring:url value="/newCustomer" var="saveUrl" />
		<form:form class="well form-horizontal" action="${saveUrl }"
			method="post" modelAttribute="customerForm">
			<form:hidden path="custId" />
			<div class="container">
				<h2>Customer Registration</h2>
			</div>
			<hr>
			<c:if test="${EmailSent}">
				<div class="alert alert-success">*An email has been sent to
					the email address you just registered. Please validate your email
					address and update your personal information.</div>
			</c:if>
			<c:if test="${not empty error}">
				<div class="alert alert-danger">*${error}</div>
			</c:if>

			<div class="form-group">
				<label class="col-md-4 control-label">Enter Email Address</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-envelope"></i></span>
						<form:input path="user.email" placeholder="Email Address"
							required="required" class="form-control" type="email" />
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-md-4 control-label">Enter Password</label> &nbsp;<span
					id="checkPasswordMatch" style="color: red;"></span>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span>
						<form:input id="txtNewPassword" path="user.password"
							required="required" placeholder="Password" class="form-control"
							type="password" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">Enter Confirm Password</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span> <input
							id="txtConfirmPassword" required="required"
							placeholder="Password" class="form-control" type="password" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label"></label>
				<div class="col-md-4">
					<br>
					<button id="registerRetailer" type="submit" class="btn btn-primary">
						Register!</button>
				</div>
			</div>

		</form:form>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>