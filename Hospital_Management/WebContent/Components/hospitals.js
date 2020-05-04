$(document).ready(function()
{
	
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
 
 
 //$('#telephoneNo').blur(function(e) {
   //  if (validatePhone('telephoneNo')) {
 //        $('#spnPhoneStatus').text('Valid');
         //$('#spnPhoneStatus').css('color', 'green');
  //   }
 //    else {
       //  $('#spnPhoneStatus').text('Invalid');
         //$('#spnPhoneStatus').css('color', 'red');
 //    }
 //});
 
 
 
});


//SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
 
//Form validation-------------------
 var status = validateHospitalForm();
 if (status != true)
  {
  $("#alertError").text(status);
  $("#alertError").show();
  return;
  }
 
 
//If valid use ajax------------------------

 var type = ($("#hidHospitalIDSave").val() == "") ? "POST" : "PUT";

 $.ajax(
 		{
 		 url : "HospitalsAPI",
 		 type : type,
 		 data : $("#formHospital").serialize(),
 		 dataType : "text",
 		 complete : function(response, status)
 		 {
 		 onHospitalSaveComplete(response.responseText, status);
 		 }
 		});

 });

function onHospitalSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divHospitalsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} 
	else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidHospitalIDSave").val("");
	$("#formHospital")[0].reset();
	
	//location.reload();
	
}

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidHospitalIDSave").val($(this).closest("tr").find('#hidHospitalIDUpdate').val());
 $("#mohCode").val($(this).closest("tr").find('td:eq(0)').text());
 $("#hospitalName").val($(this).closest("tr").find('td:eq(1)').text());
 $("#emailAddress").val($(this).closest("tr").find('td:eq(2)').text());
 $("#managerName").val($(this).closest("tr").find('td:eq(3)').text());
 $("#address").val($(this).closest("tr").find('td:eq(4)').text());
 $("#telephoneNo").val($(this).closest("tr").find('td:eq(5)').text());
});


//REMOVE=======
$(document).on("click", ".btnRemove", function(event)
		{
			$.ajax(
			{
				url : "HospitalsAPI",
				type : "DELETE",
				data : "hospitalID=" + $(this).data("hospitalid"),
				dataType : "text",
				complete : function(response, status)
				{
					onHospitalDeleteComplete(response.responseText, status);
				}
			});
});


function onHospitalDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divHospitalsGrid").html(resultSet.data);
		} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} 
	else
	{
		$("#alertError").text("Unknown error while deleting.");
		$("#alertError").show();
	}
	
}


//CLIENTMODEL=========================================================================
function validateHospitalForm()
{
// CODE
if ($("#mohCode").val().trim() == "")
 {
 return "Insert MOH Code.";
 }
// NAME
if ($("#hospitalName").val().trim() == "")
 {
 return "Insert Hospital Name.";
 }
//email address-------------------------------
if ($("#emailAddress").val().trim() == "")
 {
 return "Insert Email Address.";
 }



		var re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;	
		var email = $("#emailAddress").val().trim();
	
	if (re.test(email) == false) 
	{
		
		return "Please enter valid email address";
	
	}


//manager name
if ($("#managerName").val().trim() == "")
{
return "Insert Manager Name.";
}

//address
if ($("#address").val().trim() == "")
{
return "Insert Address.";
}

//telephone number 
if ($("#telephoneNo").val().trim() == "")
{
return "Insert telephone number.";
}

// is numerical value
var tmpTel = $("#telephoneNo").val().trim();
if (!$.isNumeric(tmpTel))
 {
 return "Insert a numerical value for Telephone number.";
 }


// check for length

var pattern = /^\d{10}$/;
	
if (!pattern.test(tmpTel)) 
{
		
	return "Contact number should have 10 numbers";
	
}



return true;
}


