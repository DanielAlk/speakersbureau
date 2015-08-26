$(function() {
	$(document).ajaxError(function(event, xhr, settings, thrownError) {
		console.log(arguments);
	});
});

var Utils = {};

Utils.init = function() {
	$('[data-toggle="tooltip"]').tooltip();
	$('.ui.dropdown.btn').dropdown({
	  action: function(text, value) {
	    window.location.href = value;
	  },
	  match: 'text',
	  onShow: function() {
	    $(this).find('input').focus();
	  }
	});
}

Utils.newContactForm = function() {
	$('#new_contact').submit(function(e) {
		e.preventDefault();
		var form = this;
		$.post(form.action, $(form).serialize(), function(response) {
			$(form).hide();
			$('#new_contact_success').show();
		}, 'json');
	});
};