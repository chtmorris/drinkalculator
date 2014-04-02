// ------- TRIP EXPLANATIONS -------

$(document).ready(function(){
  var trip = new Trip([
   {
       sel : $('#drinks_table'),
       position : 'n',
       content : 'Click on each row to reveal more data',
       delay : 4000,
   }], {
   });

  $(document).ready(function() {
    trip.start();
  });
});

// ------- BUTTONS -------

$("#totals_button").click(function(){
  $("#totalschart").removeClass("hide");
  $("#costchart").addClass("hide");
  $("#unitchart").addClass("hide");
});

$("#cost_button").click(function(){
  $("#totalschart").addClass("hide");
  $("#costchart").removeClass("hide");
  $("#unitchart").addClass("hide");
});

$("#unit_button").click(function(){
  $("#totalschart").addClass("hide");
  $("#costchart").addClass("hide");
  $("#unitchart").removeClass("hide");
});


// ------- TABLE -------

$(document).ready(function(){
    $(".collapsey").nextUntil('tr.collapsey').slideToggle(100).promise()
  });

  $('.collapsey').click(function () {
    $(this).nextUntil('tr.collapsey').slideToggle(100).promise()
    $(".click_notice").addClass("hide");
  });

  $("html").click(function(){
    $(".row").removeClass("blur");
    $(".row").removeClass("hide");
    $(".main").removeClass("persp");
    $(".main").removeClass("mousemove_rotate");
    $(".click_notice").addClass("blur");
  });


// ------- GRAPH -------


// ------- DRUNK -------

$(document).mousemove(function(e) {
  $('.mousemove_rotate').css('transform', 'rotateX(0deg) rotateY(0deg)');

  var rotate_X;
  var rotate_Y;
  var invert = false;

  if (invert) {
    rotate_X = e.pageX;
    rotate_Y = e.pageY;
  } else if (!invert) {
    rotate_X = e.pageX;
    rotate_Y = -e.pageY;
  }

$('.mousemove_rotate').css('transform', 'rotateX(' + rotate_Y + 'deg) rotateY(' + rotate_X + 'deg)')
});

// $("#costchart").addClass("hide");
// $("#unitchart").addClass("hide");