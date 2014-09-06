$(document).ready(function() {
	$('ul.rushee-stats li:first-child').click(function() {
		$('.vote').on('ajax:success', function (jqueryEventMetadata, ourData) {
		    $('.count').html(ourData.count);
		    console.log(ourData.count);
		    console.log(image);
		});
	});
});