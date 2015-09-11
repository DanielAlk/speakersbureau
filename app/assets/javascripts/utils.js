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
	$(document).on('click', '.speaker-preview-box img, .speaker-preview-box h3, .preview-posts h2, .highlighted-post h2', function(e) {
		$(this).parent().find('a').get(0).click();
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

Utils.speakersForm = function(areas, videos) {
	$('select.dropdown').dropdown({ allowAdditions: true });
	$('.dropdown.multiple.speaker-areas-dropdown').dropdown('set selected', areas);
	$('.dropdown.multiple.speaker-videos-dropdown').dropdown('set selected', videos);
	$('label[for=speaker_images_save_method] input[type=radio]').change(function(e) {
	  if (this.value == 'destroy' && this.checked) $('#speaker_images_').prop('disabled', true);
	  else $('#speaker_images_').prop('disabled', false);
	});
}