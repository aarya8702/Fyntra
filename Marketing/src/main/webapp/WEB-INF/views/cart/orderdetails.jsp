<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<title>Thank You</title>
<style>
.parallax {
	background-image:
		url("resources/images/Playstation images/PS4-Console.jpg");
	min-height: 600px;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: 100%;
	margin-top: 0px;
	margin-bottom: 0px;
}

.parallax1 {
	background-image: url("");
	min-height: 500px;
	background-attachment: fixed;
	background-color: white;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	margin-bottom: 0px;
}

.parallax2 {
	background-color: #f0f0f0;
	min-height: 1400px;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.parallax3 {
	background-color: white;
	min-height: 800px;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.parallax4 {
	background-image: url("resources/images/Playstation images/cod.jpg");
	background-color: white;
	min-height: 600px;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.parallax5 {
	background-image: url("");
	background-color: white;
	min-height: 2200px;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.navbar1 {
	overflow: hidden;
	background-color: blue;
	font-family: Arial;
}

.navbar1 a {
	float: left;
	font-size: 16px;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.dropdown1 {
	float: left;
	overflow: hidden;
}

.dropdown1 .dropbtn1 {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font: inherit; /* Important for vertical align on mobile phones */
	margin: 0; /* Important for vertical align on mobile phones */
}

.navbar1 a:hover, .dropdown1:hover .dropbtn1 {
	background-color: rgb(0, 118, 201);
}

.dropdown-content1 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	width: 100%;
	left: 0;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content1 .header1 {
	background: rgb(0, 118, 201);
	padding: 16px;
	color: white;
}

.dropdown1:hover .dropdown-content1 {
	display: block;
}

.zoom {
	transform: scale(1.08);
}

.ps4 {
	width: 200px;
	height: 120px;
	margin-top: 20px;
	transition: transform 0.5s;
	margin-left: 130px;
}

.psvr {
	width: 200px;
	height: 120px;
	margin-top: 20px;
	transition: transform 0.5s;
	margin-left: 250px;
}

.xboxone-X {
	width: 210px;
	height: 80px;
	margin-top: 20px;
	transition: transform 0.5s;
	margin-left: 250px;
}

.ps4pro {
	width: 200px;
	height: 120px;
	margin-top: 20px;
	transition: transform 0.5s;
	margin-left: 20px;
}

.buy {
	width: 200px;
	height: 120px;
	margin-top: 20px;
	transition: transform 0.5s;
	margin-left: 20px;
}

.h2 {
	font-family: Arial, sans-serif;
}

.responsive {
	width: 100%;
	height: auto;
}

.responsive1 {
	width: auto;
	height: auto;
	float: left;
}

.responsive2 {
	width: 100%;
	height: auto;
	float: right;
}

h1 {
	font-size: 50px;
	color: rgb(44, 66, 78);
	font-family: ariel, helvetica, sans-serif;
}

h3 {
	font-size: 30px;
	color: rgb(44, 66, 78);
	font-family: helvetica;
}

p {
	color: white;
}

.smoother-gameplay {
	width: 437px;
	height: auto;
	float: right;
	margin-right: -437px;
	border-bottom: 5px solid green;
	padding: 23px;
	margin-top: 300px;
	background-color: black;
}

.bigger-world {
	width: 442px;
	height: auto;
	float: left;
	border-bottom: 5px solid green;
	padding: 23px;
	margin-top: 445px;
	background-color: black;
}

.ps4nav {
	border-bottom: 5px solid green;
}

.footer {
	left: 0;
	bottom: 0;
	width: 100%;
	height: 200px;
	background-color: rgb(60, 60, 60);
	color: white;
	text-align: center;
}

.card-product:after {
	content: "";
	display: table;
	clear: both;
	visibility: hidden;
}

.card-product .price-new, .card-product .price {
	margin-right: 5px;
}

.card-product .price-old {
	color: #999;
}

.card-product .img-wrap {
	border-radius: 3px 3px 0 0;
	overflow: hidden;
	position: relative;
	height: 220px;
	text-align: center;
}

.card-product .img-wrap img {
	max-height: 100%;
	max-width: 100%;
	object-fit: cover;
}

.card-product .info-wrap {
	overflow: hidden;
	padding: 15px;
	border-top: 1px solid black;
}

.card-product .action-wrap {
	padding-top: 4px;
	margin-top: 4px;
}

.card-product .bottom-wrap {
	padding: 15px;
	border-top: 1px solid #eee;
}

.card-product .title {
	margin-top: 0;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container-wrapper">
		<div class="container">


			<div class="container">


				<div class="row">

					<div
						class=" col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
						<div style="width: 650px; background-color: lightgrey;">
							<h1 align="center">Invoice</h1>
						</div>
						ORDER ID: ${customerorder.id }

						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong><button disabled>Shipping Address</button></strong><br />
									${customerorder.userShipping.apartmentnumber },
									${customerorder.userShipping.streetname } <br />
									${customerorder.userShipping.state},
									${customerorder.userShipping.city} <br />
									${customerorder.userShipping.zipcode}
								</address>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 text-right">
								<p style="color: black;">Shipping Date:
									${customerorder.orderDate }</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong><button disabled>Billing Address</button></strong><br />
									${customerorder.userBilling.apartmentnumber},
									${customerorder.userBilling.streetname} <br />
									${customerorder.userBilling.city},
									${customerorder.userBilling.state} <br />
									${customerorder.userBilling.zipcode}
								</address>
							</div>
						</div>

						<div class="row">
							<table class="table table-hover" border="1">
								<thead>
									<tr>
										<td>Image</td>
										<td>Product</td>
										<td>Units</td>
										<td class="text-center">Price</td>
										<td class="text-center">Total</td>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="cartItem" items="${cartItems}">
										<tr>
											<c:url value="/resources/${cartItem.product.imageUrl1 }"
												var="imgUrl"></c:url>
											<td><img src="${imgUrl }" height="50px" width="100px">
											</td>
											<td class="col-md-9"><em>${cartItem.product.productname}</em></td>
											<td class="col-md-1" style="text-align: center">${cartItem.quanity}</td>
											<td class="col-md-1" style="text-align: center">${cartItem.product.price}</td>
											<td class="col-md-1" style="text-align: center">${cartItem.subtotal}</td>

										</tr>
									</c:forEach>

									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td class="text-right">
											<h4>
												<strong>Grand Total:</strong>
											</h4>
										</td>
										<td class="text-center text-danger">
											<h4>
												<strong>Rs. ${customerorder.orderTotal }</strong>
											</h4>
										</td>
									</tr>
								</tbody>
							</table>
							<a class="btn btn-success"
								href="${pageContext.request.contextPath }/gallery">Continue
								Shopping</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>