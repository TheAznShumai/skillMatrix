# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#loginform').bind 'ajax:success', (e, data, status, xhr) ->
    if data.success
      $('#login').modal('hide')
      location.reload()
    else
      alert('failure!')
 
  $('signupform').bind 'ajax:success', (e, data, status, xhr) ->
    if data.success
      $('#signupform').modal('hide')
      location.reload()
    else
      alert('failure!')
