<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<title>Fashion Store: Update Shipping Address</title>
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
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
		
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<h2>Shipping Address Details</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8">
							
									<fieldset>
										<legend class="center-block">*All your orders will be delivered to this address</legend>
									</fieldset>
							</div>
						</div>
						<div class="row">
						 <div class="col-md-8">
						 <h4> ${shippingaddress.apartmentnumber }</h4>
						 <h4> ${shippingaddress.streetname }</h4>
						 <h4> ${shippingaddress.city }</h4>
						 <h4> ${shippingaddress.state }</h4>
						 <h4> ${shippingaddress.zipcode }</h4>
						 <h4> ${shippingaddress.country }</h4>
						 <hr>
						 </div>
						</div>
						<div class="row">
						 <div class="col-md-4">
						  <a class="btn btn-danger" href="<c:url value='/cart/editShippingAddress'></c:url>">Edit</a>
						  <a class="btn btn-success" href="<c:url value='/cart/reviewYourOrder'></c:url>">Review Your Order</a>
						 </div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>