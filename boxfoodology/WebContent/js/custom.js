function setActiveHeader(url) {
	$(".nav a[href='"+url+"']").parent().attr("class", "active");
}

/* ------ NOTIFICATIONS ------*/

var notifTimeout = '6000';

notify = function(text, style) {

	var $container = $('#notifications');
 
	if (typeof style == 'undefined' ) {
		style = 'warning';
	}
	var html = $('<div class="alert alert-' + style + '  hide">' + text + '</div>');

	$container.prepend(html);
	html.removeClass('hide').hide().fadeIn('slow');

	function remove() {
		html.stop().fadeOut('slow').remove();
	}
	
	setInterval(remove, notifTimeout);
};
