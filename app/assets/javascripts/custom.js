var myApp = myApp || {};

myApp.toggleNew = function() {
  $('#dash_new_booking_port').slideToggle("slow")
}

myApp.calendarDateHandler = function(event) {
  event.preventDefault();

  var ajaxOptions = {
  url: "/",
  type: 'GET',
    
  }
}

myApp.setup = function() {
  $('#new_bookings_button').on('click', myApp.toggleNew);
  $('#calendar_month_forward').on('click', myApp.calendarDateHandler);

}

$(myApp.setup);