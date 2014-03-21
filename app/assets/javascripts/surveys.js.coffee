# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
    $(document).on 'click', '.remove_fields', (event) ->
        $(this).closest('fieldset').remove()
        event.preventDefault()

    $(document).on 'click', '.add_fields', (event) ->
        time = new Date().getTime()
        regexp = new RegExp($(this).data('id'), 'g')
        $(this).before($(this).data('fields').replace(regexp, time))
        event.preventDefault()

    $(document).on 'click', '#survey-builder-nav', (event) ->
        navClickedLinkId = event.target.parentElement.id
        prevActiveForm = $('#survey-builder-nav').find('.active')
        prevId = prevActiveForm.attr('id')
        if navClickedLinkId != prevId
            prevActiveForm.removeClass('active')
            $('#' + navClickedLinkId).addClass('active')
            $('#survey-builder-yield').find('#' + prevId).hide()
        $('#survey-builder-yield').find('#' + navClickedLinkId).show()

    $(document).on 'keyup', '.survey-name', (event) ->
      newTabVal = $(this).find('input').val()
      if newTabVal != ''
        $('.active').find('a').text(newTabVal)
      else
        $('.active').find('a').text('...')

