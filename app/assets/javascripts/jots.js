// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function ()
{


  var h = [];
  var arr = $("div.thumbnail").children("div.img");
  var arr1 = $("div.thumbnail").children("div.caption");


  jQuery.each(arr, function(index, value){
      h.push($(this).height());
  });
  jQuery.each(arr1, function(index,value){
    $(this).css("height",515-104-h[index]);
  });
});
