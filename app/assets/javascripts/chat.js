$(document).on("turbolinks:load", function() {

  function buildHTML(chat) {
    var html = '<li class="chat">' + '<div class="chat_content">' + '<h3>' + chat.name + '</h3>' + '<h5>' + chat.time + '</h5>' + '<h4>' + chat.body + '</h4>' + '</div>' + '</li>'
    return html;
  }

  $('form').on ('submit', function(e) {
    var chat = $(this);
    e.preventDefault();
    var formdata = new FormData(chat[0]);
    console.log(formdata);
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
      chat.get(0).reset()
    })
    .fail(function() {
      alert('error');
    });
  });
});
