<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<title>Orders Info</title>
</head>
<body>
	<!-- List of Products , productsAttr is the name of the model attribute -->
	<div class="container">
		<h1>Order Details for Order #${order.id }</h1>
		<br>
		<hr>
		<h2 class="text-center">Customer Details</h2>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<b>Customer's Name:</b> ${order.customer.firstname }
				${order.customer.lastname }
			</div>
			<div class="col-md-4">
				<b>Email Address:</b> ${order.customer.user.email}
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-4">
				<b>Phonenumber:</b> ${order.customer.phonenumber}
			</div>
		</div>
		<br>
		<hr>
		<h2 class="text-center">Order Summary</h2>
		<hr>
		<h3>
			<b>Shipping Details </b>
		</h3>
		<hr>
		<h4>${order.userShipping.apartmentnumber }</h4>
		<h4>${order.userShipping.streetname }</h4>
		<h4>${order.userShipping.city }</h4>
		<h4>${order.userShipping.state }</h4>
		<h4>${order.userShipping.zipcode }</h4>
		<h4>${order.userShipping.country }</h4>
		<hr>
		<h3>
			<b>Billing Details </b>
		</h3>
		<hr>
		<h4>${order.userBilling.apartmentnumber }</h4>
		<h4>${order.userBilling.streetname }</h4>
		<h4>${order.userBilling.city }</h4>
		<h4>${order.userBilling.state }</h4>
		<h4>${order.userBilling.zipcode }</h4>
		<h4>${order.userBilling.country }</h4>
		<hr>

		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-condensed">
					<thead>
						<tr>
							<td><strong>Item Name</strong></td>
							<td class="text-center"><strong>Item Price</strong></td>
							<td class="text-center"><strong>Item Quantity</strong></td>
							<td class="text-left"><strong>Total</strong></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartItem }" var="c">
							<tr>
								<td>${c.product.productname}</td>
								<td class="text-center">Rs. ${c.product.price}</td>
								<td class="text-center">${c.quanity}</td>
								<td class="text-left">Rs. ${c.subtotal}</td>
							</tr>
						</c:forEach>
						<tr>
							<td class="highrow"></td>
							<td class="highrow"></td>
							<td class="highrow text-center"><strong>Subtotal</strong></td>
							<td class="highrow text-right">Rs. ${order.orderTotal}</td>
						</tr>
						<tr>
							<td class="emptyrow"></td>
							<td class="emptyrow"></td>
							<td class="emptyrow text-center"><strong>Tax</strong></td>
							<td class="emptyrow text-right">Rs. <fmt:formatNumber
									type="number" maxIntegerDigits="5"
									value="${order.orderTotal*0.06}" /></td>
						</tr>
						<tr>
							<td class="emptyrow"><i class="fa fa-barcode iconbig"></i></td>
							<td class="emptyrow"></td>
							<td class="emptyrow text-center"><strong>Total</strong></td>
							<td class="emptyrow text-right">Rs. <fmt:formatNumber
									type="number" maxIntegerDigits="7"
									value="${order.orderTotal+order.orderTotal*0.06}" /></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>