<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.material.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.material.min.css" rel="stylesheet">
<title>Retailers List</title>
<script type="text/javascript">
$(document).ready(function(){
	var searchCondition='${searchCondition}'
	$('.table').DataTable({
		 columnDefs: [
	            {
	                targets: [ 0, 1, 2 ],
	                className: 'mdl-data-table__cell--non-numeric'
	            }
	        ]
	})
})

</script>
</head>
<body>
	<!-- List of Products , productsAttr is the name of the model attribute -->
	<div class="container-fluid">
		<div class="row">
		<jsp:include page="/WEB-INF/views/common/navigation.jsp"/>
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>Promotions List</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Promotion Code</th>
											<th>Description</th>
											<th>Discount Rate</th>
											<th>Apply</th>
											<th>Cancel</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<!-- JSTL tag for iterating list of products -->
										<c:forEach items="${list }" var="p">
											<!-- p is referring to Product -->
											<tr>

												<td>${p.promotioncode }</td>
												<td>${p.description }</td>
												<td>${p.discount } %</td>
											    <spring:url value="/retailer/apply/${p.pid }" var = "apply"/>
											    <td><a href="${apply }" class = "btn btn-success">Apply This Code</a></td>
											    <spring:url value="/retailer/cancelPromoCode/${p.pid }" var = "cancel"/>
											    <td><a href="${cancel }" class = "btn btn-danger">Reset Prices</a></td>
											    <spring:url value="/retailer/deleteCode/${p.pid }" var = "delete"/>
											    <td><a href="${delete }" class = "btn btn-delete"><span class = "glyphicon glyphicon-trash"></span></a></td>
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
</body>
</html>