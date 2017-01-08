$(document).ready(function() {
  
  var stack1 = $('#stack1');
  
  stack1.removeClass('start');
  
  stack1.hammer().on('tap', function(event) {
    stack1.addClass('hover');
    event.stopPropagation();
  });
  
  
  $(document).hammer().on('tap', function(event) {
    stack1.removeClass('hover');
    $('.card').removeClass('hover');
  });
  
  $('.card').hammer().on('tap', function(event) {
      $('.card').removeClass('hover');
      $(this).addClass('hover');
  });
});