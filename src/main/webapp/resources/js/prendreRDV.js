/**** Filter table rows ****/
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


/*$(document).ready(function() {

    var bookingPlanning = null;  // Variable to store appointment ID

    // Attach click event directly to the checkbox input
    $(".btn-check").click(function() {

        // Check if the checkbox is checked
        if ($(this).is(":checked")) {
            bookingPlanning = $(this).val(); 
            // Display the current appointment ID
            alert('Value of planning ID: ' + bookingPlanning);
        }  
    });

});*/


$(document).ready(function() {
	
	var bookingPlanning = null;   
     
    $('#action-button').click(function() {

        $("input:checkbox[class='btn-check']:checked").each(function() {
 
			bookingPlanning = $(this).val(); 
			 
		});
		
		 /*alert('Value of planning ID: ' + bookingPlanning);*/
		 
		 
		 var planningId = bookingPlanning;
    
    $.ajax({
		url: '/dental-center-app/NouveauRDV/prendre', 
		async: false,  
		type: "POST", 
		data: { "planningId": planningId },  
		
		success: function(data, textStatus, jqXHR) {
			if (data != "") {
				response = data;  
			} else {
				response = '';  
			}
			 
			window.location.href = '/dental-center-app/NouveauRDV';
		},
		 
		error: function(jqXHR, textStatus, errorThrown) {
			console.log("Something went wrong==>", errorThrown);  
			response = '';  
			 
			alert('exception, errorThrown==>' + errorThrown);
		}
	});
    });
    
});