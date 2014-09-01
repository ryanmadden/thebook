$ ->
	
	# Animate navbar on scroll
	animated = false
	navPosition = $("header").offset().top
	$(window).scroll ->
		newPosition = $("header").offset().top

		if newPosition and not animated
			$("header > nav").animate
				padding: "10px 0"
			,
				duration: 400
				queue: false
			animated = true
		else if not newPosition and animated
			$("header > nav").animate
				padding: "20px 0"
			,
				duration: 400
				queue: false
			animated = false
		navPosition = newPosition


	# Clicking on Rushee in Rushees page redirects to Rushee page
	$('main#Rushees section:first-child div#masonry-container div.masonry-rushee').click ->
		window.location = $(this).children('div.rushee-info').children('h2').children('a').attr('href')


	# Waits for images to load before calling masonry
	$('#masonry-container').imagesLoaded ->
		$("#masonry-container").masonry
		  itemSelector: ".masonry-rushee"
		  gutterWidth: 25


	# Triggers 'like' operation on Rushee page
	$('main#Rushee section.rushee-info ul.rushee-stats li:first-child').click ->
		$('main#Rushee section.rushee-info ul.rushee-stats li:first-child div.rushee-like a')[0].click()


	# Handles rushee ordering based on select option
	$('main#Rushees section:first-child select').change ->
		selection = $('main#Rushees section:first-child select option:selected').attr('value')
		window.location.href = "/" + selection;


	# Brother like hover animation
	$('main#Rushee section.rushee-info div.brother-like span').hide()
	$('main#Rushee section.rushee-info div.brother-like').mouseenter ->
		$(this).children('img').css('opacity', '0.6')
		$(this).children('span').show()
	$('main#Rushee section.rushee-info div.brother-like').mouseleave ->
		$(this).children('img').css('opacity', '1.0')
		$(this).children('span').hide()

	$('main#Rushee section.rushee-info div.brother-like-see-all span').hide()
	$('main#Rushee section.rushee-info div.brother-like-see-all').mouseenter ->
		$(this).children('i').css('opacity', '0.6')
		$(this).children('span').show()
	$('main#Rushee section.rushee-info div.brother-like-see-all').mouseleave ->
		$(this).children('i').css('opacity', '1.0')
		$(this).children('span').hide()


	# Rushee comments section fit to screen
	leftHeight = $('main#Rushee section.rushee-info').height()
	$('main#Rushee section.rushee-info').imagesLoaded ->
		leftHeight = $('main#Rushee section.rushee-info').height()
		$('main#Rushee section.rushee-comments div.comments-wrapper').css('height', leftHeight - 155)


	# Rushee likes modal
	$('main#Rushee section.rushee-info div.brother-likes-container div.brother-like-see-all').click ->
		windowHeight = $(window).height()
		$('main#Rushee section.rushee-likes-modal').height(windowHeight)
		paddingHeight = (windowHeight - 450) / 2
		$('main#Rushee section.rushee-likes-modal div.modal-content').css('margin-top', paddingHeight)
		$('body').addClass('modal-open')


		$('main#Rushee section.rushee-likes-modal').show()


		$('.modal-brother-likes').imagesLoaded ->

			$('.modal-brother-like').each ->
				width = $(this).children().width()
				height = $(this).children().height()
				console.log(width)
				console.log(height)
				if width > height
					$(this).children().addClass('landscape')
				else
					$(this).children().addClass('portrait')


			$(".modal-brother-likes").masonry
			  itemSelector: ".modal-brother-like"
			  gutterWidth: 10




