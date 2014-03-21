uniqueId = Math.random().toString(36).substr(2, 9)

activeForm = $('#survey-builder-nav').find('.active')
prevId = activeForm.attr('id')
debugger
activeForm.removeClass('active')

$('#survey-builder-yield').find('#' + prevId).hide() if prevId != "survey-builder-home"
$('#survey-builder-nav').append('<li id="' + uniqueId + '" class="active"><a href="#">New Survey</a>')
$('#survey-builder-yield').append('<div id="' + uniqueId + '">' + '<%= j render "surveys/new" %></div>')

