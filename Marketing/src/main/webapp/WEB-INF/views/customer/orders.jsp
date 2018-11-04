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
<title>Fashion Store: My Account</title>
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-default');
}else{
	$('.navbar').removeClass('navbar-default');
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
								<h2>Order Details</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">

								<div>

									<ol class="breadcrumb">
										
									</ol>
								</div>
								<div class="row">
									<div class="col-xs-9">

										<table class="table">
											<thead>
												<tr>
													<th>Order ID</th>
													<th>Purchase Date</th>
													<th>Grand Total</th>
													<th>Email</th>
													<th>View Details</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${orders}" var="order">
													<tr>
														<td>${order.id }</td>
														<td>${order.orderDate }</td>
														<td>${order.orderTotal }</td>
														<td>${order.customer.user.email }</td>
														<td><a href = "<c:url value='orderDetails/${order.id}'></c:url>" ><span class = "glyphicon glyphicon-eye-open"></span></a></td>
													</tr>
												</c:forEach>
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
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>