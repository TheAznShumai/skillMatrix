$grid = $("#grid")
deletedId = '<%= deletedId %>'
groupName = $('#filter .active a').attr('data-group')
$grid.find('li[data-id='+deletedId+']').remove()
$grid.shuffle("shuffle", groupName)

if ($('#survey-builder-nav').find('#<%= deletedId %>').length > 0)
  $('#survey-builder-nav').find('#<%= deletedId %>').remove()
  $('#survey-builder-yield').find('#<%= deletedId %>').remove()

