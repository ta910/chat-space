$(document).on("turbolinks:load", function() {

  function goBottom() {
    $('.main_right_message').delay(100).animate({
      scrollTop: $('.main_right_message')[0].scrollHeight
    }, 'slow', 'swing');
  };

  function flash() {
    $(".alert_box").append("<div class='alert-notice'>メッセージが送信されました。</div>");
    $(".alert-notice").delay(100).fadeOut('slow');
  }

  function buildHTML(chat) {

    var imageHtml = ""

    if (chat.image) {
      imageHtml = '<img src="' + chat.image + '">'
    }

    var html =
      `<li class="chat">
        <div class="chat_content" data-id=${chat.id}>
          <h3>${chat.name}</h3>
          <h5>${chat.time}</h5>
          <h4>${chat.body}${imageHtml}</h4>
        </div>
       </li>`
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
      goBottom();
      flash();
    })
    .fail(function() {
      alert('error');
    });
  });

  $('#chat_image').on('change', function(){
    $(this).parents('form#new_chat').submit();
  });

  if(window.location.href.match(/chats/)) {
    setInterval(function(){
      $.ajax({
        type: 'GET',
        dataType: 'json',
      })
      .done(function(data) {
        var allHtml = ""
        data.forEach(function(chat){
          allHtml += buildHTML(chat);
        });
        $('ul.chats').html(allHtml);
        goBottom();
      })
      .fail(function() {
        alert('error');
      });
    }, 10000);
  };

});
