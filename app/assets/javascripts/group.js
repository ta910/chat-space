$(document).on("turbolinks:load", function() {

  function BuildSearchedUsers (person) {
    var result = `<div class="chat-group-user">
                    <p class="chat-group-user__name">${person.name}a</p>
                    <a class="chat-group-user__btn chat-group-user__btn--add" data-userid=${person.id} data-username=${person.name}>追加</a>
                  </div>`
    return result
  }

  function BuildAddedUser (id, name){
    var html = `<div class="chat-group-user">
                  <input type="hidden" name="group[user_ids][]" value=${id}>
                  <p class="chat-group-user__name">${name}</p>
                  <a class="chat-group-user__btn chat-group-user__btn--remove" data-userid=${id}>削除</a>
                </div>`
    return html;
  }

  function SearchUsers() {
    name = $('#search').val();
    $.ajax({
      url: '/users',
      type: 'GET',
      data: { name: name },
      dataType: 'json'
    })
    .done(function(data){
      var html = "";
      data.forEach(function(person){
        html += BuildSearchedUsers(person);
      })
      $('#user-search-result').html(html);
    })
    .fail(function() {
      alert('error');
    });
  }

  $('#search').on('keyup', SearchUsers);

  $('#user-search-result').on('click', '.chat-group-user__btn--add', function(){
    var user = $(this);
    var id = user.data('userid');
    var name = user.data('username');
    var html = BuildAddedUser(id, name);

    $('#chat-group-users').append(html);

    user.parent('.chat-group-user').remove();
  });

  $('#chat-group-users').on('click', '.chat-group-user__btn--remove', function(){
    var user = $(this);
    var id = user.data('userid');

    user.parent('.chat-group-user').remove();
  })

});
