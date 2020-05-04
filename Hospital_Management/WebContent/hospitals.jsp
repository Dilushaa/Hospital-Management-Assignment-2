<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/myCss.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/hospitals.js"></script>

</head>
<body>

<div class="container">

	<div class="row">
		<div class="col-6">
		<h1 id="head">HOSPITAL MANAGEMENT</h1>
		<form id="formHospital" name="formHospital">
			 
			 MOH code:
			 <input id="mohCode" name="mohCode" type="text" placeholder="moh1234"
			 class="form-control form-control-sm">
			 
			 <br> Hospital name:
			 <input id="hospitalName" name="hospitalName" type="text" placeholder="Asiri"
			 class="form-control form-control-sm">
			 
			 <br> Email Address:
			 <input id="emailAddress" name="emailAddress" type="text" placeholder="abc@gmail.com"
			 class="form-control form-control-sm">
			 
			 <br> Manager Name:
			 <input id="managerName" name="managerName" type="text" placeholder="MR.ABC"
			 class="form-control form-control-sm">
			 
			 
			  <br> Address:
			 <input id="address" name="address" type="text" placeholder="colombo"
			 class="form-control form-control-sm">
			 
			 
			  <br> Telephone NO:
			 <input id="telephoneNo" name="telephoneNo" type="text" placeholder="011-xxxxxxx"
			 class="form-control form-control-sm">
			 <br>
			 
			 <input id="btnSave" name="btnSave" type="button" value="Save"
			 class="btn btn-primary">
			 <input type="hidden" id="hidHospitalIDSave"
			 name="hidHospitalIDSave" value="">
		</form>
		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div>
		<br>
		
		
		<div id="divHospitalsGrid">
		 <%
		 Hospital hospitalObj = new Hospital();
		 out.print(hospitalObj.readHospitalDetails());
		 %>
		</div>


		</div>
 	</div>
</div>



</body>
</html>