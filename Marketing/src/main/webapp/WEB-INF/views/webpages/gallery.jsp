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
<link rel="stylesheet" href="<c:url value = '/resources/css/gallery.css'></c:url>">
<link rel="stylesheet" href="<c:url value = '/resources/css/style.css'></c:url>">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="container">
 <c:forEach items = "${list }" var = "product">
<div class="col-xs-12 col-md-6 bootstrap snippets">
	<!-- product -->
	<div class="product-content product-wrap clearfix">
		<div class="row">
		
				<div class="col-md-5 col-sm-12 col-xs-12">
					<div class="product-image"> 
						<img style="height: 250px; width: 100%;" src="${pageContext.request.contextPath }/resources/${product.imageUrl1}" alt="194x228" class="img-responsive"> 
					
					</div>
				</div>
				<div class="col-md-7 col-sm-12 col-xs-12">
				<div class="product-deatil">
						<h5 class="name">
							<a href="#">
								<b>${product.productname }</b> <span>Category: <b>${product.category.maincategory }</b></span>
							</a>
						</h5>
						<p class="price-container">
							<span>Rs. ${product.price }</span>
						</p>
						<span class="tag1"></span> 
				</div>
				<div class="description">
					<p><b>By:</b>${product.retailer.retailername }</p>
					
					<label>Brand: Brand</label>
					<br>
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>