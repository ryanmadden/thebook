$ ->







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


	# Rushee comments image sizing
	$('main#Rushee section.rushee-comments div.comments-wrapper').imagesLoaded ->
		$('main#Rushee section.rushee-comments div.comments-wrapper div.user-comment').each ->
			width = $(this).find('img').width()
			height = $(this).find('img').height()
			if width > height
				$(this).find('img').addClass('landscape')
			else
				$(this).find('img').addClass('portrait')


	# Rushee likes in info panel sizing
	$('main#Rushee section.rushee-info div.brother-likes-container').imagesLoaded ->
		$('main#Rushee section.rushee-info div.brother-likes-container div.brother-like').each ->
			width = $(this).children().width()
			height = $(this).children().height()
			if width > height
				$(this).children().addClass('landscape')
			else
				$(this).children().addClass('portrait')


	# Rushee likes modal
	$('main#Rushee section.rushee-info div.brother-likes-container div.brother-like-see-all').click ->
		windowHeight = $(window).height()
		$('main#Rushee section.rushee-likes-modal').height(windowHeight)
		paddingHeight = (windowHeight - 450) / 2
		$('main#Rushee section.rushee-likes-modal div.modal-content').css('margin-top', paddingHeight)
		$('body').addClass('modal-open')

		$('main#Rushee section.rushee-likes-modal').show()

		$(document).mouseup (e) ->
		  container = $('main#Rushee section.rushee-likes-modal div.modal-content')
		  overlay = $('main#Rushee section.rushee-likes-modal')
		  overlay.hide()  if not container.is(e.target) and container.has(e.target).length is 0
		  $('body').removeClass('modal-open')
		  return

		$('.modal-brother-likes').imagesLoaded ->

			$('.modal-brother-like').each ->
				width = $(this).children().width()
				height = $(this).children().height()
				if width > height
					$(this).children().addClass('landscape')
				else
					$(this).children().addClass('portrait')


			$(".modal-brother-likes").masonry
			  itemSelector: ".modal-brother-like"
			  gutterWidth: 7



