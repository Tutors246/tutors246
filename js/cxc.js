$('#testimonial').ready(function () {
  //rotation speed and timer
  var speed = 5000;
  
  var run = setInterval(rotate, speed);
  var textSlides = $('.textslide');
  var textContainer = $('#textslides ul');
  var elm = textContainer.find(':first-child').prop("tagName");
  var item_width = textContainer.width();
  var textPrevious = 'textprev'; //id of previous button
  var textNext = 'textnext'; //id of next button
  textSlides.width(item_width); //set the slides to the correct pixel width
  textContainer.parent().width(item_width);
  textContainer.width(textSlides.length * item_width); //set the slides container to the correct total width
  textContainer.find(elm + ':first').before(textContainer.find(elm + ':last'));
  resetSlides();
  
  
  //if user clicked on prev button
  
  $('#buttons a').click(function (e) {
    //slide the item
    
    if (textContainer.is(':animated')) {
      return false;
    }
    if (e.target.id == textPrevious) {
      textContainer.stop().animate({
        'left': 0
      }, 1500, function () {
        textContainer.find(elm + ':first').before(textContainer.find(elm + ':last'));
        resetSlides();
      });
    }
    
    if (e.target.id == textNext) {
      textContainer.stop().animate({
        'left': item_width * -2
      }, 1500, function () {
        textContainer.find(elm + ':last').after(textContainer.find(elm + ':first'));
        resetSlides();
      });
    }
    
    //cancel the link behavior      
    return false;
    
  });
  
  //if mouse hover, pause the auto rotation, otherwise rotate it  
  textContainer.parent().mouseenter(function () {
    clearInterval(run);
  }).mouseleave(function () {
    run = setInterval(rotate, speed);
  });
  
  
  function resetSlides() {
    //and adjust the container so current is in the frame
    textContainer.css({
      'left': -1 * item_width
    });
  }
  
});
//a simple function to click next link
//a timer will call this function, and the rotation will begin

function rotate() {
  $('#textnext').click();
}
