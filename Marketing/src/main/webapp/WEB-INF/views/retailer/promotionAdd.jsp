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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>tinymce.init({ selector:'textarea' });</script>
<title>Add Promotions</title>
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
								<h4>Add Promotions</h4>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<spring:url value="/retailer/promoSave" var="saveUrl" />
								<form:form action="${saveUrl }" method="post"
									class="form-horizontal" modelAttribute="promotionForm" enctype = "multipart/form-data">
									<form:hidden path="pid" />
									<fieldset>
									

										<div class="form-group">
											<label class="col-md-2 control-label"><b>Promotion Code: </b></label>
											<div class="col-md-8">
												<form:input type="text" path="promotioncode"
													class="form-control" placeholder="Enter Productname" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Description: </b></label>
											<div class="col-md-8">
												<form:textarea type="text" path="description"
													class="form-control" placeholder="Enter Description"></form:textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Discount Rate(in %) </b></label>
											<div class="col-md-8">
												<form:input type="text" path="discount" class="form-control"
													placeholder="Enter Alternate Contact number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"></label>
											<div class="col-md-8">
												<button type="submit" class="btn btn-success">Add
													Promotion Code</button>
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