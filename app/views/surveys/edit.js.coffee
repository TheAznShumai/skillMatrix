prevActiveForm = $('#survey-builder-nav').find('.active')
prevId = prevActiveForm.attr('id')
prevActiveForm.removeClass('active')
$('#survey-builder-yield').find('#' + prevId).hide()

if ($('#survey-builder-nav').find('#<%= @survey.id %>').length > 0)
  $('#survey-builder-nav').find('#<%= @survey.id %>').addClass('active')
  $('#survey-builder-yield').find('#<%= @survey.id %>').show()
else
  $('#survey-builder-nav').append('<li id="<%= @survey.id %>" class="active"><a href="#"><%= @survey.name %></a>')
  $('#survey-builder-yield').append('<div id="<%= @survey.id %>"><%= j render "surveys/edit" %></div>')

