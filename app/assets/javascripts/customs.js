$(document).ready(function () {
	// Just some simple UI animations/helpers 
	if ($('.notice')) {
		$('.notice').fadeIn().delay(2000).fadeOut('slow'); 
	}

	$('#search').focus(function() {
		this.select()
	})
})