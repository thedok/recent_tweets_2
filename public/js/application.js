$(document).ready(function() {

	var userName = $('#tweeter').data('name')
	console.log(userName)

$(document).ajaxSend(function(r, s) {
    $("#spinner").show();
});

$(document).ajaxStop(function(r, s) {
    $("#spinner").fadeOut("slow");
});

  $.ajax({
  	url: '/test',
  	type: 'get',
  	data: {'username' : userName}
  }).done( function(response_data){
  		$('.container').append(response_data);
  		console.log(response_data);
  })



});




