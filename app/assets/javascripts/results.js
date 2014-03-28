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
    $(".click_notice").addClass("blur");
  });

// $("#costchart").addClass("hide");
// $("#unitchart").addClass("hide");

// console.log('here')