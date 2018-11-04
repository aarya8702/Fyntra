<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<title>Fashion Store</title>
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-default');
}else{
	$('.navbar').removeClass('navbar-default');
}
})</script>
<style>
#locationField, #controls {
	position: relative;
	width: 480px;
}

.label {
	text-align: right;
	font-weight: bold;
	width: 100px;
	color: #303030;
}

#autocomplete {
	position: relative;
	top: 0px;
	left: 0px;
	width: 99%;
}

#address {
	border: 1px solid #000090;
	background-color: #f0f0ff;
	width: 480px;
	padding-right: 2px;
}

#address td {
	font-size: 10pt;
}

.field {
	width: 99%;
}

.slimField {
	width: 80px;
}

.wideField {
	width: 200px;
}

#locationField {
	height: 20px;
	margin-bottom: 2px;
}
</style>
</head>
<body bgcolor="grey">
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/navigation.jsp" />
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h2>Customer Info</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<spring:url value="/customer/updateShipping" var="saveUrl" />
								<form:form action="${saveUrl }" method="post"
									class="form-horizontal" modelAttribute="shippingaddress">
									<form:hidden path="id" />
									<fieldset>
										<legend class="center-block"> Update Shipping
											Information </legend>

										<div class="form-group">
											<label class="col-md-2 control-label"><b>apartmentnumber
											</b></label>
											<div class="col-md-8">
												<form:input type="text"
													path="apartmentnumber" class="form-control"
													placeholder="Enter apartmentnumber" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>streetnumber
											</b></label>
											<div class="col-md-8">
												<form:input type="text" path="streetname"
													class="form-control" placeholder="Enter streetnumber" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>city </b></label>
											<div class="col-md-8">
												<form:input type="text" path="city"
													class="form-control" placeholder="Enter city" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>state </b></label>
											<div class="col-md-8">
												<form:input type="text" path="state"
													class="form-control" placeholder="Enter state" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>zipcode
											</b></label>
											<div class="col-md-8">
												<form:input type="text" path="zipcode"
													class="form-control" placeholder="Enter zipcode" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>country
											</b></label>
											<div class="col-md-8">
												<form:input type="text" path="country"
													class="form-control" placeholder="Enter country" />
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-2 control-label"></label>
											<div class="col-md-8">
												<button type="submit" class="btn btn-success">Update
													Shipping Address</button>
												<a class="btn btn-danger"
													href="<c:url value = '/customer/myAccount'></c:url>">Cancel</a>
											</div>
										</div>
									</fieldset>
								</form:form>
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