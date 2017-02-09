$(function() {

  function BuildSearchedUsers (person) {
    var result = '<div class="chat-group-user">'
               + '<p class="chat-group-user__name">'
               + person.name
               + '</p>'
               + '<a class="chat-group-user__btn chat-group-user__btn--add" data-user-id="' + person.id + '">追加'
               + '</a>'
               + '</div>'
    return result
  }

  function BuildAddedUser (){

  }

  function SearchUsers() {
    name = $('#search').val();
    $.ajax({
      url: '/users.json',
      type: 'GET',
      data: { name: name},
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

  $('#search').on('change keyup', SearchUsers);

});
