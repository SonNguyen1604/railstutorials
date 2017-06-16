$(document).ready(function(){
  $('.search_box').on('keyup', function(){
    $.ajax({
      type: 'GET',
      dateType: 'json',
      url: '/users',
      data: {name: $('.search_box').val(), search:true},
      success: function(data){
        $('.users-list').html(data.html_search);
      }
    })
  })
})
