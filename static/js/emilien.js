var loc_re = /^\/(?!data\/)[A-Za-z0-9\-+\/]+$/;

$(document).ready(function() {

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
	$("article").fadeTo("fast", 0.02, function() {
	    // Update the welcome class
	    if (page == "/welcome")
		$("#content").addClass("welcome");
	    else
		$("#content").removeClass("welcome");
	    // Load the new page content
	    $("article").load("/parts"+page+".html", function() {
		// Show content
		$(this).fadeTo("slow", 1.0);
		// Update webpage title
		$(document).prop('title',
				 $(this).find("h1").text() + " - Émilien Tlapale");
		// Make new AJAX links
		makeDynamicLinks($(this).find("a[href]"));
	    });
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
	if (loc_re.test(loc))
	    switchTo(loc, false);
    });

    // Create initial AJAX links
    makeDynamicLinks($("a[href]"));
});
