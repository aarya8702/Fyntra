<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Fashion Store: My Account</title>
</head>
<body>
	<div class="container-fluid">
		
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/customernavigation.jsp" />
			<div class="col-md-9">
				<div class="panel-group">
					<div class="panel panel-default" style="border: none;">
						<div class="panel-body"
							style="background-color: #ededed; margin-top: 20px;">


										<div class="text-center">
											<h2>
												Order Detail for Purchase #<span >${order.id}</span>
											</h2>
										</div>
										<hr />

										<div class="row">
											<div class="col-xs-4">
												<div class="panel panel-default height">
													<div class="panel-heading">
														<strong>Billing Details</strong>
													</div>
													<div class="panel-body">
														<span >${order.customer.firstname} ${order.customer.lastname}</span><br />
														<span>${order.customer.billingAddress.apartmentnumber}</span><br />
														<span>${order.customer.billingAddress.streetname}</span><br />
														<span>${order.customer.billingAddress.city}</span><br />
														<span>${order.customer.billingAddress.state}</span><br />
														<span>${order.customer.billingAddress.zipcode}</span><br />
														<span>${order.customer.billingAddress.country}</span><br />
													</div>
												</div>
											</div>
											
											<div class="col-xs-4">
												<div class="panel panel-default height">
													<div class="panel-heading">
														<strong>SHipping Details</strong>
													</div>
													<div class="panel-body">
														
														<span >${order.customer.firstname} ${order.customer.lastname}</span><br />
														<span>${order.customer.shippingAddress.apartmentnumber}</span><br />
														<span>${order.customer.shippingAddress.streetname}</span><br />
														<span>${order.customer.shippingAddress.city}</span><br />
														<span>${order.customer.shippingAddress.state}</span><br />
														<span>${order.customer.shippingAddress.zipcode}</span><br />
														<span>${order.customer.shippingAddress.country}</span><br />
													</div>
												</div>
											</div>

								<div class="row">
									<div class="col-md-12">
										<div class="panel-heading">
											<h3 class="text-center">
												<strong>Order Summary</strong>
											</h3>
										</div>
										<div class="panel-body">
											<div class="table-responsive">
												<table class="table table-condensed">
													<thead>
														<tr>
															<td><strong>Item Name</strong></td>
															<td class="text-center"><strong>Item Price</strong></td>
															<td class="text-center"><strong>Item
																	Quantity</strong></td>
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
															<td class="highrow text-right"> Rs. ${order.orderTotal}</td>
														</tr>
														<tr>
															<td class="emptyrow"></td>
															<td class="emptyrow"></td>
															<td class="emptyrow text-center"><strong>Tax</strong></td>
															<td class="emptyrow text-right">Rs. <fmt:formatNumber type = "number" 
                                                                 maxIntegerDigits = "5" value = "${order.orderTotal*0.06}" /></td>
														</tr>
														<tr>
															<td class="emptyrow"><i
																class="fa fa-barcode iconbig"></i></td>
															<td class="emptyrow"></td>
															<td class="emptyrow text-center"><strong>Total</strong></td>
															<td class="emptyrow text-right">Rs. <fmt:formatNumber type = "number" 
                                                                 maxIntegerDigits = "7" value = "${order.orderTotal+order.orderTotal*0.06}" /></td>
														</tr>
														
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>