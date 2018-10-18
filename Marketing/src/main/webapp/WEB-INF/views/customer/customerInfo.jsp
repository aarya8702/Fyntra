<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Fashion Store: My Account</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/customernavigation.jsp" />
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
								<c:forEach items="${list}" var="customer">
									<div>

										<ol class="breadcrumb">
											<li><a
												href="<c:url value='/admin/retailer/list'></c:url>"><i
													class="fa fa-long-arrow-left" aria-hidden="true"></i>Go
													back</a></li>
											<li><a
												href="<c:url value='/customer/updateCustomer'></c:url>">Edit</a></li>
										</ol>
									</div>
									<div class="row">
										<div class="col-xs-9">


											<h3>${customer.firstname} ${customer.lastname }</h3>
											<div class="row">
												<div class="col-xs-6">
													<p>
														<strong>Email Address: </strong><span>${customer.user.email}</span>
													</p>
													<p>
														<strong>Password: </strong><span>${customer.user.password}</span>
													</p>
													<p>
														<strong>Phonenumber: </strong><span>${customer.phonenumber}</span>
													</p>
													<p>
														<strong>Email Status: </strong><span>${customer.user.isEmailVerified}</span>
													</p>
												
												</div>
												<div class="col-xs-6">
													<h3 style="margin-top: -30px;">Shipping Address</h3><a href="<c:url value='/customer/shippingForm'></c:url> ">(change)</a>
													<p>
														<strong>Apartmentnumber: </strong><span>${customer.shippingAddress.apartmentnumber}</span>
													</p>
													<p>
														<strong>Street: </strong><span>${customer.shippingAddress.streetname}</span>
													</p>
													<p>
														<strong>City: </strong><span>${customer.shippingAddress.city}</span>
													</p>
													<p>
														<strong>State: </strong><span>${customer.shippingAddress.state}</span>
													</p>
													<p>
														<strong>Zipcode: </strong><span>${customer.shippingAddress.zipcode}</span>
													</p>
													<p>
														<strong>Country: </strong><span>${customer.shippingAddress.country}</span>
													</p>
												</div>
												<div class="col-xs-4">
													<h3 style="margin-top: -30px;">Billing Address</h3><a href="<c:url value='/customer/billingForm'></c:url> ">(change)</a>
													<p>
														<strong>Apartmentnumber: </strong><span>${customer.billingAddress.apartmentnumber}</span>
													</p>
													<p>
														<strong>Street: </strong><span>${customer.billingAddress.streetname}</span>
													</p>
													<p>
														<strong>City: </strong><span>${customer.billingAddress.city}</span>
													</p>
													<p>
														<strong>State: </strong><span>${customer.billingAddress.state}</span>
													</p>
													<p>
														<strong>Zipcode: </strong><span>${customer.billingAddress.zipcode}</span>
													</p>
													<p>
														<strong>Country: </strong><span>${customer.billingAddress.country}</span>
													</p>
												</div>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>