(function ($) {
	"use strict"

	$(document).ready(function() {

		if ($('#back-to-top').length) {
		    var scrollTrigger = 100, // px
		        backToTop = function () {
		            var scrollTop = $(window).scrollTop();
		            if (scrollTop > scrollTrigger) {
		                $('#back-to-top').addClass('show');
		            } else {
		                $('#back-to-top').removeClass('show');
		            }
		        };
		    backToTop();
		    $(window).on('scroll', function () {
		        backToTop();
		    });
		    $('#back-to-top').on('click', function (e) {
		        e.preventDefault();
		        $('html,body').animate({
		            scrollTop: 0
		        }, 700);
		    });
		}

		// =============================================
		// Page Loader
		// =============================================
		$('.page-loader').delay(500).fadeOut(500);	
		
		// =============================================
		// WOW text animated Loader
		// =============================================
		jQuery(function($) {
		   new WOW().init();
		});
		

		/*====================================
		Fixed Header
		======================================*/
		$(window).bind('scroll', function() {
			var navHeight = $(window).height() - 580;
			if ($(window).scrollTop() > navHeight) {
				$('.header-sticky').addClass('on');
			} else {
				$('.header-sticky').removeClass('on');
			}
		});

		// =============================================
		// Menu
		// =============================================
		var RedQ = {
			redQ_init : function() {
				RedQ.redQ_small_submenu();
			},
			redQ_small_submenu: function() {
				var sel = $('li.dropdown ul.sub-menu li.dropdown');
				sel.addClass('has-caret');
				sel.append('<span class="sub-caret fa fa-caret-right"></span>');
			},
			redQ_navbar_toggle: function() {
			},
		};

		RedQ.redQ_init();
			$('.navbar-toggle').click(function(e){
	
			e.preventDefault();
			$('.collapse.navbar-collapse').addClass('in');
	
			$('body').addClass('mobile-menu-open');
			$('.collapse.navbar-collapse').show().prop('id', 'mobile-menu-wrap');
	
		});

		$('.mobile-menu-close').click(function(e){
			e.preventDefault();
			$('body').removeClass('mobile-menu-open');
		});
		$( window ).resize(function() {
			var width = $(window).width();
	
			if ((width>=768)) {
				$('body').removeClass('mobile-menu-open');
				$('.collapse.navbar-collapse.in').removeAttr('id');
				$('.collapse.navbar-collapse.in').removeClass('in');
	
			}
		});
	
		// =============================================
		// End
		// =============================================
	});

	}(jQuery));
	
	/*=================================
	ANCHORS
	===================================*/
	jQuery(document).ready(function(){
	  jQuery('.navbar-nav a[href*="#"]:not([href="#"])').bind('click',function () {
		var headerHeight;
		var hash    = this.hash;
		var idName  = hash.substring(1);    // get id name
		var alink   = this;                 // this button pressed
		// check if there is a section that had same id as the button pressed
		if ( jQuery('section [id*=' + idName + ']').length > 0 && jQuery(window).width() >= 751 ){
		  jQuery('.current').removeClass('current');
		  jQuery(alink).parent('li').addClass('current');
		}else{
		  jQuery('.current').removeClass('current');
		}
		if ( jQuery(window).width() >= 751 ) {
		  headerHeight = jQuery('.navbar-fixed-top').height();
		} else {
		  headerHeight = 0;
		}
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
		  var target = jQuery(this.hash);
		  target = target.length ? target : jQuery('[name=' + this.hash.slice(1) +']');
		  if (target.length) {
			jQuery('html,body').animate({
			  scrollTop: target.offset().top - headerHeight - 93
			}, 1200);
			return false;
		  }
		}
	  });
	});

	jQuery(document).ready(function(){
		var headerHeight;
		jQuery('.current').removeClass('current');
		jQuery('.navbar-nav a[href$="' + window.location.hash + '"]').parent('li').addClass('current');
		if ( jQuery(window).width() >= 751 ) {
		  headerHeight = jQuery('.navbar-fixed-top').height();
		} else {
		  headerHeight = 0;
		}
		if (location.pathname.replace(/^\//,'') == window.location.pathname.replace(/^\//,'') && location.hostname == window.location.hostname) {
		  var target = jQuery(window.location.hash);
		  if (target.length) {
			jQuery('html,body').animate({
			  scrollTop: target.offset().top - headerHeight - 93
			}, 1200);
			return false;
		  }
		}
	});