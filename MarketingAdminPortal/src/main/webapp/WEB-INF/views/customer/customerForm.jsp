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
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="resourcesimages/mbr-122x122.jpg"
	type="image/x-icon">
<meta name="description" content="Product Update">
<title>Customer Registration</title>

</head>
<body bgcolor="grey">
	<div class="container">
		<div class = "row">
		<spring:url value="/admin/customer/save" var="saveUrl" />
		<form:form action="${saveUrl }" method="post" class = "form-horizontal" modelAttribute="customerForm">
			<form:hidden path="custId" />
			<fieldset>
					<legend class="center-block">
						New Customer Information<span style="font-size: small"> * is a
							required field</span>
					</legend>
			
			<div class="form-group">
				<label class = "col-md-2 control-label"><b>Firstname </b></label>
				 <div class="col-md-8">
				<form:input type="text" path="firstname" class="form-control"
					placeholder="Enter firstname" />
					</div>
			</div>
			<div class="form-group">
				<label class = "col-md-2 control-label"><b>Lastname </b></label>
				 <div class="col-md-8">
				<form:input type="text" path="lastname" class="form-control"
					placeholder="Enter lastname" />
					</div>
			</div>
			<div class="form-group">
				<label class = "col-md-2 control-label"><b>Email Id: </b></label>
				<div class = "col-md-8">
				<form:input type="text" path="user.email" class="form-control"
					placeholder="Enter email address" />
					 <c:if test="${not empty error }"><div><b style = "color:red;">${error }</b></div></c:if>
			    </div>
			</div>
			<div class="form-group">
				<label class = "col-md-2 control-label"><b>Password: </b></label>
				<div class = "col-md-8">
				<form:input type="password" path="user.password" class="form-control"
					placeholder="Enter Password" />
				</div>
			</div>
			<div class="form-group">
				<label class = "col-md-2 control-label"><b>Phonenumber: </b></label>
                <div class = "col-md-8">
				<form:input type="text" path="phonenumber" class="form-control"
					placeholder="Enter Phonenumber" />
				</div>
			</div>
			<hr>
										<h3>Shipping address</h3>
										<hr>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>apartmentnumber </b></label>
											<div class="col-md-8">
												<form:input type="text" path="shippingAddress.apartmentnumber"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>streetnumber </b></label>
											<div class="col-md-8">
												<form:input type="text" path="shippingAddress.streetname"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>city </b></label>
											<div class="col-md-8">
												<form:input type="text" path="shippingAddress.city"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>state </b></label>
											<div class="col-md-8">
												<form:input type="text" path="shippingAddress.state"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>zipcode </b></label>
											<div class="col-md-8">
												<form:input type="text" path="shippingAddress.zipcode"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>country </b></label>
											<div class="col-md-8">
												<form:input type="text" path="shippingAddress.country"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
											<hr>
										<h3>BillingAddress address</h3>
										<hr>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>apartmentnumber </b></label>
											<div class="col-md-8">
												<form:input type="text" path="billingAddress.apartmentnumber"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>streetnumber </b></label>
											<div class="col-md-8">
												<form:input type="text" path="billingAddress.streetname"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>city </b></label>
											<div class="col-md-8">
												<form:input type="text" path="billingAddress.city"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>state </b></label>
											<div class="col-md-8">
												<form:input type="text" path="billingAddress.state"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>zipcode </b></label>
											<div class="col-md-8">
												<form:input type="text" path="billingAddress.zipcode"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>country </b></label>
											<div class="col-md-8">
												<form:input type="text" path="billingAddress.country"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
			<div class = "form-group">
			<label class = "col-md-2 control-label"></label>
			<div class = "col-md-8">
			 <button type= "submit" class = "btn btn-success">Add Customer</button>
			</div>
			</div>
					</fieldset>
		</form:form>
		</div>
	</div>
</body>
</html>