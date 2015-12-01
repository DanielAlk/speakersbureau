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

Utils.speakersForm = function(areas) {
	$('select.dropdown').dropdown({ allowAdditions: true });
	$('.dropdown.multiple.speaker-areas-dropdown').dropdown('set selected', areas);
	$('label[for=speaker_images_save_method] input[type=radio]').change(function(e) {
	  if (this.value == 'destroy' && this.checked) $('#speaker_images_').prop('disabled', true);
	  else $('#speaker_images_').prop('disabled', false);
	});
};

Utils.adminButtons = function() {
	$admin_buttons = $('.admin-buttons').css('display', $.cookie('admin_buttons_display'));
	$('.admin-info').css('cursor', 'pointer').click(function(e) {
		$admin_buttons.toggle(400, function() {
			$.cookie('admin_buttons_display', $admin_buttons.css('display'), { path: '/' });
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

Utils.multipleInputs = function() {
	var $multiples = $('[data-multiple]');
	var id = $multiples.get(0).id;
	id = id.substr(0,id.length-1);
	var appendClone = function(do_it_anyway) {
		if (do_it_anyway === true || $(this).is($multiples.last())) {
			var $clone = $multiples.last().clone().val(null).attr('id', id+$multiples.length);
			$multiples.parent().append($clone);
			$multiples = $('[data-multiple]');
		};
	};
	var removeClones = function($multiple) {
		$multiple = $(this);
		if (!$multiple.val()) {
			$multiples.each(function(){
				var $multiple = $(this);
				if (!$multiple.val()) $multiple.remove();
			});
			$multiples = $('[data-multiple]');
			$multiples.each(function(i){
				$(this).attr('id', id+i);
			});
			appendClone(true);
		};
	};
	$(document).on('focusout','[data-multiple]',removeClones);
	$(document).on('focusin','[data-multiple]',appendClone);
};