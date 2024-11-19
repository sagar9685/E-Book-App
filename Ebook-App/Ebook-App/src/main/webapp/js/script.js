//$(function() {
//	var $UserregisterForm = $("#register");
//	$UserregisterForm.validate({
//		rules: {
//
//			fname: {
//				required: true,
//				lettersonly: true
//			},
//			email: {
//				required: true,
//				space: true,
//				email: true
//			},
//			phno: {
//				required: true,
//				space: true,
//				numericOnly: true,
//				minlength: 10,
//				maxlength: 12
//
//			},
//			password: {
//				required: true,
//				space: true
//
//			}
//
//
//		},
//		messages: {
//			fname: {
//				required: 'full name must be required',
//
//				lettersonly: 'invalid name'
//
//			},
//			email: {
//				required: 'email name must be required',
//				space: 'space not allowed',
//				email: 'Invalid email'
//			},
//			phno: {
//				required: 'mob no must be required',
//				space: 'space not allowed',
//				numericOnly: 'invalid mob no',
//				minlength: 'min 10 digit',
//				maxlength: 'max 12 digit'
//			},
//
//			password: {
//				required: 'password must be required',
//				space: 'space not allowed'
//
//			}
//		}
//	})
//
//
//	jQuery.validator.addMethod('lettersonly', function(value, element) {
//		return /^[^-\s][a-zA-Z_\s-]+$/.test(value);
//	});
//
//
//	jQuery.validator.addMethod('space', function(value, element) {
//		return /^[^-\s]+$/.test(value);
//	});
//
//	jQuery.validator.addMethod('all', function(value, element) {
//		return /^[^-\s][a-zA-Z0-9_,.\s-]+$/.test(value);
//	});
//
//
//	jQuery.validator.addMethod('numericOnly', function(value, element) {
//		return /^[0-9]+$/.test(value);
//	});
//})
$(function() {
    var $UserregisterForm = $("#register");
    $UserregisterForm.validate({
        rules: {
            fname: {
                required: true,
                lettersonly: true
            },
            email: {
                required: true,
                emailRegex: true
            },
            phno: {
                required: true,
                mobileNumber: true
            },
            password: {
                required: true,
                strongPassword: true
            }
        },
        messages: {
            fname: {
                required: 'Full name is required',
                lettersonly: 'Invalid name'
            },
            email: {
                required: 'Email is required',
                emailRegex: 'Invalid email'
            },
            phno: {
                required: 'Mobile number is required',
                mobileNumber: 'Invalid mobile number'
            },
            password: {
                required: 'Password is required',
                strongPassword: 'Password must meet the following criteria:<br>' +
                '- At least 10 characters long<br>' +
                '- Contains at least one uppercase letter (A-Z)<br>' +
                '- Contains at least one lowercase letter (a-z)<br>' +
                '- Contains at least one digit (0-9)<br>' +
                '- Contains at least one special character (!@#$%^&*()-_=+`|~[]{};:",.<>?/)<br>' +
                '- Does not contain more than 2 identical characters in a row'
            }
        }
    })

    jQuery.validator.addMethod('lettersonly', function(value, element) {
        return /^[a-zA-Z\s-]+$/.test(value);
    });

    jQuery.validator.addMethod('emailRegex', function(value, element) {
        return /^[a-zA-Z0-9_+&-]+(?:\.[a-zA-Z0-9_+&-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$/.test(value);
    });

    jQuery.validator.addMethod('mobileNumber', function(value, element) {
        return /^[69][0-9]{9}$/.test(value);
    });

    jQuery.validator.addMethod('strongPassword', function(value, element) {
        return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s])(?=.*[^\s]).{10,128}(?!.*(.)\1{2})$/.test(value);
    });
});