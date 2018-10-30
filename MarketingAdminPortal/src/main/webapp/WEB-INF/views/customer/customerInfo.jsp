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
<title>Retailer Information</title>
</head>
<body>
	<div class="container">

		<div>

			<ol class="breadcrumb">
				<li><a href="<c:url value='/admin/customer/list'></c:url>"><i
						class="fa fa-long-arrow-left" aria-hidden="true"></i>Go back</a></li>
				<li><a
					href="<c:url value='/admin/customer/update/${list.custId}'></c:url>">Edit</a></li>
			</ol>
		</div>
		<div class="row">
			<div class="col-xs-9">


				<h3>${list.firstname}${list.lastname }</h3>
				<div class="row">
					<div class="col-xs-6">
						<p>
							<strong>Email Address: </strong><span>${list.user.email}</span>
						</p>
						<p>
							<strong>Password: </strong><span>${list.user.password}</span>
						</p>
						<p>
							<strong>Phonenumber: </strong><span>${list.phonenumber}</span>
						</p>
						<p>
							<strong>Email Status: </strong><span>${list.user.isEmailVerified}</span>
						</p>

					</div>
					<div class="col-xs-6">
						<h3 style="margin-top: -30px;">Shipping Address</h3>
						<p>
							<strong>Apartmentnumber: </strong><span>${list.shippingAddress.apartmentnumber}</span>
						</p>
						<p>
							<strong>Street: </strong><span>${list.shippingAddress.streetname}</span>
						</p>
						<p>
							<strong>City: </strong><span>${list.shippingAddress.city}</span>
						</p>
						<p>
							<strong>State: </strong><span>${list.shippingAddress.state}</span>
						</p>
						<p>
							<strong>Zipcode: </strong><span>${list.shippingAddress.zipcode}</span>
						</p>
						<p>
							<strong>Country: </strong><span>${list.shippingAddress.country}</span>
						</p>
					</div>
					<div class="col-xs-4">
						<h3 style="margin-top: -30px;">Billing Address</h3>
						<p>
							<strong>Apartmentnumber: </strong><span>${list.billingAddress.apartmentnumber}</span>
						</p>
						<p>
							<strong>Street: </strong><span>${list.billingAddress.streetname}</span>
						</p>
						<p>
							<strong>City: </strong><span>${list.billingAddress.city}</span>
						</p>
						<p>
							<strong>State: </strong><span>${list.billingAddress.state}</span>
						</p>
						<p>
							<strong>Zipcode: </strong><span>${list.billingAddress.zipcode}</span>
						</p>
						<p>
							<strong>Country: </strong><span>${list.billingAddress.country}</span>
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>