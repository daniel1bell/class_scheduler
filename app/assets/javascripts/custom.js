var myApp = myApp || {};

myApp.toggleNew = function() {
  $('#dash_new_booking_port').slideToggle("slow")
}

myApp.setup = function() {
  $('#new_bookings_button').on('click', myApp.toggleNew);
}

$(myApp.setup);