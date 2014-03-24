# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

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

    $(document).on 'click', '#survey-builder-close', (event) ->
        curActiveForm = $('#survey-builder-nav').find('.active')
        $('#survey-builder-yield').find('#' + curActiveForm.attr('id')).remove()
        curActiveForm.remove()
        $('#survey-builder-nav').find('#survey-builder-home').addClass('active')
        $('#survey-builder-yield').find('#survey-builder-home').show()

    $(document).on 'keyup', '.survey-name', (event) ->
      newTabVal = $(this).find('input').val()
      if newTabVal != ''
        $('.active').find('a').text(newTabVal)
      else
        $('.active').find('a').text('...')

    $ ->
      $grid = $("#grid")
      $grid.shuffle itemSelector: ".item"
      $grid.on 'done.shuffle', ->
          $grid.shuffle("shuffle", "all")

      $("#filter a").click (e) ->
          e.preventDefault()
          $("#filter li").removeClass("active")
          $(this).parent().addClass("active")
          groupName = $(this).attr("data-group")
          $grid.shuffle("shuffle", groupName)

