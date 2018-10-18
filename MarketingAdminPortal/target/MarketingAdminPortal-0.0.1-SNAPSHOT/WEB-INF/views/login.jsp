<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Admin Login</title>
<link href="<c:url value ='/resources/css/bootstrap.min.css'></c:url>" rel="stylesheet"/>
<link href="<c:url value='/resources/css/style.css'></c:url>" rel="stylesheet"/>
<link href="<c:url value = '/resources/css/jquery.dataTables.min.css'></c:url>" rel="stylesheet"/>
<link href="<c:url value = '/resources/css/dataTables.bootstrap.min.css'></c:url>" rel="stylesheet"/>
<link href="<c:url value = '/resources/css/font-awesome.min.css'></c:url>" rel="stylesheet"/>
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<head/>

<body>
	<div class="container">
		<h5 class="center-block">Welcome to Admin Portal for Fashion Store</h5>
		<hr />
		<div class="row">
			<div class="col-xs-4 col-md-offset-4">
				<form class="form-signin" action="<c:url value = '/j_spring_security_check'></c:url>" method="post">
					<h2 class="form-signin-heading">Please sign in</h2>
					<div class="form-group">
						<label for="username" class="sr-only">Username</label>
						 <input	type="text" class="form-control" placeholder="Username"
							name="j_username" id="username" required="required"
							autofocus="autofocus" />
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">Password</label> <input
							type="password" class="form-control" placeholder="Password"
							name="j_password" id="password" required="required" />
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
						In</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
