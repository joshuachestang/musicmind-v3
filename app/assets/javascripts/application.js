// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//= require jquery
//= require jquery_ujs

//= require jquery.fileupload
//= require jquery.fileupload-fp
//= require jquery.fileupload-ui
//= require jquery.ui.widget
//= require jquery.iframe-transport
//= require jquery_ujs_multipart_xhr
//= require locale
//= require main
//= require fan_bases
//= require jquery.jplayer.min
//= require jplayer.playlist.min
//= require twitter/bootstrap
//= require jquery_nested_form
//= require jquery.sausage
//= require_tree .

$(document).ready(function(){
    $("#jquery_jplayer_1").jPlayer({
        swfPath: "/app/assets/jplayerflash",
        supplied: "mp3",
        wmode: "window"
    });
    $('a.play').click(function(e) {
        e.preventDefault();
        $("#jquery_jplayer_1")
            .jPlayer("setMedia", {mp3: this.href })
            .jPlayer("play");
      var songid = $(e.target).attr('data-id');
      var songtype = $(e.target).attr('data-type');
      $.ajax({
      url: '/create_listen.json',
      data: { songid: songid, songtype: songtype },
      async: false
      });
    });
});


//back buttons, bookmark urls for ajax links
if (history && history.pushState) {
  $(function() {
    $("a#page-link").live("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}

if (history && history.pushState) {
  $(function() {
    $("#page-link").live("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}


//twitter button
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");


//floating cart in side bar
$(document).ready(function () {  
  var top = $('#cart').offset().top - parseInt($('#cart').css('margin-top').replace(/auto/, 0));
  $(window).scroll(function (event) {
    // what the y position of the scroll is
    var y = $(this).scrollTop();
  
    // whether that's below the form
    if (y >= top) {
      // if so, ad the fixed class
      $('#cart').addClass('fixed');
    } else {
      // otherwise remove it
      $('#cart').removeClass('fixed');
    }
  });
});


$(document).ready(function () {  
  var top = $('#main-nav').offset().top - parseInt($('#main-nav').css('margin-top').replace(/auto/, 0));
  $(window).scroll(function (event) {
    // what the y position of the scroll is
    var y = $(this).scrollTop();
  
    // whether that's below the form
    if (y >= top) {
      // if so, ad the fixed class
      $('#main-nav').addClass('fixed');
    } else {
      // otherwise remove it
      $('#main-nav').removeClass('fixed');
    }
  });
});








$(function(){ $(document).foundation(); });
