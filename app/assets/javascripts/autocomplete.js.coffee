jQuery ->
  $('#username').autocomplete
    source: $('#username').data('users-source')