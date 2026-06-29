/**** Filter table rows on search button click ****/
$(document).ready(function(){

  function filterTableByDate() {
    var value = $("#myInput").val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  }

  // Filter only when the search button is clicked
  $("#searchBtn").on("click", filterTableByDate);

  // Prevent the Enter key from triggering the filter / submitting
  $("#myInput").on("keydown", function(e) {
    if (e.key === "Enter") {
      e.preventDefault();
    }
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
		 var motifRDV = $("#motifSelect").val();

    $.ajax({
		url: '/dental-center-app/NouveauRDV/prendre',
		async: false,
		type: "POST",
		data: { "planningId": planningId, "motifRDV": motifRDV },
		
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