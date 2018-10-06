$.mobile = {};
$.mobile.support = {};
$.mobile.support.touch = "ontouchend" in document;

(function( $, window, undefined ) {
	var $document = $( document ),
			supportTouch = $.mobile.support.touch,
			scrollEvent = "touchmove scroll",
			touchStartEvent = supportTouch ? "touchstart" : "mousedown",
			touchStopEvent = supportTouch ? "touchend" : "mouseup",
			touchMoveEvent = supportTouch ? "touchmove" : "mousemove",
			touchCancelEvent = supportTouch ? "touchcancel" : "mousecancel"
			;

	// setup new event shortcuts
	$.each( ( "touchstart touchmove touchend " +
	"tap taphold tapmovestart tapmove tapmoveend" +
	"swipe swipeleft swiperight " +
	"scrollstart scrollstop" ).split( " " ), function( i, name ) {

		$.fn[ name ] = function( fn ) {
			return fn ? this.bind( name, fn ) : this.trigger( name );
		};

		// jQuery < 1.8
		if ( $.attrFn ) {
			$.attrFn[ name ] = true;
		}
	});

	function triggerCustomEvent( obj, eventType, event, bubble ) {
		var originalType = event.type;
		event.type = eventType;
		if ( bubble ) {
			$.event.trigger( event, undefined, obj );
		} else {
			$.event.dispatch.call( obj, event );
		}
		event.type = originalType;
	}

	function getEvent(event)
	{
		return event.originalEvent.touches ? event.originalEvent.touches[ 0 ] : event;
	}

	// also handles scrollstop
	$.event.special.tapmove = {

		enabled: true,
		setup: function() {
			var thisObject = this,
					$this = $( thisObject ),
					lastX, lastY,
					startX, startY,
					posHistory;

			$this.bind( touchStartEvent, function( event ) {

				if ( event.which && event.which !== 1 ) {
					return false;
				}

				var touchEvent = getEvent(event);

				var origTarget = touchEvent.target;

				triggerCustomEvent(thisObject, "tapmovestart", $.Event("tapmovestart", {target: origTarget }));

				startX = lastX = touchEvent.pageX;
				startY = lastY = touchEvent.pageY;

				posHistory = [{pageX: startX, pageY: startY, time: Date.now()}];

				//console.log("start: " + Date.now() + " " + window.performance.now() );

				function handleTouchMove( event )
				{
					var touchEvent = getEvent(event);

					var diffX = Math.abs( startX - touchEvent.pageX );
					var diffY = Math.abs( startY - touchEvent.pageY );

					if( diffX < 10 && diffY < 10 ) return;

					triggerCustomEvent(thisObject, "tapmove", $.Event("tapmove", {target: origTarget, diffX: lastX - touchEvent.pageX, diffY: lastY - touchEvent.pageY }));

					lastX = touchEvent.pageX;
					lastY= touchEvent.pageY;

					posHistory.push({pageX: lastX, pageY: lastY, time: Date.now()});
				}

				function handTouchEnd( event )
				{
					//console.log("end: " + Date.now() + " " + window.performance.now() );

					$document.unbind( touchMoveEvent, handleTouchMove )
							.unbind( touchStopEvent, handTouchEnd );
					$document.unbind( touchCancelEvent, handTouchEnd );

					var posEntry = posHistory[ posHistory.length - 1 ];
					var lastTime = posEntry.time;
					var lastX = posEntry.pageX;
					var lastY = posEntry.pageY;

					var accelerationX = 0;
					var accelerationY = 0;
					for( var i = posHistory.length - 1; i >= 0 ; i-- )
					{
						var posEntry = posHistory[i];
						var accelerationTime = lastTime - posEntry.time;
						if( accelerationTime >= 50 || i == 0 )
						{
							//console.log("stop at index: " + i)
							accelerationX = ( lastX - posEntry.pageX ) / accelerationTime;
							accelerationY = ( lastY - posEntry.pageY ) / accelerationTime;
							break;
						}
					}

					//console.log("lastTime: " + lastTime + " firstTime: " + posHistory[0].time + " totalTime: " + ( lastTime - posHistory[0].time ) + " totalSize: " + posHistory.length );
					//console.log(posHistory);

					triggerCustomEvent(thisObject, "tapmoveend", $.Event("tapmoveend", {target: origTarget, accelerationX: accelerationX, accelerationY: accelerationY }));
				}

				$document.bind( touchMoveEvent, handleTouchMove )
						.bind( touchStopEvent, handTouchEnd );
				$document.bind( touchCancelEvent, handTouchEnd );
			});
		},
		teardown: function() {
			$( this ).unbind();
		}
	}

	// also handles scrollstop
	$.event.special.scrollstart = {

		enabled: true,
		setup: function() {

			var thisObject = this,
					$this = $( thisObject ),
					scrolling,
					timer;

			function trigger( event, state ) {
				scrolling = state;
				triggerCustomEvent( thisObject, scrolling ? "scrollstart" : "scrollstop", event );
			}

			// iPhone triggers scroll after a small delay; use touchmove instead
			$this.bind( scrollEvent, function( event ) {

				if ( !$.event.special.scrollstart.enabled ) {
					return;
				}

				if ( !scrolling ) {
					trigger( event, true );
				}

				clearTimeout( timer );
				timer = setTimeout( function() {
					trigger( event, false );
				}, 50 );
			});
		},
		teardown: function() {
			$( this ).unbind( scrollEvent );
		}
	};

	// also handles taphold
	$.event.special.tap = {
		tapholdThreshold: 750,
		emitTapOnTaphold: true,
		setup: function() {
			var thisObject = this,
					$this = $( thisObject ),
					isTaphold = false,
					didScroll = false,
					startX, startY;

			$this.bind( touchStartEvent, function( event ) {
				isTaphold = false;
				didScroll = false;

				var touchEvent = getEvent(event);

				startX = touchEvent.pageX;
				startY= touchEvent.pageY;

				if ( event.which && event.which !== 1 ) {
					return false;
				}

				var origTarget = event.target,
						timer;

				function handleTouchMove( event )
				{
					var touchEvent = getEvent(event);

					var diffX = Math.abs( startX - touchEvent.pageX );
					var diffY = Math.abs( startY - touchEvent.pageY );

					if( diffX < 10 && diffY < 10 ) return;

					didScroll = true;
				}

				function handTouchEnd( event ) {

					clearTimeout( timer );

					if( !didScroll )
					{
						// ONLY trigger a 'tap' event if the start target is
						// the same as the stop target.
						if ( !isTaphold && origTarget === event.target ) {
							triggerCustomEvent( thisObject, "tap", event );
						} else if ( isTaphold ) {
							event.preventDefault();
						}
					}

					$this.unbind( touchMoveEvent, handleTouchMove )
							.unbind( touchStopEvent, handTouchEnd );
					$document.unbind( touchCancelEvent, handTouchEnd );
				}

				$this.bind( touchMoveEvent, handleTouchMove )
						.bind( touchStopEvent, handTouchEnd );
				$document.bind( touchCancelEvent, handTouchEnd );

				timer = setTimeout( function() {
					if( !didScroll )
					{
						if (!$.event.special.tap.emitTapOnTaphold) {
							isTaphold = true;
						}
						triggerCustomEvent(thisObject, "taphold", $.Event("taphold", {target: origTarget}));
					}
				}, $.event.special.tap.tapholdThreshold );
			});
		},
		teardown: function() {
			$( this ).unbind( touchStartEvent ).unbind( "vclick" ).unbind( touchMoveEvent ).unbind( touchStopEvent );
			$document.unbind( touchCancelEvent );
		}
	};

	// Also handles swipeleft, swiperight
	$.event.special.swipe = {

		// More than this horizontal displacement, and we will suppress scrolling.
		scrollSupressionThreshold: 30,

		// More time than this, and it isn't a swipe.
		durationThreshold: 1000,

		// Swipe horizontal displacement must be more than this.
		horizontalDistanceThreshold: 30,

		// Swipe vertical displacement must be less than this.
		verticalDistanceThreshold: 30,

		getLocation: function ( event ) {
			var winPageX = window.pageXOffset,
					winPageY = window.pageYOffset,
					x = event.clientX,
					y = event.clientY;

			if ( event.pageY === 0 && Math.floor( y ) > Math.floor( event.pageY ) ||
					event.pageX === 0 && Math.floor( x ) > Math.floor( event.pageX ) ) {

				// iOS4 clientX/clientY have the value that should have been
				// in pageX/pageY. While pageX/page/ have the value 0
				x = x - winPageX;
				y = y - winPageY;
			} else if ( y < ( event.pageY - winPageY) || x < ( event.pageX - winPageX ) ) {

				// Some Android browsers have totally bogus values for clientX/Y
				// when scrolling/zooming a page. Detectable since clientX/clientY
				// should never be smaller than pageX/pageY minus page scroll
				x = event.pageX - winPageX;
				y = event.pageY - winPageY;
			}

			return {
				x: x,
				y: y
			};
		},

		start: function( event ) {
			var data = getEvent(event),
					location = $.event.special.swipe.getLocation( data );
			return {
				time: ( new Date() ).getTime(),
				coords: [ location.x, location.y ],
				origin: $( event.target )
			};
		},

		stop: function( event ) {
			var data = getEvent(event),
					location = $.event.special.swipe.getLocation( data );
			return {
				time: ( new Date() ).getTime(),
				coords: [ location.x, location.y ]
			};
		},

		handleSwipe: function( start, stop, thisObject, origTarget ) {
			if ( stop.time - start.time < $.event.special.swipe.durationThreshold &&
					Math.abs( start.coords[ 0 ] - stop.coords[ 0 ] ) > $.event.special.swipe.horizontalDistanceThreshold &&
					Math.abs( start.coords[ 1 ] - stop.coords[ 1 ] ) < $.event.special.swipe.verticalDistanceThreshold ) {
				var direction = start.coords[0] > stop.coords[ 0 ] ? "swipeleft" : "swiperight";

				triggerCustomEvent( thisObject, "swipe", $.Event( "swipe", { target: origTarget, swipestart: start, swipestop: stop }), true );
				triggerCustomEvent( thisObject, direction,$.Event( direction, { target: origTarget, swipestart: start, swipestop: stop } ), true );
				return true;
			}
			return false;

		},

		// This serves as a flag to ensure that at most one swipe event event is
		// in work at any given time
		eventInProgress: false,

		setup: function() {
			var events,
					thisObject = this,
					$this = $( thisObject ),
					context = {};

			// Retrieve the events data for this element and add the swipe context
			events = $.data( this, "mobile-events" );
			if ( !events ) {
				events = { length: 0 };
				$.data( this, "mobile-events", events );
			}
			events.length++;
			events.swipe = context;

			context.start = function( event ) {

				// Bail if we're already working on a swipe event
				if ( $.event.special.swipe.eventInProgress ) {
					return;
				}
				$.event.special.swipe.eventInProgress = true;

				var stop,
						start = $.event.special.swipe.start( event ),
						origTarget = event.target,
						emitted = false;

				context.move = function( event ) {
					if ( !start || event.isDefaultPrevented() ) {
						return;
					}

					stop = $.event.special.swipe.stop( event );
					if ( !emitted ) {
						emitted = $.event.special.swipe.handleSwipe( start, stop, thisObject, origTarget );
						if ( emitted ) {

							// Reset the context to make way for the next swipe event
							$.event.special.swipe.eventInProgress = false;
						}
					}

					// disabled - otherwise we have a bad scrolling experience on iOS and safari
					// additionally - the scrolling prevention is handled by our own
					// prevent scrolling
					/*if ( Math.abs( start.coords[ 0 ] - stop.coords[ 0 ] ) > $.event.special.swipe.scrollSupressionThreshold ) {
						event.preventDefault();
					}*/
				};

				context.stop = function() {
					emitted = true;

					// Reset the context to make way for the next swipe event
					$.event.special.swipe.eventInProgress = false;
					$document.off( touchMoveEvent, context.move );
					context.move = null;
				};

				$document.on( touchMoveEvent, context.move )
						.one( touchStopEvent, context.stop );
			};

			$this.on( touchStartEvent, context.start );
		},

		teardown: function() {
			var events, context;

			events = $.data( this, "mobile-events" );
			if ( events ) {
				context = events.swipe;
				delete events.swipe;
				events.length--;
				if ( events.length === 0 ) {
					$.removeData( this, "mobile-events" );
				}
			}

			if ( context ) {
				if ( context.start ) {
					$( this ).off( touchStartEvent, context.start );
				}
				if ( context.move ) {
					$document.off( touchMoveEvent, context.move );
				}
				if ( context.stop ) {
					$document.off( touchStopEvent, context.stop );
				}
			}
		}
	};
	$.each({
		scrollstop: "scrollstart",
		taphold: "tap",
		swipeleft: "swipe.left",
		swiperight: "swipe.right"
	}, function( event, sourceEvent ) {

		$.event.special[ event ] = {
			setup: function() {
				$( this ).bind( sourceEvent, $.noop );
			},
			teardown: function() {
				$( this ).unbind( sourceEvent );
			}
		};
	});

})( jQuery, window );