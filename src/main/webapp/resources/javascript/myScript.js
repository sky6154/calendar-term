$(document).ready(
		function() {
			$('#signupForm').validate(
					{
						rules : {
							user_id : {
								required : true,
								required : true,
								minlength : 2,
								maxlength : 10
							},

							name : {
								minlength : 2,
								maxlength : 10,
								required : true
							},

							password : {
								required : true,
								minlength : 6
							},
							confirm_password : {
								required : true,
								minlength : 6,
								equalTo : "#password"
							},

							email : {
								required : true,
								email : true
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
