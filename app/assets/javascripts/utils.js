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
	$('select.dropdown').dropdown({ allowAdditions: true });
	$('#new_contact').validate({
		submitHandler: function(form) {
			$.post(form.action, $(form).serialize(), function(response) {
				$(form).hide();
				$('#new_contact_success').show();
				if ($('body').is('.mobile')) {
					$('#new_contact_success').removeClass('space-bottom-plus');
					$('html,body').scrollTop(205);
				};
			}, 'json');
		}
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
};

Utils.adminButtons = function() {
	$admin_buttons = $('.admin-buttons').css('display', $.cookie('admin_buttons_display'));
	$('.admin-info').css('cursor', 'pointer').click(function(e) {
		$admin_buttons.toggle(400, function() {
			$.cookie('admin_buttons_display', $admin_buttons.css('display'));
		});
	});
};

Utils.deleteSpeakerImages = function(selector) {
	$(selector).on('ajax:success', function(e, data, status, xhr) {
		$(this).parent().fadeOut(function() {
			$(this).remove();
		});
	});
};