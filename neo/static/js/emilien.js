$(document).ready(function() {
    console.log("Document ready!");

    $("#research .topic-spanner").click(function() {
	console.log("topic-spanner of #research clicked!");

	// Remove previous content
	$("#content").removeClass("welcome");
	$("img").remove();
	$("#intro").remove();
	$(".spacer").remove();
	$("#main-pages").remove();
	$("#contact").remove();

	// Show new content
	$("h1").text("Research");
	$("#content").append("<p>Hello world, this is a very long test to show how it will fit in the new design.</p>");

	// Show the navigation bar
	$("#navbar").css("display", "block");

	return false;
    });
});
