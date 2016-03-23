jQuery ->
  $('#username').autocomplete(
    source: $('#username').data('users-source')
    select: (event, ui) ->
      $('#username').val(ui.item.username)
      return false
  ).data('uiAutocomplete')._renderItem = (ul, item) ->
    $('<li />').data('item.autocomplete', item).append("<img class='uk-border-circle' src='" + item.user_photo.autocomplete.url + "' style='margin-right: 15px;'/>" + " " + item.username).appendTo ul