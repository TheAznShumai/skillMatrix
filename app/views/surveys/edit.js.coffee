prevActiveForm = $('#survey-builder-nav').find('.active')
prevId = prevActiveForm.attr('id')
prevActiveForm.removeClass('active')
$('#survey-builder-yield').find('#' + prevId).hide()

$('#survey-builder-nav').append('<li id="<%= @survey.id %>" class="active"><a href="#"><%= @survey.name %></a>')
$('#survey-builder-yield').append('<div id="<%= @survey.id %>"><%= j render "surveys/edit" %></div>')

