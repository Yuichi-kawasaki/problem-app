$(document).on('turbolinks:load', function(){
  function buildHTML(comment){
    var html = `
                <div class ="username">
                <a href=/users/${comment.user_id}>${comment.user_name}</a>
                <div class="comment-style">
                  ${comment.content}`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').prepend(html);
      $('.message-field__area').val('')
    })
//↓エラー時の処理
    .fail(function(){
      alert("error");
    })
  })
})
