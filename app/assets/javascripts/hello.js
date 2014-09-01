$(document).ready(function() {

	/*
	 * Global declaration
	 */
	var animated, navPosition;


	/*
	 * Functions
	 */

	// Insantiate/declare global variables
	var setGlobals = function() {
		animated = false;
		navPosition = $('header').offset().top
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
		console.log('redirecting');
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

	}


	/*
	 * Events
	 */

	// Scroll -> animate navbar
	$(window).scroll(function() {
		console.log('Animating navbar');
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
		$('div.rushee-like a')[0].click();
	});


});