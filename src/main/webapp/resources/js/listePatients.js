/**** Filter table rows ****/
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

/********* Switch the delete button's state based on checkbox status *******/
$(document).ready(function() {
	$('.form-check-input').change(function() {
		if (this.checked) {
			$('.btn-danger').removeClass('disabled');
		} else {
			$('.btn-danger').addClass('disabled');
		}
	});
});

/*********************** Initialize tooltips ************************** */
document.addEventListener('DOMContentLoaded', function () {
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    	return new bootstrap.Tooltip(tooltipTriggerEl)
    })
});


/*********************** get a Patient to update it ************************** */
var app = angular.module('patientApp', []);

app.controller('patientCtrl', function($scope) {
	$scope.getPatientDetails = function(patientId) {
		var patientDetails = '';
		$.ajax
			(
				{
					url: '/dental-center-app/ListePatients/get',
					type: 'POST',
					data: { "patientId": patientId },
					async: false,
					success: function(data, textStatus, jqXHR) {
						patientDetails = data;
						
					},
					error: function(jqXHR, textStatus, error) {
						patientDetails: '';
						console.log('Error in getting patient details from server ==>' + error);
					}
				}
			);

		// Parse the patient details JSON string into an object and store it in $scope.patient
		$scope.patient = JSON.parse(patientDetails);
		console.log('Patient Details ==> ' + $scope.patient);

		// return the patient object
		return $scope.patient;
	}
}
);

/**************************** Method 2 ******************************/
/*var app = angular.module('patientApp', []);

app.controller('patientCtrl', function($scope) {
	$scope.getPatientDetails = function(patientId) {
		$.ajax
			(
				{
					url: '/dental-center-app/ListePatients/get',
					type: 'POST',
					data: { "patientId": patientId },
					async: false,
					dataType: 'json',
					success: function(data, textStatus, jqXHR) {
						  
						  $scope.patient = data;
						  console.log('Patient Details ==> ', $scope.patient);
						
					},
					error: function(jqXHR, textStatus, error) {
						 
						console.log('Error in getting patient details from server ==>' + error);
					}
				}
			);

		// return the patient object
		return $scope.patient;
	}
}
);*/


/****************** Select/Deselect Patients checkboxes ************************/
$(document).ready(function() {

	// Select/Deselect Patients checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function() {
		if (this.checked) {
			checkbox.each(function() {
				this.checked = true;
			});
		}
		else {
			checkbox.each(function() {
				this.checked = false;
			});
		}
	});
	
 
 
	checkbox.click(function() {
		if (!this.checked) {
			$("#selectAll").prop("checked", false);
		}
	});

	$('#deleteBtn').click(function() {
		// Initialize an empty array to store the IDs of patients to be deleted
		var deletedPatients = [];

		// Iterate through each checked checkbox with the class 'form-check-input'
		$("table tbody input:checkbox[class='form-check-input']:checked").each(function() {
			// Add the value of the checked checkbox (patient ID) to the deletedPatients array
			deletedPatients.push($(this).val());
		});
		

		// Join the array of patient IDs into a comma-separated string
		deletedPatients = deletedPatients.join(",");
		var patientIds = deletedPatients.toString();  // For example : patientIds = '3,10,2,9,...'

		// Make an AJAX POST request to delete the selected patients
		$.ajax({
			url: '/dental-center-app/ListePatients/delete', // The URL to send the request to
			async: false, // Synchronous request (not recommended, consider using async: true)
			type: "POST", // The type of request to make
			data: { "patientIds": patientIds }, // Data to be sent to the server

			// Function to handle a successful response
			success: function(data, textStatus, jqXHR) {
				if (data != "") {
					response = data; // Store the response data
				} else {
					response = ''; // If no data is returned, set response to an empty string
				}
				// Redirect to the main page of the patient CRUD app
				window.location.href = '/dental-center-app/ListePatients';
			},
			// Function to handle an error response
			error: function(jqXHR, textStatus, errorThrown) {
				console.log("Something went wrong==>", errorThrown); // Log the error to the console
				response = ''; // Set response to an empty string
				// Alert the user about the exception
				alert('exception, errorThrown==>' + errorThrown);
			}
		});
	});

});