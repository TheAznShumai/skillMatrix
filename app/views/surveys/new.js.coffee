id = Math.random().toString(36).substr(2, 9)
$('#survey-builder-nav').find('.active').removeClass('active')
$('#survey-builder-nav').append('<li id="' + id + '" class="active"><a href="#">New Survey</a>')
$('#survey-builder-yield').append('<div id="' + id + '">' + '<%= j render "surveys/new" %></div>')

