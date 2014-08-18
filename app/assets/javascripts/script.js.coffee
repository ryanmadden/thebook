# Clicking on Rushee in Rushees page redirects to Rushee page
$ ->
	$('main#Rushees section:first-child div#masonry-container div.masonry-rushee').click ->
		window.location = $(this).children('div.rushee-info').children('h2').children('a').attr('href')


	$('#masonry-container').imagesLoaded ->
		$("#masonry-container").masonry
		  itemSelector: ".masonry-rushee"
		  gutterWidth: 25


	$('main#Rushees section:first-child select').change ->
		selection = $('main#Rushees section:first-child select option:selected').attr('value')
		window.location.href = "/" + selection;