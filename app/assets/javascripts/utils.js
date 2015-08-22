var Utils = {};

$(function() {
	Utils.inputTextArray();
});

Utils.inputTextArray = function() {
	$(document).on('keyup', '[type=text][name*="[]"]', function(e) {
		if (/^[^\s].*$/.test(this.value)) !$(this).next().is('[type=text][name*="[]"]') && $(this).parent().append($(this).clone().val(''));
		else $(this).next().is('[type=text][name*="[]"]') && $(this).next().remove();
		$('[type=text][name*="[]"]').each(function(i) {
			this.id = this.name.replace('[]', '_'+i);
		});
	});
};