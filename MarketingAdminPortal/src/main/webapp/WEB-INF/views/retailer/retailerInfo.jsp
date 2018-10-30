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

		<div>
			
			<ol class="breadcrumb">
				<li><a href="<c:url value='/admin/retailer/list'></c:url>"><i class="fa fa-long-arrow-left" aria-hidden="true"></i>Go back</a></li>
				<li><a href="<c:url value='/admin/retailer/update/${list.retId}'></c:url>">Edit</a></li>
			</ol>	
		</div>
		<div class="row">
			<div class="col-xs-9">
		
			
				<h3 >${list.retailername}</h3>
				<div class="row">
					<div class="col-xs-6">
						<p><strong>Email Address: </strong><span>${list.user.email}</span></p>
						<p><strong>Password: </strong><span>${list.user.password}</span></p>
						<p><strong>Contact Person: </strong><span>${list.contactperson}</span></p>
						<p><strong>GTIN: </strong><span>${list.gtin}</span></p>
						<p><strong>Phonenumber: </strong><span>${list.phonenumber}</span></p>
						<p><strong>Alternatenumber: </strong><span>${list.alternatenumber}</span></p>
					</div>
					<div class="col-xs-6">
					<h3 style = "margin-top:-30px;">Store Location</h3>
						<p><strong>Street: </strong><span>${list.street1},${list.route1 }</span></p>
						<p><strong>City: </strong><span>${list.city1}</span></p>
						<p><strong>State: </strong><span>${list.state1}</span></p>
						<p><strong>Zipcode: </strong><span>${list.zipcode1}</span></p>
						<p><strong>Country: </strong><span>${list.country1}</span></p>
					</div>
				</div>
				
			</div>
		</div>
</div>
</body>
</html>