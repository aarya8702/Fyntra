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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.material.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.19/css/dataTables.material.min.css"
	rel="stylesheet">
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>tinymce.init({ selector:'textarea' });</script>
<title>Product Update</title>

</head>
<body>
	<!-- List of Products , productsAttr is the name of the model attribute -->
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/navigation.jsp" />
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>Product Update</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<spring:url value="/retailer/product/update" var="saveUrl" />
								<form:form action="${saveUrl }" method="post"
									class="form-horizontal" modelAttribute="product" enctype = "multipart/form-data">
									<form:hidden path="productId" />
									<fieldset>
										<legend class="center-block"> Update Product
											Information </legend>

										<div class="form-group">
											<label class="col-md-2 control-label"><b>product
													name: </b></label>
											<div class="col-md-8">
												<form:input type="text" path="productname"
													class="form-control" placeholder="Enter Productname" />
											</div>
											
										</div>
										
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Category:
											</b></label>
											<div class="col-md-8">
										<form:select path="category.maincategory" class="form-control">
											<c:forEach items="${categories }" var="c">
												<form:option value="${c.maincategory }">${c.maincategory }</form:option>
											</c:forEach>
										</form:select>
											</div>
											
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Sub Category
													 </b></label>
											<div class="col-md-8">
												<form:select path="subcategory1.subcategory1"
											class="form-control">
											<c:forEach items="${sc }" var="sc">
												<form:option value="${sc.subcategory1 }">${sc.subcategory1 }</form:option>
											</c:forEach>
										</form:select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Quantity </b></label>
											<div class="col-md-8">
												<form:input type="text" path="quantity"
													class="form-control"
													placeholder="Enter primary Contact Number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Price </b></label>
											<div class="col-md-8">
												<form:input type="text" path="price" class="form-control"
													placeholder="Enter Alternate Contact number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Description: </b></label>
											<div class="col-md-8">
												<form:textarea path="description" class = "form-control" placeholder="Enter Description"/>
										</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Upload Photo </b></label>
											<div class="col-md-8">
												<form:input type="file" path="file1" class="form-control"
													placeholder="Enter Alternate Contact number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"></label>
											<div class="col-md-8">
												<button type="submit" class="btn btn-success">Update
													Product</button>
												<a class="btn btn-danger"
													href="<c:url value = '/retailer/product/list'></c:url>">Cancel</a>
											</div>
										</div>
									</fieldset>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


