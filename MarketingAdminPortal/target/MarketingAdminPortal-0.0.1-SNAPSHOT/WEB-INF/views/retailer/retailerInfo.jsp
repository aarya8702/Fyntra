<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retailer Information</title>
</head>
<body>
 <div class="container">
 <c:forEach items = "${list}" var = "ret">
		<div>
			
			<ol class="breadcrumb">
				<li><a href="<c:url value='/admin/retailer/list'></c:url>"><i class="fa fa-long-arrow-left" aria-hidden="true"></i>Go back</a></li>
				<li><a href="<c:url value='/admin/retailer/update/${ret.retId}'></c:url>">Edit</a></li>
			</ol>	
		</div>
		<div class="row">
			<div class="col-xs-9">
		
			
				<h3 >${ret.retailername}</h3>
				<div class="row">
					<div class="col-xs-6">
						<p><strong>Email Address: </strong><span>${ret.user.email}</span></p>
						<p><strong>Password: </strong><span>${ret.user.password}</span></p>
						<p><strong>Contact Person: </strong><span>${ret.contactperson}</span></p>
						<p><strong>GTIN: </strong><span>${ret.gtin}</span></p>
						<p><strong>Phonenumber: </strong><span>${ret.phonenumber}</span></p>
						<p><strong>Alternatenumber: </strong><span>${ret.alternatenumber}</span></p>
					</div>
					<div class="col-xs-6">
					<h3 style = "margin-top:-30px;">Store Location</h3>
						<p><strong>Street: </strong><span>${ret.street1},${ret.route1 }</span></p>
						<p><strong>City: </strong><span>${ret.city1}</span></p>
						<p><strong>State: </strong><span>${ret.state1}</span></p>
						<p><strong>Zipcode: </strong><span>${ret.zipcode1}</span></p>
						<p><strong>Country: </strong><span>${ret.country1}</span></p>
					</div>
				</div>
				
			</div>
		</div>
		</c:forEach>
</div>
</body>
</html>