var loc_re = /^\/(?!data\/)[A-Za-z0-9\-+\/]+$/;

$(document).ready(function() {

    // Current location
    var currentLocation = document.location.pathname;

    /**
     * Scan links to make them dynamic.
     */
    var makeDynamicLinks = function(selection) {
	selection
	    .filter(function(i) { return loc_re.test($(this).attr("href")); })
            .click(function() {
		switchTo($(this).attr("href"), true);
		return false;
	    });
    };

    /**
     * Display an internal content in the main <article/> with AJAX.
     */
    var switchTo = function(page, saveHistory) {
	console.log("switching to", page);
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
	    $('html, body').animate({scrollTop: 0});
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
	console.log("popstate to", loc, currentLocation);
	if (loc != currentLocation && loc_re.test(loc))
	    switchTo(loc, false);
    });

    /**
     * Smooth scrolling to local hash targets.
     *
    $(window).bind("hashchange", function(event) {
	console.log("hashhchange", document.location);
	console.log(document.location.hash);
	// Search for the target
	var hash = document.location.hash;
	var targets = $(hash+", a[name='"+hash.substring(1)+"']");
	// If found, jusmp to it
	if (targets.length) {
	    var target = targets.first();
	    console.log("target found:", target);
	    event.preventDefault();
	    $('html, body').animate({scrollTop: target.offset().top},
				    1000);
	    return true;
	}
    });*/

    // Create initial AJAX links
    makeDynamicLinks($("a[href]"));
});
