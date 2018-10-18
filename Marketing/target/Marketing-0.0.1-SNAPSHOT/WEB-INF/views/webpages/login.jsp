<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Fashion Store: Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'></c:url>">
<style>
.panel {
	border: white;
}

</style>
</head>
<body style="background-color: rgb(255, 240, 240);">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="panel panel-primary" style="padding-top: 30px; margin-top: 50px;">
					<div style="margin-bottom: 20px;">
						<h2 style="padding-left: 95px;" >Login Form</h2>
					</div>
					  <div class="row" style="padding-left:103px; margin-bottom: -30px;">
				    <c:if test="${not empty error }">
				    <button type = "button" class = "btn" style="padding:0px; padding-left: 3px; padding-right: 3px; background-color: white; border: 1px solid Tomato;"><font color="Tomato">${error }</font></button>
				    </c:if>
				     </div>
					<div style="margin-top:0px; padding: 40px;">
						<form action="<c:url value='j_spring_security_check'></c:url>" method="post" style="">
							<div class="form-group">
								<input required="required" type="text" name="j_username" class="form-control"
									placeholder="Your Email Address" />
							</div>
							<div class="form-group" style="margin-top: -15px; border-radius: 0;">
								<input required="required" type="password" name="j_password" class="form-control"
									placeholder="Your Password" />
							</div>
							<div class="form-group" style="margin-top: 25px;">
							 <button type="submit" class = "btn" style="width: 275px; padding: 5px;">LOG IN</button>
							</div>
						</form>
					    <!-- <a href="" class="btn" ><font size="2px;">Recover password</font></a> -->
					    <div class="row" >
					     <div class="col-md-4"><a href="<c:url value='/newCustomerForm'></c:url>" class="btn" style="padding:0px; "><font size="2px;">new Customer?</font></a>
					      <br>
					      <a href="<c:url value='/newRetailerForm'></c:url>" class="btn" style="padding:0px; "><font size="2px;">new Retailer?</font></a>
					     </div>
					     <div class="col-md-4"></div>
					     <div class="col-md-4" style="padding:0px;"><a href="<c:url value='/forgotPassword'></c:url>" class="btn" style="padding:0px;  "><font size="2px;">Recover<br> Password</font></a></div>
					    </div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>