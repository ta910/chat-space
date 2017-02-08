$(function() {

  function BuildSearchedUsers (person) {
    var result = '<div class="chat-group-user">'
               + '<p class="chat-group-user__name">'
               + person.name
               + '</p>'
               + '<a class="chat-group-user__btn chat-group-user__btn--add">'
               + '追加'
               + '</a>'
               + '</div>'
    return result
  }

  function BuildAddedUser (){

  }

  function SearchUsers (){
    name = $('#search').val();
    $.ajax({
      type: 'GET',
      data: { name: name},
      dataType: 'json'
    })
    .done(function(data){
      html = BuildSearchedUsers(data);
      $('<div id="user-search-result">').append(html);
    })
    .fail(function() {
      alert('error');
    });


    html = appendList(person);
    $('<div id="user-search-result">').append(html);
  }

  $('#search').on('click', searchUsers);






});
