# Clicking on Rushee in Rushees page redirects to Rushee page
$ ->
	$('main#Rushees section:first-child > div').click ->
		window.location = $(this).children('a').attr('href')