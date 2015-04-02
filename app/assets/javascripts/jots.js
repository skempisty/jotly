// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){

  $(".thumbnail").each(function(){

    var $this = $(this);
    var $img = $this.find('img');

    $img.load(function(){
      // console.log("$img.height()", $img.height());

      var height = $img.height();
      $this.find('.caption').css("height", 515 - 104 - height);
    });

  });
});
