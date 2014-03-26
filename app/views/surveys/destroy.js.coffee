$grid = $("#grid")
deletedId = '<%= deletedId %>'
groupName = $('#filter .active a').attr('data-group')
$grid.find('li[data-id='+deletedId+']').remove()
$grid.shuffle("shuffle", groupName)

