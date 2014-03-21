uniqueId = Math.random().toString(36).substr(2, 9)

prevActiveForm = $('#survey-builder-nav').find('.active')
prevId = prevActiveForm.attr('id')
prevActiveForm.removeClass('active')
$('#survey-builder-yield').find('#' + prevId).hide()

$('#survey-builder-nav').append('<li id="' + uniqueId + '" class="active"><a href="#">New Survey</a>')
$('#survey-builder-yield').append('<div id="' + uniqueId + '">' + '<%= j render "surveys/new" %></div>')

