var loc_re = /^\/(?!data\/)[A-Za-z0-9\-+\/]+$/;
var hsh_re = /^#.+$/;

$(document).ready(function() {

    // Current location
    var currentLocation = document.location.pathname;

    /**
     * Scan links to make them dynamic.
     */
    var makeDynamicLinks = function(selection) {
	// AJAX page changes
	selection
	    .filter(function(i) { return loc_re.test($(this).attr("href")); })
            .click(function() {
		switchTo($(this).attr("href"), true);
		return false;
	    });
	// Animated scrolls
	selection
	    .filter(function(i) { return hsh_re.test($(this).attr("href")); })
	    .click(function() {
		// Search for the target
		var hash = $(this).attr("href");
		var targets = $(hash+", a[name='"+hash.substring(1)+"']");
		// If found, jump to it
		if (targets.length) {
		    var tgt = targets.first();
		    $("html, body").animate({scrollTop: tgt.offset().top});
		    history.pushState(null, null, currentLocation+hash);
		    return false;
		}
	    });
    };

    /**
     * Display an internal content in the main <article/> with AJAX.
     */
    var switchTo = function(page, saveHistory) {
	$("article").fadeTo("fast", 0.02, function() {
	    // Update the welcome class
	    if (page == "/welcome")
		$("#content").addClass("welcome");
	    else
		$("#content").removeClass("welcome");
	    // Load the new page content
	    $("article").load("/parts"+page+".html", function() {
		// Save the current location
		currentLocation = page;
		// Show content
		$(this).fadeTo("slow", 1.0);
		// Update webpage title
		$(document).prop('title',
				 $(this).find("h1").text() + " - Émilien Tlapale");
		// Make new AJAX links
		makeDynamicLinks($(this).find("a[href]"));
	    });
	    // Scroll to the top
	    $("html, body").animate({scrollTop: 0});
	    // Save in the history
	    if (saveHistory)
		history.pushState(null, null, page);
	});
    };

    /**
     * Browser history callback to handle AJAX links.
     */
    $(window).bind("popstate", function(event) {
	var loc = document.location.pathname;
	if (loc_re.test(loc)) {
	    // Page change
	    if (loc != currentLocation) {
		switchTo(loc, false);
	    }
	    // Hash change, seems to be impossible to
	    // scroll with animation yet:
	    // http://stackoverflow.com/questions/10742422/prevent-browser-scroll-on-html5-history-popstate#12045150
	    /*else {
	    }*/
	}
	else if (loc == "/") {
	    switchTo("/welcome", false);
	}
    });

    // Create initial AJAX links
    makeDynamicLinks($("a[href]"));
});
