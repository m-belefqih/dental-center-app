/**** Filter table rows ****/
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

/**** Method to switch the delete button's state based on checkbox status ****/
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


/*********************** get a Dentist to update it ************************** */
var app = angular.module('dentistApp', []);

app.controller('dentistCtrl', function($scope) {
	$scope.getDentistDetails = function(dentistId) {
		var dentistDetails = '';
		$.ajax
			(
				{
					url: '/dental-center-app/ListeDentistes/get',
					type: 'POST',
					data: { "dentistId": dentistId },
					async: false,
					success: function(data, textStatus, jqXHR) {
						dentistDetails = data;
						
					},
					error: function(jqXHR, textStatus, error) {
						dentistDetails: '';
						console.log('Error in getting dentist details from server ==>' + error);
					}
				}
			);

		// Parse the detist details JSON string into an object and store it in $scope.dentist
		$scope.dentist = JSON.parse(dentistDetails);
		console.log('Dentist Details ==> ' + $scope.dentist);

		// return the dentist object
		return $scope.dentist;
	}
}
);


/****************** Select/Deselect Dentists checkboxes ************************/
$(document).ready(function() {

	// Select/Deselect Dentists checkboxes
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
		// Initialize an empty array to store the IDs of dentists to be deleted
		var deletedDentists = [];

		// Iterate through each checked checkbox with the class 'form-check-input'
		$("table tbody input:checkbox[class='form-check-input']:checked").each(function() {
			// Add the value of the checked checkbox (dentist ID) to the deletedDentists array
			deletedDentists.push($(this).val());
		});
		

		// Join the array of dentist IDs into a comma-separated string
		deletedDentists = deletedDentists.join(",");
		var dentistIds = deletedDentists.toString();  // For example : dentistIds = '3,10,2,9,...'

		// Make an AJAX POST request to delete the selected dentists
		$.ajax({
			url: '/dental-center-app/ListeDentistes/delete', // The URL to send the request to
			async: false, // Synchronous request (not recommended, consider using async: true)
			type: "POST", // The type of request to make
			data: { "dentistIds": dentistIds }, // Data to be sent to the server

			// Function to handle a successful response
			success: function(data, textStatus, jqXHR) {
				if (data != "") {
					response = data; // Store the response data
				} else {
					response = ''; // If no data is returned, set response to an empty string
				}
				// Redirect to the main page of the dentist CRUD app
				window.location.href = '/dental-center-app/ListeDentistes';
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

