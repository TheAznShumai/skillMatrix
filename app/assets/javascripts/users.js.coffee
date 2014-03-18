# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#new_user').submit ->
    alert 'clicked submit'

  $('#loginform').bind 'ajax:success', (e, data, status, xhr) ->
    if data.success
      $('#login').modal('hide')
        # $('#sign_in_button').hide()
          # $('#submit_comment').slideToggle(1000, 'easeOutBack' )
    else
      alert('failure!')

