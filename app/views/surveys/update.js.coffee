activeForm = $('#survey-builder-nav').find('.active')
$('#survey-builder-yield').find('#' + activeForm.attr('id')).remove()
activeForm.remove()
$('#survey-builder-nav').find('#survey-builder-home').addClass('active')
$('#survey-builder-yield').find('#survey-builder-home').show()
$('#survey-builder-flash-messages').html('<%= j render "shared/flash_messages" %>')
$(".alert").delay(200).fadeOut(6000);

