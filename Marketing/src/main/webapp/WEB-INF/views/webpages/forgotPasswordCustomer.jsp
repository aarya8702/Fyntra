<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
	<title>Fashion Store: Customer Forgot Password</title>
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-default');
}else{
	$('.navbar').removeClass('navbar-default');
}
})</script>
</head>
<body>
	<div class="container" style="margin-top: 100px;">
		<form class="well form-horizontal" action="<c:url value='/forgotPasswordCustomerPost'></c:url>" method="post">
		<div class = "container">
		 <h2>Customer Reset Password Portal</h2>
		 </div>
		 <hr>
		 <c:if test="${forgetPasswordEmailSent}">
		 <div class = "alert alert-success">*An email has been sent to the email address.Kindly Change Your Password!</div>
		 </c:if>
		  <c:if test="${NotExists}">
		 <div class = "alert alert-danger">*Email Not Exists</div>
		 </c:if>
			<div class="form-group">
				<label class="col-md-4 control-label">Enter Email Address</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-envelope"></i></span> 
							<input required="required" name="emaill" placeholder="Email Address" class="form-control" type="email"/>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label"></label>
				<div class="col-md-4">
					<br>
					<button id = "registerRetailer" type="submit" class="btn btn-primary">
						Reset!
					</button>
				</div>
			</div>

		</form>
	</div>
</body>
</html>