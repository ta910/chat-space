$(document).on("turbolinks:load", function() {

  function buildHTML(chat) {

    if (chat.image) {
      imageHtml = '<img src="' + chat.image + '">'
    }
    else {
      imageHtml = "";
    };

    var html =
      '<li class="chat">'
      + '<div class="chat_content">'
      + '<h3>' + chat.name + '</h3>'
      + '<h5>' + chat.time + '</h5>'
      + '<h4>' + chat.body + imageHtml + '</h4>'
      + '</div>'
      + '</li>'
    return html;
  }

  $('.new_chat').on ('submit', function(e) {
    var chat = $(this);
    e.preventDefault();
    var formdata = new FormData(chat[0]);
    $.ajax({
      type: 'POST',
      processData: false,
      contentType: false,
      data: formdata,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('ul.chats').append(html);
      chat[0].reset();
      $('input').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
    });
  });

  $('#chat_image').on('change', function(){
    $(this).parents('form#new_chat').submit();
  });
});
