<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Fashion Store: Home</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Quicksand:500" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<link rel="stylesheet" href="<c:url value='/resources/css/search.css'></c:url>">
<script defer src="https://use.fontawesome.com/releases/v5.4.1/js/all.js"></script>
<script type="text/javascript">
	$(window).on('scroll', function() {

		if ($(window).scrollTop()) {
			$('.navbar').addClass('navbar-inverse');
		} else {
			$('.navbar').removeClass('navbar-inverse');
		}
	})
</script>
<style>
.panel-heading {
	text-align: center;
	font: 15px arial, sans-serif;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="<c:url value='/resources/images/carousel1.jpeg'></c:url>"
					alt="Los Angeles" style="width: 100%; height: 450px;">
				<div class="carousel-caption">
					<h3>Chania</h3>
					<p>The atmosphere in Chania has a touch of Florence and Venice.</p>
				</div>
			</div>

			<div class="item">
				<img src="<c:url value='/resources/images/carousel2.jpeg'></c:url>"
					alt="Los Angeles" style="width: 100%; height: 450px;">
				<div class="carousel-caption">
					<h3>Chania</h3>
					<p>The atmosphere in Chania has a touch of Florence and Venice.</p>
				</div>
			</div>

			<div class="item">
				<img src="<c:url value='/resources/images/carousel3.jpeg'></c:url>"
					alt="Los Angeles" style="width: 100%; height: 450px;">
				<div class="carousel-caption">
					<h3>Chania</h3>
					<p>The atmosphere in Chania has a touch of Florence and Venice.</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
   
	<div class="jumbotron"
		style="background-image: url('<c:url value='/resources/images/search.jpg'></c:url>');">
		<div class="row">
			<div class="container">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form id="form-id" action="<c:url value='/search'></c:url> ">
						<div class="search-box">
							<input type="text" name="search" class="search-txt"
								placeholder="Search nearby Promotions" /> <a href="#"
								onclick="document.getElementById('form-id').submit();"
								class="search-btn"> <i class="fas fa-search"></i>
							</a>
						</div>
					</form>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
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
															src="<c:url value='/resources/${p.imageUrl1 }'></c:url>"
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
