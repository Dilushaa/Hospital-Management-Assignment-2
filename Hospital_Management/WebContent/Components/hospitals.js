$(document).ready(function()
{
	
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
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
