$ ->

	# 


	# Clicking on Rushee in Rushees page redirects to Rushee page
	$('main#Rushees section:first-child div#masonry-container div.masonry-rushee').click ->
		window.location = $(this).children('div.rushee-info').children('h2').children('a').attr('href')


	# Waits for images to load before calling masonry
	$('#masonry-container').imagesLoaded ->
		$("#masonry-container").masonry
		  itemSelector: ".masonry-rushee"
		  gutterWidth: 25


	# Handles rushee ordering based on select option
	$('main#Rushees section:first-child select').change ->
		selection = $('main#Rushees section:first-child select option:selected').attr('value')
		window.location.href = "/" + selection;


	# Brother like hover animation
	$('main#Rushee section.rushee-brother-likes div.brother-like span').hide()
	$('main#Rushee section.rushee-brother-likes div.brother-like').mouseenter ->
		$(this).children('img').css('opacity', '0.6')
		$(this).children('span').show()
	$('main#Rushee section.rushee-brother-likes div.brother-like').mouseleave ->
		$(this).children('img').css('opacity', '1.0')
		$(this).children('span').hide()