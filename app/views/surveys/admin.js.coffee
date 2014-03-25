activeForm = $('#survey-builder-nav').find('.active')
$('#survey-builder-yield').find('#' + activeForm.attr('id')).hide()
activeForm.removeClass('active')
$('#survey-builder-nav').find('#survey-builder-home').after('<li id="survey-builder-admin-index" class="active"><a href="#">Admin Index</a>')
$('#survey-builder-yield').append('<div id="survey-builder-admin-index">' + '<%= j render "surveys/admin_index" %></div>')
$('.admin-survey-control').hide()

loadGrid = ->
    $grid = $("#grid")
    $grid.shuffle itemSelector: ".item"
    $grid.on 'done.shuffle', ->
      setTimeout (->
        # TODO - Fix me properly with a way to catch the event
        # TODO - Find a way to make loadGrid Global so I dont repeat this code twice (Currently in survey.js.coffee)
        $grid.shuffle("shuffle", "all")), 10

    $("#filter a").click (event) ->
      event.preventDefault()
      $("#filter li").removeClass("active")
      $(this).parent().addClass("active")
      groupName = $(this).attr("data-group")
      $grid.shuffle("shuffle", groupName)

loadGrid()

