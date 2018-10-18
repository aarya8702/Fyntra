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
<title>Retailer Update</title>
<style>
#locationField, #controls {
	position: relative;
	width: 480px;
}

.label {
	text-align: right;
	font-weight: bold;
	width: 100px;
	color: #303030;
}

#autocomplete {
	position: relative;
	top: 0px;
	left: 0px;
	width: 99%;
}

#address {
	border: 1px solid #000090;
	background-color: #f0f0ff;
	width: 480px;
	padding-right: 2px;
}

#address td {
	font-size: 10pt;
}

.field {
	width: 99%;
}

.slimField {
	width: 80px;
}

.wideField {
	width: 200px;
}

#locationField {
	height: 20px;
	margin-bottom: 2px;
}
</style>
</head>
<body bgcolor="grey">
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/navigation.jsp" />
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h2>Retailer Info</h2>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<spring:url value="/retailer/update" var="saveUrl" />
								<form:form action="${saveUrl }" method="post"
									class="form-horizontal" modelAttribute="retailer">
									<form:hidden path="retId" />
									<fieldset>
										<legend class="center-block"> Update Retailer
											Information </legend>

										<div class="form-group">
											<label class="col-md-2 control-label"><b>Retailer's
													name: </b></label>
											<div class="col-md-8">
												<form:input type="text" path="retailername"
													class="form-control" placeholder="Enter Retailer's name" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Email
													Id: </b></label>
											<div class="col-md-8">
												<form:input type="text" path="user.email"
													class="form-control" placeholder="Enter email address"
													readonly="true" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Password:
											</b></label>
											<div class="col-md-8">
												<form:input id="password" type="password"
													path="user.password" class="form-control"
													placeholder="Enter Password" readonly="true" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Contact
													Person </b></label>
											<div class="col-md-8">
												<form:input type="text" path="contactperson"
													class="form-control" placeholder="Enter ContactPerson" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Primary
													Contact number </b></label>
											<div class="col-md-8">
												<form:input type="text" path="phonenumber"
													class="form-control"
													placeholder="Enter primary Contact Number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Alternate
													Contact number </b></label>
											<div class="col-md-8">
												<form:input type="text" path="alternatenumber"
													class="form-control"
													placeholder="Enter Alternate Contact number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>GST TIN
													(Optional)</b></label>
											<div class="col-md-8">
												<form:input type="text" path="gtin" class="form-control"
													placeholder="Enter GST TIN" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"><b>Search
													Your Store</b></label>
											<div class="col-md-8">
												<input id="autocomplete" placeholder="Enter your address"
													onFocus="geolocate()" type="text" class="form-control" />
											</div>
										</div>
										<div class="col-md-2 control-label"></div>
										<div class="col-md-8">
											<div
												style="width: 350px; background-color: linen; padding: 10px;">
												<label>Street address:</label>
												<form:input class="field" id="street_number" path="street1"
													type="text" />
												<form:input class="field" id="route" path="route1"
													type="text" />
												<label>City:</label>
												<form:input class="field" path="city1" type="text"
													id="locality" />
												<label>State:</label>
												<form:input class="field" id="administrative_area_level_1"
													path="state1" type="text" />
												<label>Zip code:</label>
												<form:input class="field" id="postal_code" path="zipcode1"
													type="text" />
												<label>Country:</label>
												<form:input class="field" id="country" path="country1"
													type="text" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label"></label>
											<div class="col-md-8">
												<button type="submit" class="btn btn-success">Update
													Retailer</button>
												<a class="btn btn-danger"
													href="<c:url value = '/admin/retailer/list'></c:url>">Cancel</a>
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
	<script type="text/javascript">
		function myFunction() {

			document.getElementById("password").readOnly = false;
			<!--
			document.getElementById("password").type = 'text';
			-->

		}
	</script>
	<script>
		// This example displays an address form, using the autocomplete feature
		// of the Google Places API to help users fill in the information.

		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

		var placeSearch, autocomplete;
		var componentForm = {
			street_number : 'short_name',
			route : 'long_name',
			locality : 'long_name',
			administrative_area_level_1 : 'short_name',
			country : 'long_name',
			postal_code : 'short_name'
		};

		function initAutocomplete() {
			// Create the autocomplete object, restricting the search to geographical
			// location types.
			autocomplete = new google.maps.places.Autocomplete(
			/** @type {!HTMLInputElement} */
			(document.getElementById('autocomplete')), {
				types : [ 'geocode' ]
			});

			// When the user selects an address from the dropdown, populate the address
			// fields in the form.
			autocomplete.addListener('place_changed', fillInAddress);
		}

		function fillInAddress() {
			// Get the place details from the autocomplete object.
			var place = autocomplete.getPlace();

			for ( var component in componentForm) {
				document.getElementById(component).value = '';

			}

			// Get each component of the address from the place details
			// and fill the corresponding field on the form.
			for (var i = 0; i < place.address_components.length; i++) {
				var addressType = place.address_components[i].types[0];
				if (componentForm[addressType]) {
					var val = place.address_components[i][componentForm[addressType]];
					document.getElementById(addressType).value = val;
				}
			}
		}

		// Bias the autocomplete object to the user's geographical location,
		// as supplied by the browser's 'navigator.geolocation' object.
		function geolocate() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var geolocation = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};
					var circle = new google.maps.Circle({
						center : geolocation,
						radius : position.coords.accuracy
					});
					autocomplete.setBounds(circle.getBounds());
				});
			}
		}
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgsx2vc804jQH6_vON6JEvnQ7tj7bwPVA&libraries=places&callback=initAutocomplete"
		async defer></script>

</body>
</html>