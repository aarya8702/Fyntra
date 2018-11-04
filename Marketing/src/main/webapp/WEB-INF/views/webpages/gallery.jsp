<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fashion Store: Browse Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/gallery.css'></c:url>">
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-default');
}else{
	$('.navbar').removeClass('navbar-default');
}
})</script>
</head>
<body bgcolor="white">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container" style="margin-top: 80px;">
<c:if test="${name }">
<div class="row">
 <div class="col-md-12"><h2>Products By: ${retailers.retailername }</h2></div>
</div>
<hr>
</c:if>
<c:if test="${empty(list) }">
 <h1>No Record found!</h1>
</c:if>
 <c:forEach items = "${list }" var = "product">
<div class="col-xs-12 col-md-6 bootstrap snippets">
	<!-- product -->
	<div class="product-content product-wrap clearfix">
		<div class="row">
		
				<div class="col-md-5 col-sm-12 col-xs-12">
					<div class="product-image"> 
						<img style="height: 250px; width: 100%;" src="<c:url value='/resources/${product.imageUrl1}'></c:url>" alt="194x228" class="img-responsive"> 
					
					</div>
				</div>
				<div class="col-md-7 col-sm-12 col-xs-12">
				<div class="product-deatil">
						<h5 class="name">
							<a href="#">
								<b>${product.productname }</b> <span>Category: <b>${product.category.maincategory }</b></span>
							</a>
						</h5>
						<c:if test="${product.temprice == 0 }">
						<p class="price-container">
							<span>Rs. ${product.price }</span>
						</p>
						</c:if>
						<c:if test="${product.temprice != 0 }">
						<p class="price-container">
							<span>Rs. ${product.price }</span> <span><font size="2" color="black">(You save: Rs.${product.temprice - product.price})</font></span>
						</p>
						<p class="price-container">
							<span style="text-decoration: line-through; color: tomato;"><font size="4">Rs. ${product.temprice }</font></span>
						</p>
						</c:if>
						<span class="tag1"></span> 
				</div>
				<div class="description">
					<p><b>By:</b>${product.retailer.retailername }</p>
					
					<label>Quantity Left: <font color = "red">${product.quantity }</font></label>
				</div>
				<div class="product-info smart-form">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-6"> 
							<a href="${pageContext.request.contextPath }/viewSingleProduct/${product.productId}" class="btn btn-success">Add to cart <span class = "glyphicon glyphicon-shopping-cart"></span></a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- end product -->

</div>
</c:forEach>
</div>
<div class="container">

			<c:forEach items="${retailer }" var="retailer">
		<hr style="margin-bottom: 0px;">
			<div class="row">
				<div class="col-md-8" style="">
					<h2>${retailer.retailername }</h2>
					<h5>
						<b>Store Location:</b> ${retailer.street1 },${retailer.route1 },${retailer.city1 },${retailer.state1 },${retailer.country1 }
					</h5>
				</div>
			</div>
			<hr style="margin-top: 0px;">
			<div class="row">
			<c:if test="${empty(promo) }">
			 <h1>No Record Found!</h1>
			</c:if>
				<c:forEach items="${promo }" var="promo">
					<c:if test="${promo.retailer.retailername == retailer.retailername}">
						<div class="col-sm-4" style="padding-left: 65px;">
							<div class="panel panel-primary" style="width: 250px;">
								<div class="panel-heading" style="height: 100px;">${promo.description }</div>
								<div class="panel-heading" style="background-color: white;">
									<b><font color="black">Products by
											${retailer.retailername }</font></b>
								</div>
								<div class="panel-body" style="height: 150px; padding: 0px;">

									<div id="${promo.promotioncode}" class="carousel slide"
										data-ride="carousel">
										<!-- Indicators -->

									

										<!-- Wrapper for slides -->
										<div class="carousel-inner">
											<div class="item active">
												<img
													src="<c:url value='/resources/images/carousel1.jpeg'></c:url>"
													alt="Los Angeles" style="width: 360px; height: 150px;">
												
											</div>
											<c:forEach items="${product }" var="p">
												<c:if test="${p.retailer.retId == retailer.retId && p.category.maincategory == promo.category.maincategory}">
													<div class="item ">
														<img
															src=${p.imageUrl1 }"
															alt="Los Angeles" style="width: 360px; height: 150px;">
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>

								</div>
								<div class="panel-footer text-center">
									<b>Promotion Code:</b> ${promo.promotioncode}
								</div>
								<div class="panel-footer text-center">
									<b>Discount:</b> ${promo.discount }%
								</div>
								<div class="panel-footer text-center">
									<b>Category:</b> ${promo.category.maincategory }
								</div>
								<div class="panel-footer text-center">
									<a class="btn btn-danger"
										href="<c:url value='/product-by-${promo.category.maincategory}-and-${retailer.retId}'></c:url>">browse
										more</a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>