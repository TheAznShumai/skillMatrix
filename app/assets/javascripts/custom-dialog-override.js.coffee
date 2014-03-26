$.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link) # look bellow for implementations
    false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    title = link.attr 'data-title'
    html = """
           <div class="modal fade" id="confirmationDialog">
            <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4>#{title}</h4>
            </div>
            <div class="modal-body">
              <p>#{message}</p>
            </div>
            <div class="modal-footer">
              <a data-dismiss="modal" class="btn">Cancel</a>
              <a data-dismiss="modal" class="btn btn-primary confirm">Delete</a>
            </div>
            </div>
            </div>
          </div>
          """
    $(html).modal()
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)

