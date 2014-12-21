$(document).ready(
		function() {
			$('#createEventForm').validate(
					{
						rules : {
							summary : {
								required : true,
								required : true,
								minlength : 2,
								maxlength : 255
							},

							description : {
								minlength : 2,
								maxlength : 500,
								required : true
							}
						},
						highlight : function(element) {
							$(element).closest('.control-group').removeClass(
									'success').addClass('error');
						},
						success : function(element) {
							element.text('OK!').addClass('valid').closest(
									'.control-group').removeClass('error')
									.addClass('success');
						}
					});
		}); // end document.ready
