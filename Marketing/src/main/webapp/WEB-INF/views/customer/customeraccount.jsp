<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<title>My Account</title>
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
<div class="container-fluid">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/navigation.jsp"/>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>Your Profile</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                 <div class="col-md-12">
		                    <div class = "jumbotron" style="padding: 50px 50px 50px 50px;">
		                     <h2>Welcome, ${customer.firstname }</h2>
		                    </div>
		                </div>
		            </div> 
		        </div>
		    </div>
		</div>
	</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>