$(document).ready(function() {

	/*
	 * Functions
	 */

	// Insantiate/declare global variables
	var setGlobalsAndInitiate = function() {

		// Navbar animation
		animated = false;
		navPosition = $('header').offset().top

		// Brother likes in rushee page
		$('div.brother-likes-container span').hide();
	};
	// Animate navbar on scroll
	var animateNavbar = function() {
		var newPosition = $('header').offset().top
		if(newPosition && !animated) {
			$('header > nav').animate({
				padding: "10px 0"
			}, {
				duration: 400,
				queue: false
			});
			animated = true;
		}
		else if(!newPosition && animated) {
			$('header > nav').animate({
				padding: "20px 0"
			}, {
				duration: 400,
				queue: false
			});
			animated = false;
		}
		navPosition = newPosition
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
	// Increment likes, activate remote link_to
	var processRusheeLike = function() {
		// placeholder to minimize
		$('div.rushee-like a')[0].click();
	};
	// Redirect to correct rushee order
	var orderRushees = function(selection) {
		// placeholder to minimize
		window.location.href = "/" + selection;
	};
	// Show text (brother like names, see all)
	var showText = function(div, container, show) {
		div.children(container).css('opacity', '0.6')
		div.children(show).show()
	};
	// Hide text (brother like names, see all)
	var hideText = function(div, container, hide) {
		div.children(container).css('opacity', '1.0')
		div.children(show).hide()
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
			var gutters = 7;
			initiateMasonry(container, item, gutters)
		});
	};


	/*
	 * Initiation, globals declaration
	 */

	var animated, navPosition;
	setGlobalsAndInitiate();


	/*
	 * Events
	 */

	// Scroll -> animate navbar
	$(window).scroll(function() {
		// placeholder to minimize
		animateNavbar();
	});
	// Click on rushee in rushees page -> redirect to correct rushee
	$('div.masonry-rushee').click(function() {
		var rushee = $(this)
		redirectToRushee(rushee);
	});
	// Images load -> initiate masonry
	$('#masonry-container').imagesLoaded(function() {
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
		container = 'img';
		show = 'span';
		showText(div, container, show);
	});
	// Stop hovering over brother like -> hide name
	$('div.brother-like').mouseleave(function() {
		div = $(this);
		container = 'img';
		hide = 'span';
		hideText(div, container, hide);
	});
	// Hover over see all likes div -> show see all
	$('div.brother-like-see-all').mouseenter(function() {
		div = $(this);
		container = 'i';
		show = 'span';
		showText(div, container, show);
	});
	// Stop hovering over see all likes div -> hide see all
	$('div.brother-like-see-all').mouseleave(function() {
		div = $(this);
		container = 'i';
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
	// Click see all brother likes -> Set up, open modal
	$('div.brother-like-see-all').click(function() {
		// placeholder to minimize
		setupAndOpenModal();
	});

});