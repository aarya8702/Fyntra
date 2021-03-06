<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<script defer src="https://use.fontawesome.com/releases/v5.4.1/js/all.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/singleproduct.css'></c:url>">
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-default');
}else{
	$('.navbar').removeClass('navbar-default');
}
})</script>
<title>Fashion Store: Product Info</title>
</head>
<body >
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container" style="margin-bottom: 50px; margin-top: 50px;">
	<form action="<c:url value='/cart/addToCart/${product.productId }'></c:url>" method="post">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">

						<div class="preview-pic tab-content">
							<div class="tab-pane active" id="pic-1">
								<img style="height: 280px;" src="<c:url value='/resources/${product.imageUrl1 }'></c:url>"/>
							</div>
							<div class="tab-pane" id="pic-2">
								<img src="${product.imageUrl2 }" />
							</div>
							<div class="tab-pane" id="pic-3">
								<img src="${product.imageUrl3 }" />
							</div>
							<div class="tab-pane" id="pic-4">
								<img src="${product.imageUrl4 }" />
							</div>
							<div class="tab-pane" id="pic-5">
								<img src="${product.imageUrl5 }" />
							</div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
							<li class="active"><a data-target="#pic-1" data-toggle="tab"><img
									src="<c:url value='/resources/${product.imageUrl1 }'></c:url>" /></a></li>
							<li><a data-target="#pic-2" data-toggle="tab"><img
									src="${product.imageUrl2 }" /></a></li>
							<li><a data-target="#pic-3" data-toggle="tab"><img
									src="${product.imageUrl3 }" /></a></li>
							<li><a data-target="#pic-4" data-toggle="tab"><img
									src="${product.imageUrl4 }" /></a></li>
							<li><a data-target="#pic-5" data-toggle="tab"><img
									src="${product.imageUrl5 }" /></a></li>
						</ul>

					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${product.productname }</h3>
					
						<p class="product-description" style="margin-top: 0px; margin-bottom: 0px;">${product.description }</p>
						<h4 class="price">
							current price: <span>Rs. ${product.price }</span>
						</h4>
						
						<h5 class="sizes">By: ${product.retailer.retailername }
						</h5>
						 <c:if test="${error}">
						     <h2><font color="red">Not Enough Stock</font></h2>
						 </c:if>
						 <c:if test="${success}">
						     <h2><font color="green"><span class="glyphicon glyphicon-ok"></span> Added to Cart</font></h2>
						 </c:if>
						
						
						<h5 class="colors" style="margin-bottom: 15px;">
						
						   
							Quantity: <select name="requestedQuantity">
							        <c:forEach items="${qtyList}" var="qty">
							           <option value="${qty}">${qty}</option>
							        </c:forEach>   
							          </select> <font color="green">(Only ${product.quantity} in stock)</font>
						
						</h5>
						<div class="action">
							<button class="add-to-cart btn btn-default" type="submit">add
								to cart</button>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>