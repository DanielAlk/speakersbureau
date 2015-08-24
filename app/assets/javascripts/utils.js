$(function() {
	$(document).ajaxError(function(event, xhr, settings, thrownError) {
		console.log(arguments);
	});
});

var Utils = {};

Utils.inputTextArray = function() {
	$(document).on('keyup', '[type=text][name*="[]"]', function(e) {
		if (/^[^\s].*$/.test(this.value)) !$(this).next().is('[type=text][name*="[]"]') && $(this).parent().append($(this).clone().val(''));
		else $(this).next().is('[type=text][name*="[]"]') && $(this).next().remove();
		$('[type=text][name*="[]"]').each(function(i) {
			this.id = this.name.replace('[]', '_'+i);
		});
	});
};

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