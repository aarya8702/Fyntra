<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Fashion Store: My Account</title>
<script>
	$(document).ready(function(){
			
		$("#txtConfirmPassword").keyup(checkPasswordMatch);
		$("#txtNewPassword").keyup(checkPasswordMatch);
	});
	function checkPasswordMatch() {
		var password = $("#txtNewPassword").val();
		var confirmPassword = $("#txtConfirmPassword").val();
		
		if(password == "" && confirmPassword =="") {
			$("#checkPasswordMatch").html("");
			$("#registerRetailer").prop('disabled', false);
		} else {
			if(password != confirmPassword) {
				$("#checkPasswordMatch").html("Passwords do not match!");
				$("#registerRetailer").prop('disabled', true);
			} else {
				$("#checkPasswordMatch").html("Passwords match");
				$("#registerRetailer").prop('disabled', false);
			}
		}
	}
	</script>
</head>
<body bgcolor="grey">
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/customernavigation.jsp" />
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h2>Change Password</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								
								<form action="<c:url value='/customer/change'></c:url>" method="post" class="form-horizontal">
									
									<fieldset>
									<c:if test="${Incorrect}">
										<div class="alert alert-danger" >Incorrect Password</div>
                                    </c:if>
                                    <c:if test="${success}">
										<div class="alert alert-success" >Password Changed Succesfully</div>
                                    </c:if>
									
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Current Password: </b></label>
											<div class="col-md-4">
												<input type="password" name="currentPass" required = "required"
													class="form-control" placeholder="Current password" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>New Password:</b></label>
											<span id="checkPasswordMatch" style="color: red;"></span> 
											<div class="col-md-4">
												<input id = "txtNewPassword" type="password" name="newPass"
													class="form-control" placeholder="New Password"
												/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Confirm Password:
											</b></label>
											<div class="col-md-4">
												<input id="txtConfirmPassword" type="password"
													 class="form-control" placeholder="Confirm Password"  />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"></label>
											<div class="col-md-8">
												<button id = "registerRetailer" type="submit" class="btn btn-success">Change Password</button>
												<a class="btn btn-danger"
													href="<c:url value = '/admin/retailer/list'></c:url>">Cancel</a>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>