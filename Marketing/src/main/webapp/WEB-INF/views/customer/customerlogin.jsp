<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Customer's Login</title>
<style>
body#LoginForm {
	background-image:
		url("https://hdwallsource.com/img/2014/9/blur-26347-27038-hd-wallpapers.jpg");
	background-repeat: no-repeat;
	background-position: center; 
	background-size: cover;
	padding: 10px;
}

.form-heading {
	color: #fff;
	font-size: 23px;
}

.panel h2 {
	color: #444444;
	font-size: 18px;
	margin: 0 0 8px 0;
}

.panel p {
	color: #777777;
	font-size: 14px;
	margin-bottom: 30px;
	line-height: 24px;
}

.login-form .form-control {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 14px;
	height: 50px;
	line-height: 50px;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 2px;
	margin: 10px auto 30px;
	max-width: 38%;
	padding: 50px 70px 70px 71px;
}

.login-form .form-group {
	margin-bottom: 10px;
}

.login-form {
	text-align: center;
}

.forgot a {
	color: #777777;
	font-size: 14px;
	text-decoration: underline;
}

.login-form  .btn.btn-primary {
	background: #f0ad4e none repeat scroll 0 0;
	border-color: #f0ad4e;
	color: #ffffff;
	font-size: 14px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0;
}

.forgot {
	text-align: left;
	margin-bottom: 30px;
}

.botto-text {
	color: #ffffff;
	font-size: 14px;
	margin: auto;
}

.login-form .btn.btn-primary.reset {
	background: #ff9900 none repeat scroll 0 0;
}

.back {
	text-align: left;
	margin-top: 10px;
}

.back a {
	color: #444444;
	font-size: 13px;
	text-decoration: none;
}
 .loginLogo{
  height:50px;
  margin-bottom:0px;
  }
</style>
</head>
<body id="LoginForm">
	<div class="container">
		
			
			
		<div class="login-form" style="margin-top: 100px;">
			<div class="main-div">
			<a class="close " style="margin-top:-50px; position:absolute; margin-left:187px;" href="<c:url value='/gallery'></c:url>">&times;</a>
				<div class="panel">
					<h2>Customer's Login</h2>
					<p>Please enter your email and password</p>
				</div>
				<form action="<c:url value = '/j_spring_security_check1'></c:url>"
					method="post" id="Login">

					<div class="form-group">

						<c:if test="${not empty error }">
							<div style="margin-left: 0px; margin-bottom: 10px;">
								<b style="color: red;">${error }</b>
							</div>
						</c:if>
						<input name="j_username1" type="text" class="form-control"
							id="inputEmail" placeholder="Email Address" />

					</div>

					<div class="form-group">

						<input name="j_password1" type="password" class="form-control"
							id="inputPassword" placeholder="Password" />
                       
					</div>

					<button type="submit" class="btn btn-primary">Login</button>
					<a style = "margin-left:-150px;" href = "<c:url value='#/forgotPassword'></c:url>">forgot password?</a>
				</form>
			</div>
			<div style = "margin-top:-60px;"><span>Don't have an Account?</span><a href = "<c:url value='/newCustomerForm'></c:url>"> sign up</a></div>
		</div>
		
	</div>
</body>
</html>