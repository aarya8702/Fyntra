<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/resources/css/style.css'></c:url>" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row" style="margin-bottom: -100px;">
			<div class="col-xs-8">
				<h2 class="section-headline">
					<span>User Account</span>
				</h2>
			</div>
			<div class="col-xs-4">
				<img src="/image/logo.png" class="img-responsive" />
			</div>
		</div>
		<hr
			style="position: absolute; width: 100%; height: 6px; background-color: #333; z-index: -1; margin-top: -80px;" />
		<img class="img-responsive" src="/image/wood.png"
			style="margin-top: -75px;" />

		<div class="row" style="margin-top:10px">
			<div class="col-xs-9 col-xs-offset-3">
				<h5>Bad request. The request path is invalid. Click <a th:href="@{/}">here</a> to return to the home page.</h5>
			</div>
		</div>
	</div>
</body>
</html>