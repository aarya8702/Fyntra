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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<title>Product Info</title>
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
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/navigation.jsp" />
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h2>Product Details</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<c:forEach items="${list}" var="p">
									<div>

										<ol class="breadcrumb">
											<li><a
												href="<c:url value='/retailer/product/list'></c:url>"><i
													class="fa fa-long-arrow-left" aria-hidden="true"></i>Go
													back</a></li>
											<li><a
												href="<c:url value='/retailer/product/${p.productId }'></c:url>">Edit</a></li>
										</ol>
									</div>
									<div class="row">
										<div class="col-xs-9">


											<h3>${p.productname}</h3>
											<div class="row">
												<div class="col-xs-6">
													<p>
														<strong>Description: </strong><span>${p.description}</span>
													</p>
													<p>
														<strong>Category: </strong><span>${p.category.maincategory}</span>
													</p>
													<p>
														<strong>Sub Category: </strong><span>${p.subcategory1.subcategory1}</span>
													</p>
													<p>
														<strong>Quantity: </strong><span>${p.quantity}</span>
													</p>
													<p>
														<strong>Price: </strong><span>${p.price}</span>
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