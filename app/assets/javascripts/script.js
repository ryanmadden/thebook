$(document).ready(function() {

	/*
	 * Functions
	 */

	// Insantiate/declare global variables
	//   - Set navbar animation variables
	//   - Hide brother names in likes row
	//   - Initializes like button class
	var setGlobalsAndInitiate = function() {

		// Navbar animation
		animated = false;
		navPosition = $('header').offset().top

		// Brother likes in rushee page
		$('div.brother-likes-container span').hide();

		// Sets like button as liked or not
		if( $('div.rushee-like a').hasClass('liked') ) {
			$('ul.rushee-stats li:first-child').addClass('liked');
		}
	};
	// Redirect to correct rushee page
	var redirectToRushee = function(rushee) {
		// placeholder to minimize
		window.location = rushee.find('a').attr('href');
	};
	// Initiate masonry
	var initiateMasonry = function(container, item, gutters) {
		container.masonry({
			itemSelector: item,
			gutterWidth: gutters
		});
	};
	// Change like button color, increment likes, activate remote link_to
	var processRusheeLike = function() {
		if( $('ul.rushee-stats li:first-child').hasClass('liked') ) {
			$('ul.rushee-stats li:first-child').removeClass('liked');
		}
		else {
			$('ul.rushee-stats li:first-child').addClass('liked');
		}
	};
	// Redirect to correct rushee order
	var orderRushees = function(selection) {
		// placeholder to minimize
		window.location.href = "/" + selection;
	};
	// Show text (brother like names, see all)
	var showText = function(div, container, show) {
		div.children(container).css('display', 'block');
		div.children(show).show();
	};
	// Hide text (brother like names, see all)
	var hideText = function(div, container, hide) {
		div.children(container).css('display', 'none');;
		div.children(show).hide();
	};
	// Set comments section to equal height as info section
	var fitCommentsToInfo = function() {
		var infoHeight = $('section.rushee-info').height();
		$('div.comments-wrapper').height(infoHeight - 155);
	};
	// Set element to class 'landscape' or 'portrait' for square sizing
	var setLandscapeOrPortraitClass = function(element, selector) {
		width = element.find(selector).width();
		height = element.find(selector).height();
		if( width > height ) {
			element.find(selector).addClass('landscape');
		}
		else {
			element.find(selector).addClass('portrait');
		}
	};
	// Set up and open modal
	var setupAndOpenModal = function() {
		// Set modal height, center it vertically
		var windowHeight = $(window).height();
		$('section.rushee-modal').height(windowHeight);
		var marginHeight = (windowHeight - 450) / 2;
		$('div.modal-content').css('margin-top', marginHeight);

		// Disable scrolling
		$('body').addClass('modal-open');
		$('section.rushee-modal').show();

		// User clicks outside modal content -> close modal
		$(document).mouseup(function(e) {
			var container = $('div.modal-content');
			var overlay = $('section.rushee-modal');
			if( !container.is(e.target) && container.has(e.target).length == 0 ) {
				overlay.hide();
				$('body').removeClass('modal-open');
				return;
			}
		});

		// Modal likes images load -> Set element classes for square sizing, initiate masonry
		$('div.modal-likes').imagesLoaded(function() {
			$('div.modal-like').each(function() {
				var element = $(this);
				var selector = 'img';
				setLandscapeOrPortraitClass(element, selector);
			});

			var container = $('.modal-likes');
			var item = '.modal-like';
			var gutters = 10;
			initiateMasonry(container, item, gutters)
		});
	};
	// Open/close mobile navbar
	var toggleMobileNavbar = function() {
		if( $('header nav nav').is(':visible') ) {
			$('header nav nav').hide();
		}
		else {
			$('header nav nav').show();
		}
	};
	// Set rushees news section height to window height minus header
	var setRusheesNewsHeight = function() {
		var windowHeight = $(window).height();
		var headerHeight = $('header').height();
		$('main#Rushees section#rushees-news').height(windowHeight - headerHeight);
	};


	/*
	 * Initiation, globals declaration
	 */

	var animated, navPosition;
	setGlobalsAndInitiate();
	setRusheesNewsHeight();


	/*
	 * Events
	 */

	// Click on rushee in rushees page -> redirect to correct rushee
	$('#Rushees div.masonry-rushee').click(function() {
		var rushee = $(this)
		redirectToRushee(rushee);
	});

	// Click on rushee in stats page -> redirect to correct rushee
	$('#Stats div.rushee-list').click(function() {
		var rushee = $(this)
		redirectToRushee(rushee);
	});

	//Add number to bids given on stats page, fix image showing bug
	$('#stats-list').imagesLoaded(function() {
		$('div.rushee-image-wrapper img').each(function() {
			var element = $(this).parent();
			var selector = 'img';
			setLandscapeOrPortraitClass(element, selector);
		});
		$('#bidtitle').text($('#bidtitle').text() + ' (' + $('#bidlist .rushee-list').length + ')');
	});

	$('li.news-item').click(function() {
		console.log($(this).find('a').html());
		window.location = $(this).find('a').html();
	});
	// Images load -> initiate masonry
	$('div#Rushees #masonry-container').imagesLoaded(function() {
		var container = $('#masonry-container');
		var item = '.masonry-rushee';
		var gutters = 25;
		initiateMasonry(container, item, gutters)
	});
	// Click rushee like button -> increment likes, activate remote link_to
	$('ul.rushee-stats li:first-child').click(function() {
		// placeholder to minimize
		processRusheeLike();
	});
	// Change select-option selection -> redirect to correct rushee ordering
	$('main#Rushees select').change(function() {
		selection = $(this).children('option:selected').attr('value');
		orderRushees(selection);
	});
	// Hover over brother like -> show name
	$('div.brother-like').mouseenter(function() {
		div = $(this);
		container = 'div.brother-likes-image-overlay';
		show = 'span';
		showText(div, container, show);
	});
	// Stop hovering over brother like -> hide name
	$('div.brother-like').mouseleave(function() {
		div = $(this);
		container = 'div.brother-likes-image-overlay';
		hide = 'span';
		hideText(div, container, hide);
	});
	// Hover over see all likes div -> show see all
	$('div.brother-like-see-all').mouseenter(function() {
		div = $(this);
		container = 'div.brother-likes-image-overlay';
		show = 'span';
		showText(div, container, show);
	});
	// Stop hovering over see all likes div -> hide see all
	$('div.brother-like-see-all').mouseleave(function() {
		div = $(this);
		container = 'div.brother-likes-image-overlay';
		hide = 'span';
		hideText(div, container, hide);
	});
	// Rushee info section images load -> Set comments section to equal height
	$('section.rushee-info').imagesLoaded(function() {
		// placeholder to minimize
		fitCommentsToInfo();
	});
	// Comments wrapper images load -> set element classes for square sizing
	$('div.comments-wrapper').imagesLoaded(function() {
		$('div.user-comment').each(function() {
			var element = $(this);
			var selector = 'img';
			setLandscapeOrPortraitClass(element, selector);
		});
	});
	// Brother likes container images load -> set element classes for square sizing
	$('div.brother-likes-container').imagesLoaded(function() {
		$('div.brother-like').each(function() {
			var element = $(this);
			var selector = 'img';
			setLandscapeOrPortraitClass(element, selector);
		});
	});
	$('ul.rushees-news-list').imagesLoaded(function() {
		$('li.news-item').each(function() {
			var element = $(this).children($('div.news-comment-image-wrapper'));
			var selector = 'img';
			setLandscapeOrPortraitClass(element, selector);
		});
	});
	// Click see all brother likes -> Set up, open modal
	$('div.brother-like-see-all').click(function() {
		// placeholder to minimize
		setupAndOpenModal();
	});
	// Click header menu -> toggle mobile navbar menu
	$('header nav > i').click(function() {
		// placeholder for minimize
		toggleMobileNavbar();
	});
	$('ul.rushee-stats li:first-child').click(function() {

		var address = $(this).find('a').attr('href');
		window.location.replace(address);
	});

});