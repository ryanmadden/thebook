# Clicking on Rushee in Rushees page redirects to Rushee page
$ ->
	$('main#Rushees section:first-child div#masonry-container div.masonry-rushee').click ->
		window.location = $(this).children('div.rushee-info').children('h2').children('a').attr('href')


	$('#masonry-container').imagesLoaded ->
		$("#masonry-container").masonry
		  itemSelector: ".masonry-rushee"
		  gutterWidth: 20


	$('main#Rushees section:first-child button').click ->
		button = $('main#Rushees section:first-child button')
		mainButton = $('main#Rushees section:first-child button')
		caretButton = $('main#Rushees section:first-child button + button')
		list = $('main#Rushees section:first-child button + ul')

		unless list.is(':visible')
			mainButton.css('border-radius', '3px 0 0 0')
			caretButton.css('border-radius', '0 3px 0 0')
			caretButton.css('opacity', '0.8')
			list.show()
		else
			mainButton.css('border-radius', '3px 0 0 3px')
			caretButton.css('border-radius', '0 3px 3px 0')
			caretButton.css('opacity', '1.0')
			list.hide()