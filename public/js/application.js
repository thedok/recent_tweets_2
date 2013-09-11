$(function(){
  $('form').on('submit', function(event){
    event.preventDefault();
    var formData = $(this).serialize();
      console.log(formData)

    $.ajax({
      url: '/tweet',
      data: formData
    }).done( function(server_response){
      console.log(server_response)
      $('div').append('Your tweet was sent')
    }).fail( function(failed_response){
        console.log(failed_response)
        $('div').append('Your request failed')
    })

  })
});

// $(document).ready(function() {

// 	var userName = $('#tweeter').data('name')
// 	console.log(userName)

// $(document).ajaxSend(function(r, s) {
//     $("#spinner").show();
// });

// $(document).ajaxStop(function(r, s) {
//     $("#spinner").fadeOut("slow");
// });

//   $.ajax({
//   	url: '/test',
//   	type: 'get',
//   	data: {'username' : userName}
//   }).done( function(response_data){
//   		$('.container').append(response_data);
//   		console.log(response_data);
//   })
// });




