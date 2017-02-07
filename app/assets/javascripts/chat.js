$(function() {

  function buildHTML(chat) {
    var html = '<li class="chat">' + '<div class="chat_content">' + '<h3>' + chat.user.name + '</h3>' + '<h5>' + chat.created_at + '</h5>' + '<h4>' + chat.body + '</h4>' + '</div>' + '</li>'
    return html;
  }

  $('form').on('submit', function(e) {
    var chat = $(this);
    e.preventDefault();
    $.ajax({
      type: 'POST',
      data: chat,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('ul.chats').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
