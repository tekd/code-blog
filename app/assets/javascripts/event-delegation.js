$(function(){

$( ".event-delegation-1 ul li" ).on( "click",  function( event ) {
event.preventDefault();
     $( this ).css("color","red");
});

$(".add-list-item-1").on("click", function (event) {
    event.preventDefault();
   $('.event-delegation-1 ul').append("<li>New Item - this won't turn red when you click on it</li>");

});

  $( ".event-delegation-2 ul" ).on( "click","li", function( event ) {
    event.preventDefault();
    $( this ).css("color","purple");
  });

$(".add-list-item-2").on("click", function (event) {
    event.preventDefault();
console.log("hello");
   $('.event-delegation-2 ul').append("<li>New Item - this will turn purple when you click on it</li>");

});



})