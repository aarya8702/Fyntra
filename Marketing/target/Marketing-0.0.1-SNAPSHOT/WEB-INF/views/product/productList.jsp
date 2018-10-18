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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.material.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.material.min.css" rel="stylesheet">
<title>Product List</title>
<script type="text/javascript">
	$(document).ready(function() {
		var searchCondition = '${searchCondition}'
		$('.table').DataTable({
			columnDefs : [ {
				targets : [ 0, 1, 2 ],
				className : 'mdl-data-table__cell--non-numeric'
			} ]
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
								<h4>Product List</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Product name</th>
											<th>Main Category</th>
											<th>Sub Category</th>
											<th>Price</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<!-- JSTL tag for iterating list of products -->
										<c:forEach items="${lists }" var="p">
											<!-- p is referring to Product -->
											<tr>

												<td><a href = "<c:url value='/retailer/product/info/${p.productId }'></c:url>">${p.productname }</a></td>
												<td>${p.category.maincategory }</td>
												<td>${p.subcategory1.subcategory1 }</td>
												<td>${p.price }</td>
												<td><a	href="<c:url value = '/retailer/product/delete/${p.productId }'></c:url>"><span class="glyphicon glyphicon-trash"></span></a></td>


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