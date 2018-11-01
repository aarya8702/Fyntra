<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<title>Fashion store: Review Your Order</title>
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-inverse');
}else{
	$('.navbar').removeClass('navbar-inverse');
}
})</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-top: 80px;">
		<div class="row">
			<div class="col-md-4">
				<h3>Review Your Order</h3>
			</div>
		</div>
		<div class="row" style="margin-bottom: 0px;">
			<div class="col-md-12">
				<h5>
					*By Pressing Place Your Order Button.Your hereby agrees to the<span><a
						href="#"> terms and condition</a></span> of FASHION STORE
				</h5>
			</div>
		</div>
		<hr>
		<div class="row" style="margin-bottom: 50px;">
			<div class="col-md-8"
				style="border: 1px solid lightgrey; border-radius: 6px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; ">
				<div class="row">
					<div class="col-md-4" style="margin-top: 5px;">
						<h4>
							<b>Shipping Address(<a
								href="<c:url value='/cart/shippingaddress'></c:url>">change</a>)
							</b>
						</h4>
						${customer.firstname } ${customer.lastname }<br>
						${customer.shippingAddress.apartmentnumber }
						${customer.shippingAddress.streetname }<br>
						${customer.shippingAddress.city },
						${customer.shippingAddress.state },
						${customer.shippingAddress.zipcode }<br>
						${customer.shippingAddress.country }<br> <b>PHONE NUMBER:</b>
						${customer.phonenumber }
					</div>
					<div class="col-md-6" style="margin-top: 30px; margin-bottom: 0px;">
								<label class="col-md-4 control-label"></label>
								<div class="col-md-6" style="margin-bottom:0px;">
								    <c:if test="${notExists }">
								     <p><font color="red">PromoCode not Exists</font></p>
								    </c:if>
								     <c:if test="${alreadyApplied }">
								     <p><font color="red">Already Applied</font></p>
								    </c:if>
								     <c:if test="${success }">
								     <p><font color="green">successfully applied</font></p>
								    </c:if>
								</div>
					</div>
					<div class="col-md-6" style="margin-top:0px;">
						<form action="<c:url value='/cart/applyCode'></c:url>" method="post">
							<div class="form-group">
								<label class="col-md-4 control-label">Promotional Codes</label>
								<div class="col-md-6">
									<input type="text" name="promoCode" class="form-control"
										required="required" placeholder="Enter Code">
								</div>
								<div class="col-md-2">
									<button type="submit" class="btn btn-primary">Apply</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row" style="margin-top: 15px;">
				 <div class="col-md-8">
				  <h4>Products you want to order are listed below:-</h4>
				  <hr style="margin-top:0px;">
				 </div>
				</div> 
				<div class="row">
					<div class="col-md-12">
					<div class="table-responsive">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th>Icon</th>
									<th>Productname</th>
									<th>Quantity</th>
									<th>Price/Quantity</th>
									<th>Subtotal</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cartItems }" var="c">
									<tr>
										<td><img style="height: 50px;" class="img img-responsive"
											src="<c:url value='/resources/${c.product.imageUrl1 }'></c:url>" /></td>
										<td>${c.product.productname }</td>
										<td>${c.quanity }</td>
										<td>${c.product.price}</td>
										<td>${c.subtotal}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4"
				style="border: 1px solid lightgrey; border-radius: 6px; border-top-left-radius: 0px; border-bottom-left-radius: 0px; height: 278px;">
				<div class="row">
					<div class="col-md-6" style="margin-top: 5px;">
						<h4>
							<b>Order Summary</b>
						</h4>
					</div>
				</div>
				<c:forEach items="${cartItems }" var="c">
                  <c:set var="total" value="${total + (c.product.price*c.quanity) }"></c:set>
				</c:forEach>
				<div class="row">
					<div class="col-md-2">Items:</div>
					
					<div class="col-md-6"></div>
					<div class="col-md-4">Rs. ${total}</div>
				</div>
				<div class="row">
					<div class="col-md-2">Discount: </div>
					<div class="col-md-6"></div>
				    <div class="col-md-4">  -Rs.${total - shoppingCart.grandTotal}</div>
				</div>
				<div class="row">
					<div class="col-md-2">Delivery:</div>
					<div class="col-md-6"></div>
					<div class="col-md-4">Free</div>
				</div>
				<div class="row">
					<div class="col-md-2">Total:</div>
					<div class="col-md-6"></div>
					<div class="col-md-4">Rs. ${shoppingCart.grandTotal}</div>
				</div>
				<hr style="margin-bottom: 0px;">
				<div class="row">
					<div class="col-md-6">
						<h3>
							<font color="Tomato"><b>Order Total: </b></font>
						</h3>
					</div>
					<div class="col-md-6">
						<h3>
							<font color="Tomato">Rs. ${shoppingCart.grandTotal}</font>
						</h3>
					</div>
				</div>
				<hr style="margin-top: 0px;">
				<div class="row">
					<div class="col-md-12">
						<a href="<c:url value='/cart/createorder'></c:url>"  class="btn btn-success col-md-12">Place your order</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>