jQuery(document).ready(function() {

    /*
        Background slideshow FIXME: change the images and the path
    */
    $('.top-content').backstretch("assets/img/backgrounds/wave-pattern-3.png");

    $('#top-navbar-1').on('shown.bs.collapse', function(){
    	$('.top-content').backstretch("resize");
    });
    $('#top-navbar-1').on('hidden.bs.collapse', function(){
    	$('.top-content').backstretch("resize");
    });

    /*
        Wow
    */
    new WOW().init();

});
