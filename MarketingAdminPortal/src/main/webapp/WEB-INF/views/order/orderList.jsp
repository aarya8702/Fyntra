<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>Orders List</title>

<script type="text/javascript">
$(document).ready(function() {
	$("table").DataTable({
		"lengthMenu": [[5,10,15,20,-1],[5,10,15,20,"All"]],
		"ordering": true,
		stateSave: true
	});
});
</script>
</head>
<body>
	<!-- List of Products , productsAttr is the name of the model attribute -->
	<div class="container">
	<h1>Order List</h1>
	<br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center">Order Id</th>
				<th class="text-center">Order Date</th>
				<th class="text-center">Shipping Date</th>
                <th class="text-center">Order Status</th>
                <th class="text-center">Grand Total</th>
                <th class="text-center">Customer name</th>
                <th class="text-center">Info</th>			
			</tr>
		</thead>
		<tbody>
		<!-- JSTL tag for iterating list of products -->
		<c:forEach items="${list}" var="order"><!-- p is referring to Product -->
			<tr>
			    
			    <td class="text-center">${order.id }</td>
				<td class="text-center">${order.orderDate}</td>
				<td class="text-center">${order.shippingDate }</td>
				<td class="text-center">${order.orderStatus }</td>
				<td class="text-center">${order.orderTotal }</td>
				<td class="text-center">${order.customer.firstname } ${order.customer.lastname }</td>
				<spring:url value="/admin/order/info/${order.id }" var="infoUrl"/>
				<td class="text-center"><a href="${infoUrl}"><span class=" glyphicon glyphicon-info-sign"></span></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	</div>
</body>
</html>