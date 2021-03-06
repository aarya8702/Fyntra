<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/resources/css/style.css'></c:url>" rel="stylesheet">
<title>Fashion Store: Update Shipping Address</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
		
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h2>Shipping Address Details</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<spring:url value="/cart/reviewYourOrder" var="review"/>
								<form:form action="${review }" method="post"
									class="form-horizontal" modelAttribute="shippingaddress">
									<form:hidden path="id" />
									<fieldset>
										<legend class="center-block">*All your orders will be delivered to this address</legend>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>apartmentnumber: </b></label>
											<div class="col-md-6">
												<form:input type="text" path="apartmentnumber"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>streetnumber: </b></label>
											<div class="col-md-6">
												<form:input type="text" path="streetname"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>city: </b></label>
											<div class="col-md-6">
												<form:input type="text" path="city"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>state: </b></label>
											<div class="col-md-6">
												<form:input type="text" path="state"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>zipcode: </b></label>
											<div class="col-md-6">
												<form:input type="text" path="zipcode"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>country: </b></label>
											<div class="col-md-6">
												<form:input type="text" path="country"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"></label>
											<div class="col-md-6">
												<button type="submit" class="btn btn-success">Delivery to  This Address</button>
												<a class="btn btn-danger"
													href="<c:url value = '/cart/listCart'></c:url>">Cancel</a>
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>